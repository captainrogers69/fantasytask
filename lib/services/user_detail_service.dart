import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fantasytask/custom_exception.dart';
import 'package:fantasytask/general_providers.dart';
import 'package:fantasytask/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class BaseUserDetailService {
  Future<void> addYourDisignation(String disignation);
  Future<void> addYourGitHubLink(String githubLink);
  Future<void> addYourPhoneNumber(String phoneNumber);
  Future<void> addYourExperience(String experience);
  Future<void> addYourNearbyLocation(String nearbyLocation);
  Future<void> addYourAbout(String about);
  Future<UserInApp> getYourInfo();
}

class UserDetailService implements BaseUserDetailService {
  final Reader _read;
  final User currentUser;

  UserDetailService(this._read, this.currentUser);

  @override
  Future<void> addYourAbout(String about) async {
    try {
      await _read(firestoreProvider)
          .collection("users")
          .doc(currentUser.uid)
          .set({
        "about": about,
      });
    } on FirebaseException catch (e) {
      throw CustomExeption(message: e.message);
    }
  }

  @override
  Future<void> addYourDisignation(String disignation) async {
    try {
      await _read(firestoreProvider)
          .collection("users")
          .doc(currentUser.uid)
          .set({
        "designation": disignation,
      });
    } on FirebaseException catch (e) {
      throw CustomExeption(message: e.message);
    }
  }

  @override
  Future<void> addYourExperience(String experience) async {
    try {
      await _read(firestoreProvider)
          .collection("users")
          .doc(currentUser.uid)
          .set({
        "experience": experience,
      });
    } on FirebaseException catch (e) {
      throw CustomExeption(message: e.message);
    }
  }

  @override
  Future<void> addYourGitHubLink(String githubLink) async {
    try {
      await _read(firestoreProvider)
          .collection("users")
          .doc(currentUser.uid)
          .set({
        "githubLink": githubLink,
      });
    } on FirebaseException catch (e) {
      throw CustomExeption(message: e.message);
    }
  }

  @override
  Future<void> addYourNearbyLocation(String nearbyLocation) async {
    try {
      await _read(firestoreProvider)
          .collection("users")
          .doc(currentUser.uid)
          .set({
        "nearbyLocation": nearbyLocation,
      });
    } on FirebaseException catch (e) {
      throw CustomExeption(message: e.message);
    }
  }

  @override
  Future<void> addYourPhoneNumber(String phoneNumber) async {
    try {
      await _read(firestoreProvider)
          .collection("users")
          .doc(currentUser.uid)
          .set({
        "phoneNumber": phoneNumber,
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
          .doc(currentUser.uid)
          .get();

      final userInApp = UserInApp.fromDocument(doc);

      return userInApp;
    } on FirebaseException catch (e) {
      throw CustomExeption(message: e.message);
    }
  }
}
