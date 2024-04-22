import 'package:string_validator/string_validator.dart';

import '../src/helper.dart';
import '../src/value_exceptions.dart';
import '../src/value_object.dart';

class EmailAddress extends ValueObject<String> {
  /// Default value: `email`
  static String key = 'email';

  static bool _defaultValidator(String str) => isEmail(str);

  /// Define your own [customValidator] if you are dissatisfied with [_defaultValidator].
  ///
  /// If you set [validation] other than `null` [EmailAddress] instantiation
  /// and [EmailAddress.validate] function will validate by your custom [validation].
  static ValidCallback? customValidator;

  /// Validates [str] by [_defaultValidator] or [customValidator].
  static bool validate(String str) => customValidator?.call(str) ?? _defaultValidator(str);

  /// Returns a valid [EmailAddress] object.
  ///
  /// Throws [ValueException]:
  /// - [RequiredValueException] if [str] is null or empty.
  /// - [InvalidValueException] if [str] is not a valid email address.
  factory EmailAddress(String? str) {
    if (str == null || str.isEmpty) {
      throw const RequiredValueException();
    }

    if (validate(str)) {
      return EmailAddress._(str);
    }

    throw InvalidValueException(str, message: 'Invalid email address.');
  }

  /// Returns the local part of `this` EmailAddress instance.
  ///
  /// Example: If email is "xy@gmail.com" this getter will return "xy"
  String get local => this.toString().split('@')[0];

  /// Returns the domain part of `this` EmailAddress instance.
  ///
  /// Example: If email is `xy@gmail.com` this getter will return `gmail.com`
  String get domain => this.toString().split('@')[1];

  const EmailAddress._(super.value);

  /// Returns a valid [EmailAddress] object.
  ///
  /// Throws [InvalidValueException] if [vo] is not a valid email address.
  factory EmailAddress.fromValueObject(ValueObject vo) {
    return EmailAddress(vo.toString());
  }

  /// Returns a valid [EmailAddress] object.
  ///
  /// If [key] is `null` [EmailAddress.key] is used to get it's corresponding value in [map].
  ///
  /// Throws [InvalidValueException] if [map]'s value is not a valid email address.
  factory EmailAddress.fromJson(Map<String, dynamic> map, {String? key}) {
    final flatMap = flattenMap(map);
    final value = flatMap[key ?? EmailAddress.key].toString();

    return EmailAddress(value);
  }

  Map<String, String> toJson({String? key}) => {key ?? EmailAddress.key: this.toString()};
}
