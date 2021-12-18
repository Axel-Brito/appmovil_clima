import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:appmovil/src/pages/estacion_page.dart';
import 'package:appmovil/src/pages/integrantes_page.dart';
import 'package:appmovil/src/pages/home_page.dart';
import 'package:appmovil/src/pages/login_page1.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Widget que inicia la aplicación.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppMovil',
      theme: ThemeData(
        primaryColor: Colors.indigo[900],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      //Rutas globales
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/Estacion': (context) => EstacionPage(),
        '/Integrantes': (context) => IntegrantesPage(),
      },
      //home: HomePage()
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

//Clase que redirecciona al login de google
class _HomePageState extends State<HomePage> {
  bool _isLoggedIn = false;
  GoogleSignInAccount? _userObj;
  GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: firstpage(),
    );
  }
}
