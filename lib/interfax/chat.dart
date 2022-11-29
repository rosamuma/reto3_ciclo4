import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:reto3_flutter/auth/autenticacion.dart';
import 'package:reto3_flutter/interfax/messages.dart';

class chat extends StatefulWidget {
  const chat({super.key});

  @override
  State<chat> createState() => _chatState();
}

final mensaje = TextEditingController();
final fire = FirebaseFirestore.instance;

class _chatState extends State<chat> {
final FocusNode varFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text((autenticacion().usuario?.email).toString())
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: mensaje,
                      focusNode: varFocus,
                      decoration: InputDecoration(
                        hintText: "Mensaje Chat",
                      ),
                      onSubmitted: (valor){
                        if (mensaje.text.isNotEmpty) {
                          varFocus.requestFocus();
                        fire.collection("Chat").doc().set(
                          {
                          "Mensaje": mensaje.text,
                          "Time": DateTime.now(),
                          "Email": (autenticacion().usuario?.email).toString()
                          }
                        );
                        mensaje.clear();
                        }
                      },
                    ),
                  ),
                  IconButton(
                    onPressed: (){
                      if (mensaje.text.isNotEmpty) {
                        varFocus.requestFocus();
                        fire.collection("Chat").doc().set(
                          {
                          "Mensaje": mensaje.text,
                          "Time": DateTime.now(),
                          "Email": (autenticacion().usuario?.email).toString()
                          }
                      );
                      mensaje.clear();
                      }
                    }, 
                  icon: Icon(Icons.send)
                  )
                ],
              ),
              Container(
                child: Expanded(child: messages()),
              )
            ],
          ),
      ),
    );
  }
}