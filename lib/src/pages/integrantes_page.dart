import 'package:flutter/material.dart';

class IntegrantesPage extends StatelessWidget {
  final estilotexto = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  final estilotexto1 = TextStyle(fontSize: 15.0, color: Colors.white70);
  final String infoText1 = "axel.britog@utem.cl\n";
  final String infoText2 = "cristobal.gonzalezg@gmail.com\n";
  final String infoText3 = "francisco.diazh@gmail.com\n";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _estilofondo(),
          Column(
            children: [
              const Image(
                  image: NetworkImage(
                      'https://lamenteesmaravillosa.com/wp-content/uploads/2017/11/grupo-de-personas-con-un-puzzle-600x300.jpg')),
              _estilotitulo(),
              //Creacion de primer integrante
              _estilotexto(
                  'assets/integrante3.png', 'Axel Brito González', infoText1),
              //Creacion de segundo integrante
              _estilotexto(
                  'assets/integrante1.jpeg', 'Cristobal González', infoText2),
              const SizedBox(
                height: 15.0,
              ),
              //Creacion de tercer integrante
              _estilotexto(
                  'assets/integrante2.jpeg', 'Francisco Diaz', infoText3),
              const SizedBox(
                height: 15.0,
              ),
              _botonback(context),
            ],
          ),
        ],
      ),
    );
  }

  //Estilo del fondo
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

  //Definicion de estilo de titulo
  Widget _estilotitulo() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Text('Integrantes',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 15.0,
            ),
          ],
        ),
      ),
    );
  }

  //Definicion de estilo de texto
  Widget _estilotexto(String routeimage, String nombre, String info) {
    return Row(
      children: <Widget>[
        const SizedBox(
          width: 10.0,
        ),
        ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.asset(
              routeimage,
              height: 100.0,
              width: 100.0,
            )),
        const SizedBox(
          width: 10.0,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              nombre,
              style: estilotexto,
            ),
            Text(info, style: estilotexto1)
          ],
        ),
      ],
    );
  }

  //Creacion de boton para volver a pagina principal
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
