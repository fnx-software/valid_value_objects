import 'package:valid_value_objects/valid_value_objects.dart';

import '../core/helper.dart';

class PasswordInput extends ValueObject<String> {
  /// Default value: `password`
  static String key = 'password';

  static int minChar = 8;
  static int maxChar = 255;

  static bool mustContainNumeric = true;
  static bool mustContainLowerChar = true;
  static bool mustContainUpperChar = true;
  static bool mustContainSpecialChar = false;

  /// Returns a valid [PasswordInput] object.
  ///
  /// Throws [ValueException]:
  ///
  /// - [RequiredValueException] if [str] is null or empty.
  /// - [TooShortValueException] if [str] has too few characters.
  /// - [TooLongValueException] if [str] has too many characters.
  /// - [InvalidValueException] if [str] is invalid.
  factory PasswordInput(String? str) {
    if (str == null || str.isEmpty) {
      throw const RequiredValueException();
    } else if (str.length < minChar) {
      throw TooShortValueException(str);
    } else if (str.length > maxChar) {
      throw TooLongValueException(str);
    } else if (PasswordInput.mustContainLowerChar && !hasLowerChar(str)) {
      throw InvalidValueException(
        str,
        code: ErrorCode.mustContainLower,
      );
    } else if (PasswordInput.mustContainUpperChar && !hasUpperChar(str)) {
      throw InvalidValueException(
        str,
        code: ErrorCode.mustContainUpper,
      );
    } else if (PasswordInput.mustContainNumeric && !hasNumeric(str)) {
      throw InvalidValueException(
        str,
        code: ErrorCode.mustContainNumber,
      );
    } else if (PasswordInput.mustContainSpecialChar && !hasSpecialChar(str)) {
      throw InvalidValueException(
        str,
        code: ErrorCode.mustHaveSpecial,
      );
    }

    return PasswordInput._(str);
  }

  const PasswordInput._(super.value);

  /// One of the following [ValueException] maybe thrown:
  /// - RequiredValueException
  /// - TooShortValueException
  /// - TooLongValueException
  /// - InvalidValueException
  factory PasswordInput.fromValueObject(ValueObject vo) {
    return PasswordInput(vo.toString());
  }

  /// One of the following [ValueException] maybe thrown:
  /// - RequiredValueException
  /// - TooShortValueException
  /// - TooLongValueException
  /// - InvalidValueException
  factory PasswordInput.fromJson(Map<String, dynamic> map, {String? key}) {
    final flatMap = flattenMap(map);
    final value = flatMap[key ?? PasswordInput.key].toString();

    return PasswordInput(value);
  }

  Map<String, String> toJson({String? key}) => {key ?? PasswordInput.key: toString()};

  static void setRequirements({
    int minChar = 6,
    int maxChar = 255,
    bool mustContainLowerChar = true,
    bool mustContainUpperChar = true,
    bool mustContainNumeric = true,
    bool mustContainSpecialChar = false,
  }) {
    PasswordInput.minChar = minChar;
    PasswordInput.maxChar = maxChar;
    PasswordInput.mustContainLowerChar = mustContainLowerChar;
    PasswordInput.mustContainUpperChar = mustContainUpperChar;
    PasswordInput.mustContainNumeric = mustContainUpperChar;
    PasswordInput.mustContainSpecialChar = mustContainSpecialChar;
  }
}
