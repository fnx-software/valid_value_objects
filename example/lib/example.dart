import 'dart:developer';

import 'package:json_annotation/json_annotation.dart';
import 'package:valid_value_objects/valid_value_objects.dart';

part 'example.g.dart';

const userMap = {
  'userId': '2020-10-31 11:43:44.551947',
  'phone': '06301234567',
  'email': 'xy@gmail.com',
  'firstName': 'Ab',
  'lastName': 'Xy',
};

const nestedUserMap = {
  'a': {'userId': '2020-10-31 11:43:44.551947'},
  'b': {
    'c': {'phone': '06301234567'},
    'd': {'email': 'xy@gmail.com'}
  },
  'name': {
    'firstName': 'Ab',
    'lastName': 'Xy',
  },
};

class User {
  final UniqueId userId;
  PhoneNumber phone;
  EmailAddressInput email;
  FirstName firstName;
  LastName lastName;

  User(this.userId, this.phone, this.email, this.firstName, this.lastName);

  factory User.fromJson(Map<String, dynamic> json) {
    final id = UniqueId.fromJson(json);
    final phone = PhoneNumber.fromJson(json);
    final email = EmailAddressInput.fromJson(json);
    final fn = FirstName.fromJson(json);
    final ln = LastName.fromJson(json);

    return User(id, phone, email, fn, ln);
  }

  Map<String, dynamic> toJson() {
    return {
      UniqueId.key: userId,
      PhoneNumber.key: phone,
      EmailAddressInput.key: email,
      FirstName.key: firstName,
      LastName.key: lastName,
    };
  }
}

// Compatible with json_serializable library
@JsonSerializable()
class User2 {
  final UniqueId userId;
  PhoneNumber phone;
  EmailAddressInput email;
  FirstName firstName;
  LastName lastName;

  User2(this.userId, this.phone, this.email, this.firstName, this.lastName);

  factory User2.fromJson(Map<String, dynamic> json) => _$User2FromJson(json);

  Map<String, dynamic> toJson() => _$User2ToJson(this);
}

void main() {
  // Change the default key variable if needed
  UniqueId.key = 'userId';

  final user = User.fromJson(userMap);
  log(user.toJson().toString());

  final user2 = User2.fromJson(userMap);
  log(user2.toJson().toString());

  // Finding nested keys also works fine using the value object's fromJson constructor
  final user3 = User.fromJson(nestedUserMap);
  log(user3.toJson().toString());

  // Custom validator example:
  const sampleEmail = 'xy@gmail';
  try {
    EmailAddressInput(sampleEmail);
  } on ValueException {
    log('This is an invalid email address (will be printed)');
  }

  EmailAddressInput.customValidator = (str) => str.contains('@');

  try {
    EmailAddressInput(sampleEmail);
  } on ValueException {
    log('This is now a valid email address (will NOT be printed)');
  }
}
