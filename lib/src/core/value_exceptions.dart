import 'package:valid_value_objects/localization/l10n.dart';

/// Base class for all [ValueException]
abstract class ValueException<T> implements Exception {
  final T invalidValue;
  final ErrorCode error;
  const ValueException(this.invalidValue, this.error);
}

enum ErrorCode {
  required(1),
  invalidValue(2),
  short(3),
  long(4),
  mustContainLower(5),
  mustContainUpper(6),
  mustContainNumber(7),
  mustHaveSpecial(8);

  const ErrorCode(this.value);
  final num value;

  static ErrorCode getByValue(num i) {
    return ErrorCode.values.firstWhere((x) => x.value == i);
  }

  String message({String? customMessage}) {
    if (customMessage == null) {
      switch (this) {
        case ErrorCode.required:
          return ValueObjectLocalizationsImpl.current.valueRequired;
        case ErrorCode.invalidValue:
          return ValueObjectLocalizationsImpl.current.valueInvalid;
        case ErrorCode.short:
          return ValueObjectLocalizationsImpl.current.valueShort;
        case ErrorCode.long:
          return ValueObjectLocalizationsImpl.current.valueLong;
        case ErrorCode.mustContainLower:
          return ValueObjectLocalizationsImpl.current.passwordLower;
        case ErrorCode.mustContainUpper:
          return ValueObjectLocalizationsImpl.current.passwordUpper;
        case ErrorCode.mustContainNumber:
          return ValueObjectLocalizationsImpl.current.passwordNumber;
        case ErrorCode.mustHaveSpecial:
          return ValueObjectLocalizationsImpl.current.passwordSpecialCharacter;
      }
    }
    return customMessage;
  }
}

/// Thrown if value is empty
class RequiredValueException extends ValueException {
  const RequiredValueException() : super(null, ErrorCode.required);

  @override
  String toString() {
    return error.message();
  }
}

/// Thrown if value does not fit the requirements
class InvalidValueException<T> extends ValueException<T> {
  const InvalidValueException(
    T invalidValue, {
    ErrorCode code = ErrorCode.invalidValue,
    this.customMessage,
  }) : super(invalidValue, code);

  final String? customMessage;
  @override
  String toString() {
    return '${error.message(customMessage: customMessage)}: $invalidValue';
  }
}

class TooShortValueException<T> extends ValueException<T> {
  const TooShortValueException(
    T invalidValue, {
    this.customMessage,
  }) : super(invalidValue, ErrorCode.short);
  final String? customMessage;
  @override
  String toString() {
    return '${error.message(customMessage: customMessage)}: $invalidValue';
  }
}

class TooLongValueException<T> extends ValueException<T> {
  const TooLongValueException(
    T invalidValue, {
    this.customMessage,
  }) : super(invalidValue, ErrorCode.long);
  final String? customMessage;
  @override
  String toString() {
    return '${error.message(customMessage: customMessage)}: $invalidValue';
  }
}
