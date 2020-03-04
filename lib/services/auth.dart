import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_flutter_app/domain/user.dart';

class AuthService {
  final FirebaseAuth _fAuth = FirebaseAuth.instance;

  Future<User> singinWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult authResult = await _fAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      FirebaseUser user = authResult.user;

      return User.fromFireBase(user);
    } catch (e) {
      print(e);

      return null;
    }
  }

  Future<User> singupWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult authResult = await _fAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      FirebaseUser user = authResult.user;

      return User.fromFireBase(user);
    } catch (e) {
      print(e);

      return null;
    }
  }

  Future<void> singuot() async {
    return await _fAuth.signOut();
  }

  Stream<User> get currentUser {
    return _fAuth.onAuthStateChanged.map(
      (FirebaseUser user) => user != null ? User.fromFireBase(user) : null,
    );
  }
}
