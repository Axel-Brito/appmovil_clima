import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:appmovil/src/pages/estacion_page.dart';
import 'package:appmovil/src/pages/estimacion_page.dart';
import 'package:appmovil/src/pages/integrantes_page.dart';
import 'package:appmovil/src/pages/home_page.dart';
import 'package:appmovil/src/pages/login_page1.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppMovil',
      theme: ThemeData(
        primaryColor: Colors.indigo[900],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/Estacion': (context) => EstacionPage(),
        '/Estimacion': (context) => EstimacionPage(),
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
