import 'package:cheapp_and_tasty/app.dart';
import 'package:cheapp_and_tasty/features/auth/config/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

// google maps api key
// AIzaSyCxUB2zKCIo0BZQXTRNdzEL6NRFhzBFfVM
