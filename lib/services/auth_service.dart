class AuthService {
  Future<bool> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2)); // loading efekti için
    return email == 'aysun.ay@mytechnic.aero' && password == '123';
  }
}
