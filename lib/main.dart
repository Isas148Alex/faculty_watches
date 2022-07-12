///Точка входа в приложение

import 'package:flutter/material.dart';
import 'API_data.dart';
import 'faculty_watches_app.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
      //Здесь все настройки в отдельном файле, который, по понятным причинам, не выложен в git
      apiKey: API_Data.apiKey,
      appId: API_Data.appId,
      messagingSenderId: API_Data.messagingSenderId,
      projectId: API_Data.projectId,
      storageBucket: API_Data.storageBucket,
      authDomain: API_Data.authDomain,
    ));
  } on Exception catch (_) {
    Firebase.app();
  }

  runApp(const FacultyWatchesApp());
}
