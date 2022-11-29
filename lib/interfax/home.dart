import 'package:flutter/material.dart';
import 'package:reto3_flutter/auth/autenticacion.dart';
import 'package:reto3_flutter/interfax/chat.dart';
import 'package:reto3_flutter/interfax/login.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: autenticacion().estadoLogin, 
      builder: (context, respuesta){
        if (respuesta.hasData){
          return chat(); //cuando ya está autenticado
        } else {
          return login(); //para loguearse
        }
      });

  }
}