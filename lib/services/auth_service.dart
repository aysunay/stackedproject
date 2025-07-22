import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class AuthService {
  Future<bool> login(String email, String password) async {
    try {
      final url = Uri.parse('http://192.168.60.111:5044/api/Auth/login');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      return response.statusCode == 200;
    } catch (e) {
      log("Login error: $e");
      return false;
    }
  }
}
