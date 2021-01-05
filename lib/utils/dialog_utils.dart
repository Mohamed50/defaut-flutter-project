import '../view/static/translatable-text.dart';
import 'package:flutter/material.dart';


showMessageDialog(BuildContext context, String message) async {
  return await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TranslatableText(
                  message,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                textColor: Colors.white,
                color: Theme.of(context).primaryColor,
                child: TranslatableText(
                  "OK",
                ),
                onPressed: () {
                  Navigator.of(context).pop(0);
                },
              ),
            ],
          ),
        );
      });
}

showConfirmDialog(BuildContext context,{String title, String positiveLabel, String negativeLabel}) async {
  return await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context){
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
          ),
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TranslatableText(
              title ?? "Do you want to save update?",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                          width: 1,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    textColor: Theme.of(context).primaryColor,
                    color: Colors.white,
                    child: TranslatableText(
                        negativeLabel ?? "Cancel"
                    ),
                    onPressed: () async {
                      Navigator.of(context).pop(false);
                    },
                  ),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    textColor: Colors.white,
                    color: Theme.of(context).primaryColor,
                    child: TranslatableText(
                        positiveLabel ?? "Save"
                    ),
                    onPressed: (){
                      Navigator.of(context).pop(true);
                    },
                  )
                ],
              ),
            ],
          ),
        );
      }
  );
}
showLoadingDialog(BuildContext context) async {
  return await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              TranslatableText(
                "Loading",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              CircularProgressIndicator()
            ],
          ),
        );
      });
}
