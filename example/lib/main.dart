import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:faceid/faceid.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _faceidPlugin = Faceid();

  bool _isAuthenticated = false;

  void _authenticate() async {
    try {
      final isAuthenticated = await _faceidPlugin.authenticate();
      setState(() {
        _isAuthenticated = isAuthenticated;
      });
    } on PlatformException catch (e) {
      print('Error: ${e.message}');
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: [
              InkWell(
                onTap: _authenticate,
                child: const Text('Tap to get access'),
              ),
              _isAuthenticated
                  ? const Text('Authenticated')
                  : const Text('Not authenticated'),
            ],
          ),
        ),
      ),
    );
  }
}
