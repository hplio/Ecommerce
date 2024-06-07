import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do/utils/formatters/formatter.dart';

class UserModel {
  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.profilePic,
  });

  final String id;
  String firstName;
  String lastName;
  final String username;
  final String email;
  String phoneNumber;
  String profilePic;

  

  //get full name
  String get fullName => "$lastName $firstName";

  //formate phone number
  String get formattedPhoneNo => TFormatter.formatPhoneNumber(phoneNumber);

//static function to split full name into first and last name
  static List<String> nameParts(fullName) => fullName.split(" ");

//static function to generate a username from the full name.

  static String generateUsername(String fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUsername = "$firstName$lastName";
    String usernameWitthPrefix = "hp_$camelCaseUsername";

    return usernameWitthPrefix;
  }

  static UserModel empty() => UserModel(
        id: '',
        firstName: '',
        lastName: '',
        username: '',
        email: '',
        phoneNumber: '',
        profilePic: '',
      );

  Map<String, dynamic> toJson() {
    return {
      "FirstName": firstName,
      "LastName": lastName,
      "UserName": username,
      "Email": email,
      "PhoneNumber": phoneNumber,
      "ProfilePicture": profilePic,
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
        final data = document.data()!;
        return UserModel(
          id: document.id,
          firstName: data['FirstName'] ?? '',
          lastName: data['LastName'] ?? '',
          username: data['UserName'] ?? '',
          email: data['Email'] ?? '',
          phoneNumber: data['PhoneNumber'] ?? '',
          profilePic: data['ProfilePicture'] ?? '',
        );
      } else {
       return UserModel.empty();
      }
  }
}
