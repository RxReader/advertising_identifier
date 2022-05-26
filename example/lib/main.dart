import 'dart:convert';

import 'package:advertising_identifier/advertising_identifier.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _MyAppState();
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
              title: Text('getAdvertisingIdInfo'),
              onTap: () async {
                try {
                  final AdvertisingIdInfo info = await AdvertisingIdentifier
                      .instance
                      .getAdvertisingIdInfo();
                  if (kDebugMode) {
                    print(json.encode(info));
                  }
                } on PlatformException catch (e) {
                  if (kDebugMode) {
                    print(e);
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
