// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../config/urls/urls.dart';

// Tipos de PETICIONES que se pueden realizar
// ignore: constant_identifier_names
enum TypeHTPP { GET, POST, PUT, DELETE }

// Tipos de errores existentes
enum TypeHTTPErrors { token, common, internetConnection }

// Los headers default de una petición
Map<String, String> _headersDefault = {
  'Content-Type': 'application/json',
  'Accept': '*/*',
};

/* Este tipo de respuesta o retorno esta pensada para que se pueda
 proporcionar mas informacion hacia el frontend y con esto pueda realizar
 acciones en base a los tipos de errores que reciba.*/
class ReturnHttp {
  TypeHTTPErrors? error;
  String? message;
  Object? data;
  ReturnHttp({
    required this.error,
    required this.message,
    required this.data,
  });

  @override
  String toString() =>
      'ReturnHttp(\nerror: $error,\nmessage: $message,\ndata: $data)';
}

/* La funcion de esta clase es para verificar si el usuario
quiere reemplazar los _headersDefault por algunos headers que el mismo
necesite*/
class Headers {
  bool replaceHeaders;
  Map<String, String> headersData;
  Headers({
    required this.replaceHeaders,
    required this.headersData,
  });
}

/* Con motivos de acceder al tokenAuth instanciamos la clase de
FlutterSecureStorage */
// const storage = FlutterSecureStorage();

Future<ReturnHttp> httpBase(
    {required TypeHTPP type,
    required String path,
    String? baseUrl,
    Map<String, String>? queryParameters,
    Headers? headers,
    Map<String, dynamic>? body,
    bool authorization = false}) async {
  /* Solamente si hay headers extra se agregaran al _headersDefault.*/
  if (headers != null) _headersDefault.addAll(headers.headersData);

  /* Solamente si el parametro replaceHeaders es existe y es true
  se remplaza los headers por los _headersDefault.*/
  if (headers != null) {
    if (headers.replaceHeaders) {
      _headersDefault = headers.headersData;
    }
  }

  ////////////////////////////////////

  /* Si se requiere de algun tipo de autorizacion (En este caso es con
  Bearer authentication) se coloca dentro de los headers con su respectivo
  token de accesso. Si este no existe dentro del dispositivo te regresa un 
  error.
  NO NECESARIO PARA ESTA IMPLEMENTACIÓN
  */

  // if (authorization) {
  //   String? token = (await storage.read(key: 'tokenAuth'));
  //   if (token == null) {
  //     return ReturnHttp(
  //         error: TypeHTTPErrors.token,
  //         message: 'No existe token en su dispositivo.',
  //         data: null);
  //   }
  //   _headersDefault['Authorization'] = 'Bearer $token';
  // }

  ////////////////////////////////////

  /* El response se crea solamente para reasignarle el valor una vez
  la peticion ha sido completada*/
  http.Response response = http.Response('', 500);

  /* Esto es para verificar si el servicio al que consultaremos es 
  un servicio externo al nuestro se recomienda colocar en `BASE_URL`
  la url del servidor privado que se tenga.*/
  baseUrl ??= BASE_URL;

  /* En esta parte creamos la variable URL que llevara el cuerpo de la
  petición*/
  final url = Uri.https(baseUrl, path, queryParameters);

  /* Este try y catch es para que al momento que una peticion te arroje
  algún error la app no se estanque y pueda tener ese manejo de errores
  */
  try {
    /* La primera verificación que se hace es la de internet se recomienda
      colocar en el else una notificación para hacercelo saber al usuario*/
    if (await InternetConnectionChecker().hasConnection) {
      /* Verificamos que tipo de petición viene realizará el usuario y en base
      a eso utilizamos http*/
      switch (type) {
        case TypeHTPP.GET:
          /* La petición GET solamente puede llevar queryparams y headers
          por regla de funciones HTTP*/
          response = await http.get(url, headers: _headersDefault);
          break;
        case TypeHTPP.POST:
          response = await http.post(url,
              headers: _headersDefault, body: json.encode(body));
          break;
        case TypeHTPP.PUT:
          response = await http.put(url,
              headers: _headersDefault, body: json.encode(body));
          break;
        case TypeHTPP.DELETE:
          response = await http.delete(url,
              headers: _headersDefault, body: json.encode(body));
          break;
        default:
          return ReturnHttp(error: null, message: null, data: null);
      }
      print('HEADERS');
      print(response.headers);
      print('BODY');
      print(body);
      if (response.statusCode == 200) {
        /* Si la petición fue exitosa, se procede a generar el mapa
            del body con la data correspondiente*/
        return ReturnHttp(
            error: null, message: null, data: json.decode(response.body));
      } else {
        /* Si la petición no fue exitosa, se procede a generar una
            respuesta con el error asignado a su respectivo statusCode*/
        print('LO MAS SEGURO ERROR');
        print(response.body);
        return getErrorFromStatusCode(response);
      }
    } else {
      print('\n\n **** EL DISPOSITIVO NO TIENE INTERNET **** \n\n');
      return ReturnHttp(
          error: TypeHTTPErrors.internetConnection,
          message: 'No hay conexión a internet.',
          data: null);
    }
  } catch (e) {
    print('\n\n **** OCURRIO UN PROBLEMA EN LA PETICION CON URL **** \n');
    print('$baseUrl$path\n');
    print('ERROR:\n$e');
    return ReturnHttp(
        error: TypeHTTPErrors.common, message: e.toString(), data: null);
  }
}

ReturnHttp getErrorFromStatusCode(http.Response response) {
  switch (response.statusCode) {
    case 401:
      return ReturnHttp(
          error: TypeHTTPErrors.token, message: 'Su token expiró.', data: null);
    default:
      return ReturnHttp(
          error: TypeHTTPErrors.common, message: 'Error común.', data: null);
  }
}
