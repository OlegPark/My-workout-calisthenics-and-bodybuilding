abstract interface class AuthService {
  Future<bool> isAuthenticated();
  Future<bool> login();
  Future<void> logout();
}