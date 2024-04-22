import 'package:string_validator/string_validator.dart';
import 'package:valid_value_objects/valid_value_objects.dart';

import '../core/helper.dart';

class EmailAddressInput extends ValueObject<String> {
  /// Default value: `email`
  static String key = 'email';

  static bool _defaultValidator(String str) => isEmail(str);

  /// Define your own [customValidator] if you are dissatisfied with [_defaultValidator].
  ///
  /// If you set [validation] other than `null` [EmailAddressInput] instantiation
  /// and [EmailAddressInput.validate] function will validate by your custom [validation].
  static ValidCallback? customValidator;

  /// Validates [str] by [_defaultValidator] or [customValidator].
  static bool validate(String str) => customValidator?.call(str) ?? _defaultValidator(str);

  /// Returns a valid [EmailAddressInput] object.
  ///
  /// Throws [ValueException]:
  /// - [RequiredValueException] if [str] is null or empty.
  /// - [InvalidValueException] if [str] is not a valid email address.
  factory EmailAddressInput(String? str) {
    if (str == null || str.isEmpty) {
      throw const RequiredValueException();
    }

    if (validate(str)) {
      return EmailAddressInput._(str);
    }

    throw InvalidValueException(str, customMessage: '${ValueObjectLocalizationsImpl.current.emailInvalid}.');
  }

  /// Returns the local part of `this` EmailAddressInput instance.
  ///
  /// Example: If email is "xy@gmail.com" this getter will return "xy"
  String get local => this.toString().split('@')[0];

  /// Returns the domain part of `this` EmailAddressInput instance.
  ///
  /// Example: If email is `xy@gmail.com` this getter will return `gmail.com`
  String get domain => this.toString().split('@')[1];

  const EmailAddressInput._(super.value);

  /// Returns a valid [EmailAddressInput] object.
  ///
  /// Throws [InvalidValueException] if [vo] is not a valid email address.
  factory EmailAddressInput.fromValueObject(ValueObject vo) {
    return EmailAddressInput(vo.toString());
  }

  /// Returns a valid [EmailAddressInput] object.
  ///
  /// If [key] is `null` [EmailAddressInput.key] is used to get it's corresponding value in [map].
  ///
  /// Throws [InvalidValueException] if [map]'s value is not a valid email address.
  factory EmailAddressInput.fromJson(Map<String, dynamic> map, {String? key}) {
    final flatMap = flattenMap(map);
    final value = flatMap[key ?? EmailAddressInput.key].toString();

    return EmailAddressInput(value);
  }

  Map<String, String> toJson({String? key}) => {key ?? EmailAddressInput.key: this.toString()};
}
