import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class AuthService {
  String? _token;

  String? get token => _token;

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

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _token = data['token'];
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log("Login error: $e");
      return false;
    }
  }
}
