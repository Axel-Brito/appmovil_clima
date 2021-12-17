import 'package:flutter/material.dart';

class EstimacionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _estilofondo(),
          Column(
            children: [
              _estilotitulos(),
              _botonback(context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _estilofondo() {
    final fondo = Container(
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
    return Container(
      child: fondo,
    );
  }

  Widget _estilotitulos() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Text('Menú Estimación',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }

  Widget _botonback(context) {
    return TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: ClipRect(
            child: Container(
          alignment: Alignment.bottomCenter,
          height: 60.0,
          width: 60.0,
          decoration: BoxDecoration(
              color: Color.fromRGBO(62, 66, 107, 0.7),
              borderRadius: BorderRadius.circular(20.0)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const <Widget>[
              SizedBox(height: 5.0),
              CircleAvatar(
                backgroundColor: Colors.green,
                radius: 20.0,
                child: Icon(Icons.backspace_rounded,
                    color: Colors.white, size: 20.0),
              ),
              SizedBox(height: 5.0)
            ],
          ),
        )));
  }
}
