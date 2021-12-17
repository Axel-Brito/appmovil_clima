import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:auth_buttons/auth_buttons.dart';

import 'package:appmovil/src/pages/home_page.dart';

class firstpage extends StatefulWidget {
  @override
  _firstpageState createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {
  GoogleSignInAccount? _userObj;
  GoogleSignIn _googleSignIn = GoogleSignIn();
  String url = '';
  String name = '';
  String email = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'App',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Text(
                'Clima',
                style: TextStyle(
                  color: Colors.yellow[700],
                ),
              ),
            ],
          ),
        ),
        body: Stack(children: [
          _estilofondo(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0),
                    ),
                    child: Image(
                      height: 180.0,
                      image: AssetImage('assets/imagen_login.jpg'),
                      isAntiAlias: true,
                      fit: BoxFit.fill,
                    )),
                SizedBox(
                  height: 50.0,
                ),
                GoogleAuthButton(
                  text: 'Ingresar con Google',
                  onPressed: () {
                    _googleSignIn.signIn().then((userData) {
                      setState(() {
                        _userObj = userData;
                        url = _userObj!.photoUrl.toString();
                        name = _userObj!.displayName.toString();
                        email = _userObj!.email;
                      });
                      if (userData != null) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                second(url: url, name: name, email: email),
                          ),
                        );
                      }
                    }).catchError((e) {
                      print(e);
                    });
                  },
                ),
              ],
            ),
            heightFactor: 20.0,
          )
        ]));
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
}
