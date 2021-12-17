import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:math';
import 'dart:ui';

import 'package:appmovil/src/pages/integrantes_page.dart';
import 'package:appmovil/main.dart';
import 'package:appmovil/src/pages/login_page1.dart';

class second extends StatefulWidget {
  String url;
  String name;
  String email;
  second({
    required this.url,
    required this.name,
    required this.email,
  });
  @override
  PrincipalState createState() => PrincipalState(
        url: url,
        name: name,
        email: email,
      );
}

class PrincipalState extends State<second> {
  String url;
  String name;
  String email;
  PrincipalState({
    required this.url,
    required this.name,
    required this.email,
  });

  final route1 = MaterialPageRoute(builder: (context) => IntegrantesPage());
  GoogleSignIn _googleSignIn = GoogleSignIn();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _estilofondo(),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _estilotitulos(),
                SizedBox(
                  height: 50.0,
                ),
                _estilobotones(context)
              ],
            ),
          ),
          _botonlogout(context),
        ],
      ),
    );
  }

  Widget _estilofondo() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: FractionalOffset(0.0, 0.3),
              end: FractionalOffset(0.0, 1.0),
              colors: [
            Color.fromRGBO(139, 0, 139, 1.0),
            Color.fromRGBO(75, 0, 130, 1.0)
          ])),
    );
  }

  Widget _estilotitulos() {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Text('Menú Principal',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 15.0),
          ],
        ),
      ),
    );
  }

  Widget _estilobotones(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          children: <Widget>[
            _crearboton(context, Colors.blue, Icons.border_all, 'Estación',
                '/Estacion'),
            SizedBox(
              height: 40.0,
            ),
            _crearboton(context, Colors.black, Icons.people_outline_rounded,
                'Integrantes', '/Integrantes'),
          ],
        ),
      ),
    );
  }

//_crearboton(Colors.blue, Icons.border_all, 'General'),
  Widget _crearboton(
      context, Color color, IconData icono, String texto, String ruta) {
    return TextButton(
      child: ClipRect(
        child: Container(
          height: 120.0,
          width: 120.0,
          margin: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
              color: const Color.fromRGBO(62, 66, 107, 0.7),
              borderRadius: BorderRadius.circular(20.0)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              const SizedBox(height: 5.0),
              CircleAvatar(
                backgroundColor: color,
                radius: 35.0,
                child: Icon(icono, color: Colors.white, size: 30.0),
              ),
              Text(texto,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  )),
              const SizedBox(height: 5.0)
            ],
          ),
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
        shadowColor: MaterialStateProperty.all(Colors.transparent),
      ),
      onPressed: () {
        Navigator.pushNamed(context, ruta);
      },
    );
  }

  Widget _botonlogout(context) {
    return SafeArea(
      child: TextButton(
        child: Column(children: [
          Container(
              height: 40.0,
              width: 40.0,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.keyboard_backspace_sharp,
                  color: Colors.green,
                ),
              )),
          Text('Logout'),
        ]),
        onPressed: () {
          _googleSignIn.signOut().then((value) {
            setState() {}
            ;
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => (HomePage()),
              ),
            );
          }).catchError((e) {});
        },
      ),
    );
  }
}
