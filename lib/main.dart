import 'package:flutter/material.dart';
import 'package:reto3_flutter/interfax/home.dart';
import 'package:firebase_core/firebase_core.dart';

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); //Llamado Plugins Flutter
  await Firebase.initializeApp ( //inicializo FireBase
    options: FirebaseOptions (
      apiKey: "AIzaSyATK8aQa7NqPweHe8EiyurOzxo8qJHsRCg",
      authDomain: "reto3-rosa.firebaseapp.com",
      projectId: "reto3-rosa",
      storageBucket: "reto3-rosa.appspot.com",
      messagingSenderId: "361987418804",
      appId: "1:361987418804:web:d4d1dd1180a996d83bc5e1",
      measurementId: "G-KF1FYKSLM2"
    ));

  runApp(const MyApp());
}


