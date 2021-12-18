import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:ffi';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EstacionPage extends StatefulWidget {
  @override
  State<EstacionPage> createState() => _EstacionPageState();
}

class _EstacionPageState extends State<EstacionPage> {
  //Lista de estaciones
  final items = [
    'Arica',
    'Iquique',
    'Antofagasta',
    'Copiapó',
    'La Serena',
    'Valparaíso',
    'Rancagua',
    'Talca',
    'Chillán',
    'Concepción',
    'Temuco',
    'Valdivia',
    'Puerto Montt',
    'Coyhaique',
    'Punta Arenas',
    'Santiago',
  ];
  //value
  String? value;

  //definicion de latitudes y longitudes inicales
  var x = -33.45694, y = -70.64827;
  final LatLng fromPoint = LatLng(-33.45694, -70.64827);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        //Stack de widgets
        children: <Widget>[
          _estilofondo(),
          Center(
            child: Column(
              children: [
                _estilotitulos(),
                _botoncambio(x, y),
                _map(fromPoint, value),
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
          //Boton desplegable que muestra las estaciones por nombre
          child: DropdownButton<String>(
            value: value,
            items: items.map(buildMenuItem).toList(),
            onChanged: (value) => setState(() {
              this.value = value;
              //Cambio de valor de latitud y longitud
              if (value == 'Arica') {
                x = -18.4746;
                y = -70.29792;
              } else if (value == 'Iquique') {
                x = -20.21326;
                y = -70.15027;
              } else if (value == 'Antofagasta') {
                x = -23.65236;
                y = -70.3954;
              } else if (value == 'Copiapó') {
                x = -27.36679;
                y = -70.3314;
              } else if (value == 'La Serena') {
                x = -29.90453;
                y = -71.24894;
              } else if (value == 'Valparaíso') {
                x = 33.036;
                y = -71.62963;
              } else if (value == 'Rancagua') {
                x = -34.17083;
                y = -70.74444;
              } else if (value == 'Talca') {
                x = -35.4264;
                y = -71.65542;
              } else if (value == 'Chillán') {
                x = -36.60664;
                y = -72.10344;
              } else if (value == 'Concepción') {
                x = -36.82699;
                y = -73.04977;
              } else if (value == 'Temuco') {
                x = -38.73965;
                y = -72.59842;
              } else if (value == 'Valdivia') {
                x = -39.81422;
                y = -73.24589;
              } else if (value == 'Puerto Montt') {
                x = -41.4693;
                y = -72.94237;
              } else if (value == 'Coyhaique') {
                x = -45.57524;
                y = -72.06619;
              } else if (value == 'Punta Arenas') {
                x = -53.15483;
                y = -70.91129;
              } else if (value == 'Santiago') {
                x = -33.45694;
                y = -70.64827;
              }
            }),
          ),
        ));
  }

  //Despliegue de Menú deplegable
  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(item,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              color: Colors.black)));

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

  //Estilo de titulos
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

  //Creación de boton para salir
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

  //Widget de mapa de google
  Widget _map(fromPoint, String? value) {
    return Container(
      height: 300.0,
      child: GoogleMap(
        mapType: MapType.normal,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        initialCameraPosition: CameraPosition(
          target: LatLng(x, y),
          zoom: 10.0,
        ),
        markers: _createMarkers(),
      ),
    );
  }

  //Creación de pin de ubicación
  Set<Marker> _createMarkers() {
    var tmp = Set<Marker>();
    tmp.add(Marker(markerId: MarkerId('fromPoint'), position: fromPoint));
    return tmp;
  }
}
