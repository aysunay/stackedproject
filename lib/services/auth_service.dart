import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class AuthService {
  Future<bool> login(String email, String password) async {
    try {
      var body = {
        "username": email,
        "password": password,
      };

      final url = Uri.parse('https://dummyjson.com/auth/login');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      return response.statusCode == 200;
    } catch (e) {
      log("Login error: $e");
      return false;
    }
  }
}
