// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User2 _$User2FromJson(Map<String, dynamic> json) {
  return User2(
    UniqueId.fromJson(json['userId']),
    PhoneNumberInput.fromJson(json['phone']),
    EmailAddressInput.fromJson(json['email']),
    FirstNameInput.fromJson(json['firstName']),
    LastNameInput.fromJson(json['lastName']),
  );
}

Map<String, dynamic> _$User2ToJson(User2 instance) => <String, dynamic>{
      'userId': instance.userId,
      'phone': instance.phone,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };
