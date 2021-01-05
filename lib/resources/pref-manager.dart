import 'dart:async';
import 'dart:convert';
import 'dart:core' as prefix0;
import 'dart:core';
import 'package:shared_preferences/shared_preferences.dart';


class PrefManager {

  static PrefManager mInstance;
  static SharedPreferences _prefs;

  static  Future<PrefManager> getInstance() async {
    if(mInstance == null){
      mInstance = PrefManager();
      _prefs = await SharedPreferences.getInstance();
    }
    return PrefManager();
  }

  Future<bool> remove(String key) async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs.remove(key);
  }

  Future<bool> set(String key, dynamic value) async {
    _prefs = await SharedPreferences.getInstance();
    if (value is int) {
      return await _prefs.setInt(key, value);
    } else if (value is double) {
      return await _prefs.setDouble(key, value);
    } else if (value is String) {
      return await _prefs.setString(key, value);
    } else if (value is bool) {
      return await _prefs.setBool(key, value);
    }
    return false;
  }

  dynamic get(String key, dynamic defaultVal) async {
    _prefs = await SharedPreferences.getInstance();
    if (defaultVal is int) {
      return (_prefs.getInt(key) ?? defaultVal);
    } else if (defaultVal is double) {
      return (_prefs.getDouble(key) ?? defaultVal);
    } else if (defaultVal is String) {
      return (_prefs.getString(key) ?? defaultVal);
    } else if (defaultVal is bool) {
      return (_prefs.getBool(key) ?? defaultVal);
    }
  }

  setString(String key, String value) async {
    _prefs = await SharedPreferences.getInstance();
    await _prefs.setString(key, value);
  }

  getString(String key) async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs.getString(key);
  }

  Future clear() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs.clear();
  }

  Future addToFavorites(int id) async {
    _prefs = await SharedPreferences.getInstance();
    String favorites = await getFavorites();
    List<dynamic> favList = List();
    favList = json.decode(favorites);
    favList.add(id);
    await _prefs.setString("favorites", json.encode(favList));
  }

  Future removeFromFavorites(int id) async {
    _prefs = await SharedPreferences.getInstance();
    String favorites = await getFavorites();
    List<dynamic> favList = List();
    favList = json.decode(favorites);
    favList.remove(id);
    await _prefs.setString("favorites", json.encode(favList));
  }

  Future isFavorites(String id) async {
    String favorites = await getFavorites();
    prefix0.print(favorites);
    return favorites.contains(id + ",") || favorites.contains(id + "]");
  }

  getFavorites() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs.getString("favorites") ?? "[]";
  }


  Future addToWishList(Map product) async {
    _prefs = await SharedPreferences.getInstance();
    List<dynamic> wishList = await getWishList();
    wishList.add(product);
    await _prefs.setString("wishlist", json.encode(wishList));
  }

  Future removeFromWishList(Map product) async {
    _prefs = await SharedPreferences.getInstance();
    List<dynamic> wishList = await getWishList();
    wishList.removeWhere((element) => element["id"] == product["id"]);
    await _prefs.setString("wishlist", json.encode(wishList));
  }

  Future setWishlist(List wishlist) async {
    await _prefs.setString("wishlist", json.encode(wishlist));
  }

  Future<bool> isInWishList(Map product) async {
    List<dynamic> wishList = await getWishList();
    Map found = wishList.firstWhere((element) => element["id"] == product["id"],orElse: ()=>null);
    print("PrefManager : ${found != null}");
    return found != null;
  }

  getWishList() async {
    _prefs = await SharedPreferences.getInstance();
    String cart = _prefs.getString("wishlist") ?? "[]";
    List<dynamic> wishList = json.decode(cart);
    return wishList ?? [];
  }

}
