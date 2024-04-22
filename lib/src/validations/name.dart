import 'package:valid_value_objects/valid_value_objects.dart';

import '../core/helper.dart';

class FirstName extends Name {
  /// Default value: `fistName`
  static String key = 'firstName';

  /// Define your own [customValidator] if you are dissatisfied with [_defaultValidator].
  ///
  /// If you set [validation] other than `null` [FirstName] instantiation
  /// and [FirstName.validate] function will validate by your custom [validation].
  static ValidCallback? customValidator;

  // Validates [str] by [_defaultValidator] or [customValidator].
  static bool validate(String str) => customValidator?.call(str) ?? _defaultValidator(str);

  /// Returns a valid [FirstName] object.
  ///
  /// Throws [ValueException]:
  /// - [RequiredValueException] if [str] is null or empty.
  /// - [InvalidValueException] if [str] is not a valid first name.
  factory FirstName(String? str) {
    if (str == null || str.isEmpty) {
      throw const RequiredValueException();
    } else if (!validate(str)) {
      throw InvalidValueException(str);
    }
    return FirstName._(str);
  }

  FirstName._(super.value);

  /// Returns a valid [FirstName] object.
  ///
  /// Throws [InvalidValueException] if [vo] is not a valid first name.
  factory FirstName.fromValueObject(ValueObject vo) {
    return FirstName(vo.toString());
  }

  /// Returns a valid [FirstName] object.
  ///
  /// If [key] is `null` [FirstName.key] is used to get it's corresponding value in [map].
  ///
  /// Throws [InvalidValueException] if [map]'s value is not a valid first name.
  factory FirstName.fromJson(Map<String, dynamic> map, {String? key}) {
    final flatMap = flattenMap(map);
    final value = flatMap[key ?? EmailAddressInput.key].toString();

    return FirstName(value);
  }

  Map<String, String> toJson({String? key}) => {key ?? FirstName.key: toString()};
}

class LastName extends Name {
  /// Default value: `lastName`
  static String key = 'lastName';

  /// Define your own [customValidator] if you are dissatisfied with [_defaultValidator].
  ///
  /// If you set [validation] other than `null` [LastName] instantiation
  /// and [LastName.validate] function will validate by your custom [validation].
  static ValidCallback? customValidator;

  /// Validates [str] by [_defaultValidator] or [customValidator].
  static bool validate(String str) => customValidator?.call(str) ?? _defaultValidator(str);

  /// Returns a valid [LastName] object.
  ///
  /// Throws [ValueException]:
  /// - [RequiredValueException] if [str] is null or empty.
  /// - [InvalidValueException] if [str] is not a valid last name.
  factory LastName(String? str) {
    if (str == null || str.isEmpty) {
      throw const RequiredValueException();
    } else if (!validate(str)) {
      throw InvalidValueException(str);
    }
    return LastName._(str);
  }

  LastName._(super.value);

  /// Returns a valid [LastName] object.
  ///
  /// Throws [InvalidValueException] if [vo] is not a valid last name.
  factory LastName.fromValueObject(ValueObject vo) {
    return LastName(vo.toString());
  }

  /// Returns a valid [LastName] object.
  ///
  /// If [key] is `null` [LastName.key] is used to get it's corresponding value in [map].
  ///
  /// Throws [InvalidValueException] if [map]'s value is not a valid last name.
  factory LastName.fromJson(Map<String, dynamic> map, {String? key}) {
    final flatMap = flattenMap(map);
    final value = flatMap[key ?? LastName.key].toString();

    return LastName(value);
  }

  Map<String, String> toJson({String? key}) => {key ?? LastName.key: toString()};
}

class MiddleName extends Name {
  /// Default value: `middleName`
  static String key = 'middleName';

  /// Define your own [customValidator] if you are dissatisfied with [_defaultValidator].
  ///
  /// If you set [validation] other than `null` [MiddleName] instantiation
  /// and [MiddleName.validate] function will validate by your custom [validation].
  static ValidCallback? customValidator;

  /// Validates [str] by [_defaultValidator] or [customValidator].
  static bool validate(String str) => customValidator?.call(str) ?? _defaultValidator(str);

  /// Returns a valid [MiddleName] object.
  ///
  /// Throws [ValueException]:
  /// - [RequiredValueException] if [str] is null or empty.
  /// - [InvalidValueException] if [str] is not a valid middle name.
  factory MiddleName(String? str) {
    if (str == null || str.isEmpty) {
      throw const RequiredValueException();
    } else if (!validate(str)) {
      throw InvalidValueException(str);
    }
    return MiddleName._(str);
  }

  MiddleName._(super.value);

  /// Returns a valid [MiddleName] object.
  ///
  /// Throws [InvalidValueException] if [vo] is not a valid middle name.
  factory MiddleName.fromValueObject(ValueObject vo) {
    return MiddleName(vo.toString());
  }

  /// Returns a valid [MiddleName] object.
  ///
  /// If [key] is `null` [MiddleName.key] is used to get it's corresponding value in [map].
  ///
  /// Throws [InvalidValueException] if [map]'s value is not a valid middle name.
  factory MiddleName.fromJson(Map<String, dynamic> map, {String? key}) {
    final flatMap = flattenMap(map);
    final value = flatMap[key ?? MiddleName.key].toString();

    return MiddleName(value);
  }

  Map<String, String> toJson({String? key}) => {key ?? MiddleName.key: toString()};
}

abstract class Name extends ValueObject<String> {
  Name(String value) : super(capitalizeFirstLetter(value));
}

bool _defaultValidator(String str) {
  return str.length > 1;
}
