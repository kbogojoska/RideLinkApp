import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class FirebaseService {
  static bool _initialized = false;
  static Completer<void>? _initializationCompleter;

  static Future<void> initialize() async {
    if (_initialized) return;
    if (_initializationCompleter != null) {
      return _initializationCompleter!.future;
    }

    _initializationCompleter = Completer<void>();

    try {
      await dotenv.load(fileName: ".env");
      debugPrint('Dotenv loaded.');

      try {
        Firebase.app();
      } on FirebaseException catch (e) {
        if (e.code == 'no-app') {
          await Firebase.initializeApp(
            name: "dev-project",
            options: FirebaseOptions(
              apiKey: dotenv.get('API_KEY'),
              appId: dotenv.get('APP_ID'),
              messagingSenderId: dotenv.get('PROJECT_NUMBER'),
              projectId: dotenv.get('PROJECT_ID'),
            ),
          );
        } else {
          rethrow;
        }
      }


      _initialized = true;
      _initializationCompleter!.complete();
    } catch (e) {
      _initializationCompleter!.completeError(e);
      _initializationCompleter = null;
      debugPrint('Firebase init error: $e');
      rethrow;
    }
  }
}