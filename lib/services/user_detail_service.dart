import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fantasytask/custom_exception.dart';
import 'package:fantasytask/general_providers.dart';
import 'package:fantasytask/models/user.dart';
import 'package:fantasytask/services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class BaseUserDetailService {
  Future<void> addUserInfo(
      String disignation,
      String githubLink,
      String phoneNumber,
      String experience,
      String nearbyLocation,
      String about);
  Future<void> deleteUserInfo();
  Future<UserInApp> getYourInfo();
}

final userDetailServiceProvider = Provider<UserDetailService>((ref) {
  final user = ref.read(authencationServiceProvider).getCurrentUser();
  return UserDetailService(ref.read, user);
});

class UserDetailService implements BaseUserDetailService {
  final Reader _read;
  final User? currentUser;

  UserDetailService(this._read, this.currentUser);

  @override
  Future<void> addUserInfo(
      String disignation,
      String githubLink,
      String phoneNumber,
      String experience,
      String nearbyLocation,
      String about) async {
    try {
      await _read(firestoreProvider)
          .collection("users")
          .doc(currentUser!.uid)
          .set({
        "phoneNumber": phoneNumber,
        "disignation": disignation,
        "githubLink": githubLink,
        "experience": experience,
        "nearbyLocation": nearbyLocation,
        "about": about,
      });
    } on FirebaseException catch (e) {
      throw CustomExeption(message: e.message);
    }
  }

  @override
  Future<UserInApp> getYourInfo() async {
    try {
      final doc = await _read(firestoreProvider)
          .collection("users")
          .doc(currentUser!.uid)
          .get();

          if(doc.exists) {
      final userInApp = UserInApp.fromDocument(doc);

      return userInApp;
          } else {
            return UserInApp(
              disignation: "not given", 
              about: "not given", 
              phoneNumber: "not given", 
              githubLink: "not given", 
              nearbyLocation: "not given", 
              experience: "not given");
          }
    } on FirebaseException catch (e) {
      throw CustomExeption(message: e.message);
    }
  }

  @override
  Future<void> deleteUserInfo() async {
    try {
      await _read(firestoreProvider)
          .collection("users")
          .doc(currentUser!.uid)
          .delete();
    } on FirebaseException catch (e) {
      throw CustomExeption(message: e.message);
    }
  }
}
