import 'dart:async';

import 'package:app_review/app_review.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  initState() {
    super.initState();
    AppReview.getAppID.then((onValue) {
      setState(() {
        appID = onValue;
      });
      print("App ID" + appID);
    });
  }

  Future<Null> showAlertPopup(String title, String detail) async {
    void showDemoDialog<T>({BuildContext context, Widget child}) {
      showDialog<T>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => child,
      ).then<void>((T value) {
        if (value != null) {}
      });
    }

    return showDemoDialog<Null>(
        context: context,
        child: new AlertDialog(
            title: new Text(title),
            content: new Text(
              detail,
            ),
            actions: <Widget>[
              new FlatButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ]));
  }

  String appID = "";
  String output = "";

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('App Review'),
        ),
        body: new SingleChildScrollView(
          child: new ListBody(
            children: <Widget>[
              new Container(
                height: 40.0,
              ),
              new ListTile(
                leading: new Icon(Icons.info),
                title: new Text('App ID'),
                subtitle: new Text(appID),
                  onTap: () {
                  AppReview.getAppID.then((onValue) {
                    setState(() {
                      output = onValue;
                    });
                    print(onValue);
                  });
                },
              ),
              new Divider(
                height: 20.0,
              ),
              new ListTile(
                leading: new Icon(
                  Icons.shop,
                ),
                title: new Text('View Store Page'),
                onTap: () {
                  AppReview.storeListing.then((onValue) {
                    setState(() {
                      output = onValue;
                    });
                    print(onValue);
                  });
                },
              ),
              new Divider(
                height: 20.0,
              ),
              new ListTile(
                leading: new Icon(
                  Icons.star,
                ),
                title: new Text('Request Review'),
                onTap: () {
                  AppReview.requestReview.then((onValue) {
                    setState(() {
                      output = onValue;
                    });
                    print(onValue);
                  });
                },
              ),
              new Divider(
                height: 20.0,
              ),
              new ListTile(
                leading: new Icon(
                  Icons.note_add,
                ),
                title: new Text('Write a New Review'),
                onTap: () {
                  AppReview.writeReview.then((onValue) {
                    setState(() {
                      output = onValue;
                    });
                    print(onValue);
                  });
                },
              ),
              new Divider(
                height: 20.0,
              ),
              new ListTile(
                title: new Text(output),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
