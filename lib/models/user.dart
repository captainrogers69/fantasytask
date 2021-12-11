import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserInApp {
  final String disignation;
  final String about;
  final String phoneNumber;
  final String githubLink;
  final String nearbyLocation;
  final String experience;
  UserInApp({
    required this.disignation,
    required this.about,
    required this.phoneNumber,
    required this.githubLink,
    required this.nearbyLocation,
    required this.experience,
  });

  UserInApp copyWith({
    String? disignation,
    String? about,
    String? phoneNumber,
    String? githubLink,
    String? nearbyLocation,
    String? experience,
  }) {
    return UserInApp(
      disignation: disignation ?? this.disignation,
      about: about ?? this.about,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      githubLink: githubLink ?? this.githubLink,
      nearbyLocation: nearbyLocation ?? this.nearbyLocation,
      experience: experience ?? this.experience,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'disignation': disignation,
      'about': about,
      'phoneNumber': phoneNumber,
      'githubLink': githubLink,
      'nearbyLocation': nearbyLocation,
      'experience': experience,
    };
  }

  factory UserInApp.fromMap(Map<String, dynamic> map) {
    return UserInApp(
      disignation: map['disignation'] ?? '',
      about: map['about'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      githubLink: map['githubLink'] ?? '',
      nearbyLocation: map['nearbyLocation'] ?? '',
      experience: map['experience'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserInApp.fromJson(String source) =>
      UserInApp.fromMap(json.decode(source));

  factory UserInApp.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return UserInApp.fromMap(data);
  }

  @override
  String toString() {
    return 'UserInApp(disignation: $disignation, about: $about, phoneNumber: $phoneNumber, githubLink: $githubLink, nearbyLocation: $nearbyLocation, experience: $experience)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserInApp &&
        other.disignation == disignation &&
        other.about == about &&
        other.phoneNumber == phoneNumber &&
        other.githubLink == githubLink &&
        other.nearbyLocation == nearbyLocation &&
        other.experience == experience;
  }

  @override
  int get hashCode {
    return disignation.hashCode ^
        about.hashCode ^
        phoneNumber.hashCode ^
        githubLink.hashCode ^
        nearbyLocation.hashCode ^
        experience.hashCode;
  }
}
