import 'package:valid_value_objects/valid_value_objects.dart';

import '../core/helper.dart';

class FirstNameInput extends NameInput {
  /// Default value: `fistName`
  static String key = 'firstName';

  /// Define your own [customValidator] if you are dissatisfied with [_defaultValidator].
  ///
  /// If you set [validation] other than `null` [FirstNameInput] instantiation
  /// and [FirstNameInput.validate] function will validate by your custom [validation].
  static ValidCallback? customValidator;

  // Validates [str] by [_defaultValidator] or [customValidator].
  static bool validate(String str) => customValidator?.call(str) ?? _defaultValidator(str);

  /// Returns a valid [FirstNameInput] object.
  ///
  /// Throws [ValueException]:
  /// - [RequiredValueException] if [str] is null or empty.
  /// - [InvalidValueException] if [str] is not a valid first name.
  factory FirstNameInput(String? str) {
    if (str == null || str.isEmpty) {
      throw const RequiredValueException();
    } else if (!validate(str)) {
      throw InvalidValueException(str);
    }
    return FirstNameInput._(str);
  }

  FirstNameInput._(super.value);

  /// Returns a valid [FirstNameInput] object.
  ///
  /// Throws [InvalidValueException] if [vo] is not a valid first name.
  factory FirstNameInput.fromValueObject(ValueObject vo) {
    return FirstNameInput(vo.toString());
  }

  /// Returns a valid [FirstNameInput] object.
  ///
  /// If [key] is `null` [FirstNameInput.key] is used to get it's corresponding value in [map].
  ///
  /// Throws [InvalidValueException] if [map]'s value is not a valid first name.
  factory FirstNameInput.fromJson(Map<String, dynamic> map, {String? key}) {
    final flatMap = flattenMap(map);
    final value = flatMap[key ?? EmailAddressInput.key].toString();

    return FirstNameInput(value);
  }

  Map<String, String> toJson({String? key}) => {key ?? FirstNameInput.key: toString()};
}

class LastNameInput extends NameInput {
  /// Default value: `lastName`
  static String key = 'lastName';

  /// Define your own [customValidator] if you are dissatisfied with [_defaultValidator].
  ///
  /// If you set [validation] other than `null` [LastNameInput] instantiation
  /// and [LastNameInput.validate] function will validate by your custom [validation].
  static ValidCallback? customValidator;

  /// Validates [str] by [_defaultValidator] or [customValidator].
  static bool validate(String str) => customValidator?.call(str) ?? _defaultValidator(str);

  /// Returns a valid [LastNameInput] object.
  ///
  /// Throws [ValueException]:
  /// - [RequiredValueException] if [str] is null or empty.
  /// - [InvalidValueException] if [str] is not a valid last name.
  factory LastNameInput(String? str) {
    if (str == null || str.isEmpty) {
      throw const RequiredValueException();
    } else if (!validate(str)) {
      throw InvalidValueException(str);
    }
    return LastNameInput._(str);
  }

  LastNameInput._(super.value);

  /// Returns a valid [LastNameInput] object.
  ///
  /// Throws [InvalidValueException] if [vo] is not a valid last name.
  factory LastNameInput.fromValueObject(ValueObject vo) {
    return LastNameInput(vo.toString());
  }

  /// Returns a valid [LastNameInput] object.
  ///
  /// If [key] is `null` [LastNameInput.key] is used to get it's corresponding value in [map].
  ///
  /// Throws [InvalidValueException] if [map]'s value is not a valid last name.
  factory LastNameInput.fromJson(Map<String, dynamic> map, {String? key}) {
    final flatMap = flattenMap(map);
    final value = flatMap[key ?? LastNameInput.key].toString();

    return LastNameInput(value);
  }

  Map<String, String> toJson({String? key}) => {key ?? LastNameInput.key: toString()};
}

class MiddleNameInput extends NameInput {
  /// Default value: `middleName`
  static String key = 'middleName';

  /// Define your own [customValidator] if you are dissatisfied with [_defaultValidator].
  ///
  /// If you set [validation] other than `null` [MiddleNameInput] instantiation
  /// and [MiddleNameInput.validate] function will validate by your custom [validation].
  static ValidCallback? customValidator;

  /// Validates [str] by [_defaultValidator] or [customValidator].
  static bool validate(String str) => customValidator?.call(str) ?? _defaultValidator(str);

  /// Returns a valid [MiddleNameInput] object.
  ///
  /// Throws [ValueException]:
  /// - [RequiredValueException] if [str] is null or empty.
  /// - [InvalidValueException] if [str] is not a valid middle name.
  factory MiddleNameInput(String? str) {
    if (str == null || str.isEmpty) {
      throw const RequiredValueException();
    } else if (!validate(str)) {
      throw InvalidValueException(str);
    }
    return MiddleNameInput._(str);
  }

  MiddleNameInput._(super.value);

  /// Returns a valid [MiddleNameInput] object.
  ///
  /// Throws [InvalidValueException] if [vo] is not a valid middle name.
  factory MiddleNameInput.fromValueObject(ValueObject vo) {
    return MiddleNameInput(vo.toString());
  }

  /// Returns a valid [MiddleNameInput] object.
  ///
  /// If [key] is `null` [MiddleNameInput.key] is used to get it's corresponding value in [map].
  ///
  /// Throws [InvalidValueException] if [map]'s value is not a valid middle name.
  factory MiddleNameInput.fromJson(Map<String, dynamic> map, {String? key}) {
    final flatMap = flattenMap(map);
    final value = flatMap[key ?? MiddleNameInput.key].toString();

    return MiddleNameInput(value);
  }

  Map<String, String> toJson({String? key}) => {key ?? MiddleNameInput.key: toString()};
}

abstract class NameInput extends ValueObject<String> {
  NameInput(String value) : super(capitalizeFirstLetter(value));
}

bool _defaultValidator(String str) {
  return str.length > 1;
}
