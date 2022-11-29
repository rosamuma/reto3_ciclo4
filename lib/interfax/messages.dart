import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:reto3_flutter/auth/autenticacion.dart';

class messages extends StatefulWidget {
  const messages({super.key});

  @override
  State<messages> createState() => _messagesState();
}

class _messagesState extends State<messages> {
  //Stream: variable de cambio de flujo
  //querysnapshot: consulta BD

  Stream<QuerySnapshot> resp_consulta = FirebaseFirestore.instance
  .collection("Chat")
  .orderBy("Time", descending: true)
  .snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(  //StreamBuilder: permite adicionar un flujo(Stream, builder)
      stream: resp_consulta,
      builder: 
          (context, AsyncSnapshot<QuerySnapshot> respuesta){
        return respuesta.data?.docs.isEmpty == false 
        ? ListView.builder(
            itemCount: respuesta.data!.docs.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                color: (autenticacion().usuario?.email).toString() == 
                  respuesta.data!.docs[index].get("Email").toString() 
                  ? Colors.green[100]
                  : Colors.red[100],
                child: ListTile(
                  title: Text(
                    respuesta.data!.docs[index].get("Mensaje"),
                    textAlign: (autenticacion().usuario?.email).toString() == 
                        respuesta.data!.docs[index].get("Email").toString()
                      ? TextAlign.right
                      : TextAlign.left
                  ),            
                  subtitle: Text(
                    respuesta.data!.docs[index].get("Email"),
                    textAlign: (autenticacion().usuario?.email).toString() == 
                        respuesta.data!.docs[index].get("Email").toString()
                      ? TextAlign.right
                      : TextAlign.left
                  ),
              ),
            );
            },
          )
          : Center(child: CircularProgressIndicator(),
          );
        });
  }
}