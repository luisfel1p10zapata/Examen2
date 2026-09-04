class AuthService {
  static bool _isLoggedIn = false;

  static bool get isLoggedIn => _isLoggedIn;

  // Simula el inicio de sesión.
  // Cualquier información es válida.
  static void login() {
    _isLoggedIn = true;
  }

  // Regresa al estado inicial.
  static void logout() {
    _isLoggedIn = false;
  }
}