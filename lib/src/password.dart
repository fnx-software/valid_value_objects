import '../src/helper.dart';
import '../src/value_exceptions.dart';
import '../src/value_object.dart';

class Password extends ValueObject<String> {
  /// Default value: `password`
  static String key = 'password';

  static int minChar = 8;
  static int maxChar = 255;

  static bool mustContainNumeric = true;
  static bool mustContainLowerChar = true;
  static bool mustContainUpperChar = true;
  static bool mustContainSpecialChar = false;

  /// Returns a valid [Password] object.
  ///
  /// Throws [ValueException]:
  ///
  /// - [RequiredValueException] if [str] is null or empty.
  /// - [TooShortValueException] if [str] has too few characters.
  /// - [TooLongValueException] if [str] has too many characters.
  /// - [InvalidValueException] if [str] is invalid.
  factory Password(String? str) {
    if (str == null || str.isEmpty) {
      throw const RequiredValueException();
    } else if (str.length < minChar) {
      throw TooShortValueException(str);
    } else if (str.length > maxChar) {
      throw TooLongValueException(str);
    } else if (Password.mustContainLowerChar && !hasLowerChar(str)) {
      throw InvalidValueException(
        str,
        code: 'must-contain-lower',
        message: 'Password must contain a lower case letter.',
      );
    } else if (Password.mustContainUpperChar && !hasUpperChar(str)) {
      throw InvalidValueException(
        str,
        code: 'must-contain-upper',
        message: 'Password must contain an upper case letter.',
      );
    } else if (Password.mustContainNumeric && !hasNumeric(str)) {
      throw InvalidValueException(
        str,
        code: 'must-contain-number',
        message: 'Password must contain a number.',
      );
    } else if (Password.mustContainSpecialChar && !hasSpecialChar(str)) {
      throw InvalidValueException(
        str,
        code: 'must-have-special',
        message: 'Password must contain a special character.',
      );
    }

    return Password._(str);
  }

  const Password._(super.value);

  /// One of the following [ValueException] maybe thrown:
  /// - RequiredValueException
  /// - TooShortValueException
  /// - TooLongValueException
  /// - InvalidValueException
  factory Password.fromValueObject(ValueObject vo) {
    return Password(vo.toString());
  }

  /// One of the following [ValueException] maybe thrown:
  /// - RequiredValueException
  /// - TooShortValueException
  /// - TooLongValueException
  /// - InvalidValueException
  factory Password.fromJson(Map<String, dynamic> map, {String? key}) {
    final flatMap = flattenMap(map);
    final value = flatMap[key ?? Password.key].toString();

    return Password(value);
  }

  Map<String, String> toJson({String? key}) => {key ?? Password.key: toString()};

  static void setRequirements({
    int minChar = 6,
    int maxChar = 255,
    bool mustContainLowerChar = true,
    bool mustContainUpperChar = true,
    bool mustContainNumeric = true,
    bool mustContainSpecialChar = false,
  }) {
    Password.minChar = minChar;
    Password.maxChar = maxChar;
    Password.mustContainLowerChar = mustContainLowerChar;
    Password.mustContainUpperChar = mustContainUpperChar;
    Password.mustContainNumeric = mustContainUpperChar;
    Password.mustContainSpecialChar = mustContainSpecialChar;
  }
}
