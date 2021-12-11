import 'dart:io';
import 'package:fantasytask/custom_exception.dart';
import 'package:fantasytask/general_providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';

abstract class BaseAuthenticationService{
  Stream<User?> get userchanges;
  Future<void>loginWithEmail(String email, String password);
  Future<void>signupWithEmail(String email, String password);
  User? getCurrentUser();
  String? getCurrentUID();
  Future<void> setDisplayName(String newUsername);
  Future<void> setProfilePhoto(String photoUrl);
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
  Future<void> setDisplayName(String? newUsername) async {
    await _read(firebaseAuthProvider)
        .currentUser!
        .updateDisplayName(newUsername);
  }

  @override
  Future<void> setProfilePhoto(String? photoUrl) async {
    await _read(firebaseAuthProvider).currentUser!.updatePhotoURL(photoUrl);
  }

  @override
  Future<void> signOut() async {
    await _read(firebaseAuthProvider).signOut();
  }
}

abstract class BaseStorageService {
  Future<void> uploadProfileImage(File file);
  Future<String?> getDownloadUrl();
}

final storageServiceProvider = Provider<StorageService>((ref) {
  return StorageService(ref.read);
});

class StorageService implements BaseStorageService {
  final Reader _read;

  const StorageService(this._read);

  @override
  Future<String?> uploadProfileImage(File file) async {
    try {
      final userUID = _read(authencationServiceProvider).getCurrentUID();
      final storageRef =
          _read(firebaseStorageProvider).ref().child("users/profile/$userUID");
      await storageRef.putFile(file);
    } on FirebaseException catch (e) {
      return e.message;
    }
  }

  @override
  Future<String?> getDownloadUrl() async {
    final userUID = _read(authencationServiceProvider).getCurrentUID();
    final downloadedUrl = await _read(firebaseStorageProvider)
        .ref("users/profile/$userUID")
        .getDownloadURL();

    return downloadedUrl;
  }
}
