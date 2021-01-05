import 'dart:convert';
import 'dart:io';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

colorFromString(String color){
  return Color(int.parse("0xFF"+color));
}

bool isValidEmail(String email) {
  return RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(email);
}

String getReadableDuration(int seconds){
  int minutes = (seconds / 60).truncate();
  String readableMinutes;
  if(minutes <= 9)
    readableMinutes = "0$minutes";
  else
    readableMinutes = "$minutes";
  String readableSeconds;
  if(seconds % 60 <= 9)
    readableSeconds = "0${seconds%60}";
  else
    readableSeconds = "${seconds%60}";
  return readableMinutes + ":" + readableSeconds;
}

share(BuildContext context,String title, String content, String url){
  final RenderBox box = context.findRenderObject();
  Share.share("$content\n$url",
      subject: title,
      sharePositionOrigin:
      box.localToGlobal(Offset.zero) &
      box.size);
}


Future readFileContent(File file) async {
  try {
    return await file.readAsString();
  } catch (e) {
    return "Sorry something went wrong";
  }
}

Future downloadFile(String url,String fileName, String extension) async {
  File cachedFile = await DefaultCacheManager().getSingleFile(url);
  Directory downloadDirectory = await getLocalDownloadDirectory();
  File downloadedFile = await cachedFile.copy("$downloadDirectory.path / $fileName .$extension");
  print("============================> filePath: " + downloadedFile.path);
}

Future getFileFromInternet(String url) async {
  return await DefaultCacheManager().getSingleFile(url);
}

Future<Directory> getLocalDownloadDirectory() async {
  Directory directory = await getApplicationDocumentsDirectory();
  Directory downloadDirectory = Directory(directory.path + "/downloads");
  if(!await downloadDirectory.exists())
    downloadDirectory.create();
  return downloadDirectory;
}

launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

bool isValidPhone(String phone){
  return RegExp(r'[0-9]{9}').hasMatch(phone);
}

getBasicAuth(String username, String password){
  return 'Basic ' + base64Encode(utf8.encode('$username:$password'));
}