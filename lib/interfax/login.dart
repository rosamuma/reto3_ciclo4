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
        title: Text("Login / Registro")
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image(image: 
                NetworkImage("https://idegrafico.com/wp-content/uploads/2017/03/Las-imagenes-raw-son-los-negativos-digitales.jpg")),
            ),
            Divider(),
            TextField(
              controller: em,
              decoration: InputDecoration(
                label: Text("Email"),
                suffixIcon: Icon(Icons.email)),
            ),
            TextField(
              obscureText: true,
              controller: pass,
              decoration: InputDecoration(
                label: Text("Password"),
                suffixIcon: Icon(Icons.key_rounded)),
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
              icon: Icon(Icons.person_add_alt_rounded), 
              label: Text("Registrar Usuario")),
          ]
        ),
      ),

    );
  }
}