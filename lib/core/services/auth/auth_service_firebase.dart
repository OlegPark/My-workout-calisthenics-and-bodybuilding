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
    final result = _firebaseAuth.signInWithEmailAndPassword(email: 'email', password: 'password');
    return result != null;
  }

  @override
  Future<void> logout() {
    return _firebaseAuth.signOut();
  }
}