import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:ffi';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EstacionPage extends StatefulWidget {
  @override
  State<EstacionPage> createState() => _EstacionPageState();
}

class _EstacionPageState extends State<EstacionPage> {
  final items = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];
  String? value;
  double x = 0.0, y = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _estilofondo(),
          Center(
            child: Column(
              children: [
                _estilotitulos(),
                _botoncambio(x, y),
                _map(x, y, value),
                SizedBox(
                  height: 20.0,
                ),
                _botonback(context),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _botoncambio(double x, double y) {
    return Container(
        margin: EdgeInsets.all(16.0),
        width: 300.0,
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: Colors.black, width: 4)),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: value,
            items: items.map(buildMenuItem).toList(),
            onChanged: (value) => setState(() {
              this.value = value;
              if (value == 'Item 1') {
                x = -33.45694;
                y = -70.64827;
                _map(x, y, value);
              } else if (value == 'Item 2') {
                x = 52.52437;
                y = 13.41053;
                _map(x, y, value);
              } else if (value == 'Item 3') {
                x = 52.52437;
                y = 13.41053;
                _map(x, y, value);
              } else if (value == 'Item 4') {
                x = 52.52437;
                y = 13.41053;
                _map(x, y, value);
              }
            }),
          ),
        ));
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(item,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              color: Colors.black)));

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
            Text('Menú Estacion',
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
          alignment: Alignment.center,
          height: 60.0,
          width: 60.0,
          decoration: BoxDecoration(
              color: Color.fromRGBO(62, 66, 107, 0.7),
              borderRadius: BorderRadius.circular(20.0)),
          child: Column(
            children: const <Widget>[
              SizedBox(
                height: 8.0,
              ),
              CircleAvatar(
                backgroundColor: Colors.green,
                radius: 20.0,
                child: Icon(Icons.backspace_rounded,
                    color: Colors.white, size: 20.0),
              ),
            ],
          ),
        )));
  }

  Widget _map(double x, double y, String? value) {
    return Container(
      height: 300.0,
      child: GoogleMap(
        mapType: MapType.normal,
        myLocationEnabled: true,
        initialCameraPosition: CameraPosition(
          target: LatLng(x, y),
          zoom: 5.0,
        ),
      ),
    );
  }
}
