import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:stackedproject/model/auth_models/user_login_model.dart';
import 'package:stackedproject/model/auth_models/user_model.dart';

class AuthService {
  String? _token;

  Future<String?> getToken() async {
    return _token;
  }

  UserModel? _currentUser;

  UserModel? get currentUser => _currentUser;

  //TODO: Role bilgisi db, api ve uygulamada Enum olarak tutulacak.
  // bool get isTeamLeader => _currentUser?.role == 'team_leader';

  Future<bool> login(UserLoginModel loginModel) async {
    try {
      final url = Uri.parse('https://localhost:7163/api/auth/login');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(loginModel.toJson()),
      );

      //TODO: role bilgisi sağlanacak
      //TODO: şifre tutulmayacak, accessToken bilgisi FlutterSecureStorage ile tutulacak.

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        _token = data['accessToken'];

        _currentUser = UserModel(
          email: data['email'] ?? '',
          username: data['username'] ?? '',
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
