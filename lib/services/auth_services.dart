import 'package:fantasytask/custom_exception.dart';
import 'package:fantasytask/general_providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class BaseAuthenticationService{
  Stream<User?> get userchanges;
  Future<void>loginWithEmail(String email, String password);
  Future<void>signupWithEmail(String email, String password);
  User? getCurrentUser();
  String? getCurrentUID();
  Future<void>signOut();
}

final authencationServiceProvider = Provider<AuthenticationService>((ref) {
  return AuthenticationService(ref.read);
});

class AuthenticationService implements BaseAuthenticationService{
  final Reader _read;
  
  const AuthenticationService(this._read);

  @override
  Stream<User?> get userchanges => _read(firebaseAuthProvider).authStateChanges();

  @override
  Future<void> loginWithEmail(String email, String password) async {
    try {
      await _read(firebaseAuthProvider).signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw CustomExeption(message: e.message);
    }
  }
  
  @override
  Future<void> signupWithEmail(String email, String password) async {
    try {
      await _read(firebaseAuthProvider).createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw CustomExeption(message: e.message);
    }
  }



  @override
  String? getCurrentUID() {
    return _read(firebaseAuthProvider).currentUser!.uid;
  }

  @override
  User? getCurrentUser() {
    return _read(firebaseAuthProvider).currentUser;
  }

  @override
  Future<void> signOut() async {
    await _read(firebaseAuthProvider).signOut();
  }
}
