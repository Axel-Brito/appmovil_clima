import 'package:http/http.dart' as http;

//intento de conexión a ApiRest, Backend no funciona
Future<String> getRequest() async {
  String ruta = "10.0.2.2:3000";
  var url = Uri.parse('http://$ruta/grupo-g/climaroutes');
  var response = await http.get(url);
  var _responsebody = response.body;
  return response.body;
}
