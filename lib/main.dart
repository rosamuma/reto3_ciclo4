import 'package:flutter/material.dart';
import 'package:reto3_flutter/interfax/home.dart';
import 'package:firebase_core/firebase_core.dart';

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp (
    options: FirebaseOptions (
      apiKey: "AIzaSyATK8aQa7NqPweHe8EiyurOzxo8qJHsRCg",
      projectId: "reto3-rosa",
      messagingSenderId: "361987418804",
      appId: "1:361987418804:web:be0db0cdfeefcebb3bc5e1",
    ));

  runApp(const MyApp());
}


