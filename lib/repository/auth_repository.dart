import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth;

  const AuthRepository(this._firebaseAuth);

  Future<UserCredential> login(String email, String password) async {
    return await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  void logout() async {
    await _firebaseAuth.signOut();
  }

  Future<UserCredential> register(String email, String password) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> deleteUser() async {
    await _firebaseAuth.currentUser!.delete();
  }

  User? getUser() {
    return _firebaseAuth.currentUser;
  }
}
