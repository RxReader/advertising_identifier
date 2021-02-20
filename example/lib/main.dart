import 'dart:convert';

import 'package:advertising_identifier/advertising_identifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Advertising Identifier'),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              title: const Text('getAdvertisingIdInfo'),
              onTap: () async {
                try {
                  AdvertisingIdInfo info =
                      await AdvertisingIdManager.getAdvertisingIdInfo();
                  print(json.encode(info));
                } on PlatformException catch (e) {
                  print(e);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
