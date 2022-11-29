import 'package:flutter/material.dart';
import 'package:reto3_flutter/auth/autenticacion.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

final em = TextEditingController();
final pass = TextEditingController();

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registro / Login")
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: em,
              decoration: InputDecoration(
                label: Text("Email")),
            ),
            TextField(
              obscureText: true,
              controller: pass,
              decoration: InputDecoration(
                label: Text("Contraseña")),
            ),
            Divider(),
            ElevatedButton.icon(
              onPressed: (){
                autenticacion().inicioSesion(
                  usuarioEmail: em.text, passwordUser: pass.text);
              }, 
              icon: Icon(Icons.login), 
              label: Text("Iniciar Sesión")),
            Divider(),
            ElevatedButton.icon(
              onPressed: (){
                autenticacion().crearUsuario(
                  usuarioEmail: em.text, passwordUser: pass.text);
              }, 
              icon: Icon(Icons.person_add_alt), 
              label: Text("Crear Usuario")),
          ]
        ),
      ),

    );
  }
}