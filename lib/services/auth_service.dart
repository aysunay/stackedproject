import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:stackedproject/model/user_model.dart';

class AuthService {
  String? _token;

  Future<String?> getToken() async {
    return _token;
  }

  UserModel? _currentUser;

  UserModel? get currentUser => _currentUser;

  //TODO: Role bilgisi db, api ve uygulamada Enum olarak tutulacak.
  // bool get isTeamLeader => _currentUser?.role == 'team_leader';

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

      //TODO: kendi apimize bağlanacak
      //TODO: role bilgisi sağlanacak
      //TODO: şifre tutulmayacak, accessToken bilgisi FlutterSecureStorage ile tutulacak.
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        _token = data['accessToken'];

        _currentUser = UserModel(
          id: data['id'].toString(),
          email: data['email'] ?? '',
          name: data['firstName'] ?? '',
        );
        return true;
      }
      return false;
    } catch (e) {
      log("Login error: $e");
      return false;
    }
  }
}
