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

final mensaje = TextEditingController(); //controlador
final fire = FirebaseFirestore.instance;

class _chatState extends State<chat> {
final FocusNode varFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          Text((autenticacion().usuario?.email).toString()),
          VerticalDivider(),
          VerticalDivider(),
          VerticalDivider(),
          IconButton(onPressed: () {
            autenticacion().cerrarSesion();
          }, 
          icon: Icon(Icons.login_outlined))
        ],)
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(  //Expanded: para que no se destruya la pantalla
                    child: TextField(
                      controller: mensaje,
                      focusNode: varFocus,
                      decoration: InputDecoration(
                        hintText: "Escribir Mensaje...", //Mensaje Transparente antes de la transcripcion
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
                      if (mensaje.text.isNotEmpty) { //si mensaje no es vacio
                        varFocus.requestFocus();
                        fire.collection("Chat").doc().set( //creación de documentos de coleccion
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
                child: Expanded(child: messages()), //llamo e imprimo mensajes
              )
            ],
          ),
      ),
    );
  }
}