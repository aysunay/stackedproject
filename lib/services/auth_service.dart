import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/auth_models/user_model.dart';

class AuthService {
  String? _token;
  static const _tokenKey = 'auth_token';

  //TODO: Role bilgisi db, api ve uygulamada Enum olarak tutulacak.
  // bool get isTeamLeader => _currentUser?.role == 'team_leader';

  //TODO: role bilgisi sağlanacak

  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  SharedPreferences? _sharedPrefs;

  UserModel? _currentUser;

  UserModel? get currentUser => _currentUser;

  AuthService() {
    _initPrefs();
  }

  Future<void> _initPrefs() async {
    if (kIsWeb) {
      _sharedPrefs = await SharedPreferences.getInstance();
    }
  }

  Future<void> saveToken(String token) async {
    _token = token;
    if (kIsWeb) {
      await _sharedPrefs?.setString(_tokenKey, token);
    } else {
      await _secureStorage.write(key: _tokenKey, value: token);
    }
  }

  Future<String?> getToken() async {
    if (_token != null) return _token;
    if (kIsWeb) {
      _token = _sharedPrefs?.getString(_tokenKey);
    } else {
      _token = await _secureStorage.read(key: _tokenKey);
    }
    return _token;
  }

  Future<void> deleteToken() async {
    _token = null;
    if (kIsWeb) {
      await _sharedPrefs?.remove(_tokenKey);
    } else {
      await _secureStorage.delete(key: _tokenKey);
    }
  }

  Future<bool> loginWithCredentials(String email, String password) async {
    try {
      final body = {
        "email": email,
        "password": password,
      };

      final url = Uri.parse('https://localhost:7163/api/auth/login');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        _token = data['AccessToken'];
        await saveToken(_token!);

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

  Future<bool> registerWithCredentials(String email, String password, String username) async {
    try {
      final body = {
        "email": email,
        "password": password,
        "userName": username,
      };

      final url = Uri.parse('https://localhost:7163/api/auth/register');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      if (response.statusCode == 201) {
        return true;
      } else {
        log("Register failed: ${response.body}");
        return false;
      }
    } catch (e) {
      log("Register error: $e");
      return false;
    }
  }
}
