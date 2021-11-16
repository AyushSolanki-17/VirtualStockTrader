
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

showCupertinoAlertDialog(BuildContext context,String Heading, String Message, Function SuccessFunction){
  showDialog(
      builder: (context) => CupertinoAlertDialog(
        title: Column(
          children: <Widget>[
            Text(Heading),
          ],
        ),
        content: new Text(Message),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text("OK"),
            onPressed: () {
              SuccessFunction();
            },),
          CupertinoDialogAction(
            child: Text("CANCEL"),
            onPressed: () {
              Navigator.of(context).pop();
            },),
        ],
      ), context: context);
}