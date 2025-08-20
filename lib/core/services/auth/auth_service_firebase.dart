import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_workout_cab/core/services/auth/auth_service.dart';

class AuthServiceFirebase implements AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Future<bool> isAuthenticated() async {
    return _firebaseAuth.currentUser != null;
  }

  @override
  Future<bool> login() async {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}