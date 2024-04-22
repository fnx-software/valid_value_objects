import 'package:meta/meta.dart';
import 'package:valid_value_objects/valid_value_objects.dart';

import '../src/helper.dart';

@immutable
class PhoneNumber extends ValueObject<String> {
  /// Default value: `phone`
  static String key = 'phone';

  /// Phone regex original source: https://github.com/agungnursatria/regexpattern
  ///
  /// Must started by either, "0", "+", "+XX <X between 2 to 4 digit>", "(+XX <X between 2 to 3 digit>)"
  ///
  /// Can add whitespace separating digit with "+" or "(+XX)"
  ///
  /// Example: 05555555555, +555 5555555555, (+123) 5555555555, (555) 5555555555, +5555 5555555555
  static const defaultRegex = r'^(0|\+|(\+[0-9]{2,4}|\(\+?[0-9]{2,4}\)) ?)([0-9]*|\d{2,4}-\d{2,4}(-\d{2,4})?)$';

  static bool _defaultValidator(String str) => RegExp(defaultRegex).hasMatch(str.toLowerCase());

  /// Define your own [customValidator] if you are dissatisfied with [_defaultValidator].
  ///
  /// If you set [validation] other than `null` [PhoneNumber] instantiation
  /// and [PhoneNumber.validate] function will validate by your custom [validation].
  static ValidCallback? customValidator;

  /// Validates [str] by [_defaultValidator] or [customValidator].
  static bool validate(String str) => customValidator?.call(str) ?? _defaultValidator(str);

  /// Returns a valid [PhoneNumber] object.
  ///
  /// Throws [ValueException]:
  /// - [RequiredValueException] if [str] is null or empty.
  /// - [InvalidValueException] if [str] is not a valid phone number.
  factory PhoneNumber(String? str) {
    if (str == null || str.isEmpty) {
      throw const RequiredValueException();
    }

    if (validate(str)) {
      return PhoneNumber._(str);
    }

    throw InvalidValueException(str, message: 'Invalid phone number.');
  }

  const PhoneNumber._(super.value);

  /// Returns a valid [PhoneNumber] object.
  ///
  /// Throws [InvalidValueException] if [vo] is not a valid phone number.
  factory PhoneNumber.fromValueObject(ValueObject vo) {
    return PhoneNumber(vo.toString());
  }

  /// Returns a valid [PhoneNumber] object.
  ///
  /// If [key] is `null` [PhoneNumber.key] is used to get it's corresponding value in [map].
  ///
  /// Throws [InvalidValueException] if [map]'s value is not a valid phone number.
  factory PhoneNumber.fromJson(Map<String, dynamic> map, {String? key}) {
    final flatMap = flattenMap(map);
    final value = flatMap[key ?? PhoneNumber.key].toString();

    return PhoneNumber(value);
  }

  Map<String, String> toJson({String? key}) => {key ?? PhoneNumber.key: toString()};
}
