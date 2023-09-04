import 'package:flutter/material.dart';
import 'dart:convert'; // Importa la biblioteca dart:convert
import 'package:http/http.dart' as http;

class AuthServiceProvider extends ChangeNotifier {
  //aca ahremos las peticiones http

  Future<bool> Login(String username, String password) async {
    final url = Uri.parse('https://tesis-xz3b.onrender.com/auth/login');
    final Map<String, String> body = {
      'username': username,
      'password': password,
    };

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      if (responseData['ok'] == true) {
        final String id = responseData['id'];
        final String username = responseData['username'];
        final String msg = responseData['msg'];
        final String token = responseData['token'];
        // Ahora puedes utilizar los datos como desees
        print('ID: $id');
        print('Username: $username');
        print('Mensaje: $msg');
        print('Token: $token');
        return true;
      } else {
        print('La solicitud no fue exitosa. Mensaje: ${responseData['msg']}');
        return false;
      }
    } else {
      print('Error en la solicitud: ${response.statusCode}');
      return false;
    }
  }

  void Register() {}
}
