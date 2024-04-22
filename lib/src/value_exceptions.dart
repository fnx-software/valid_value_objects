/// Base class for all [ValueException]
abstract class ValueException<T> implements Exception {
  final T invalidValue;
  final String code;
  final String message;

  const ValueException(this.invalidValue, this.code, this.message);
}

/// Thrown if value is empty
class RequiredValueException extends ValueException {
  const RequiredValueException({
    String message = 'validate.',
  }) : super(null, 'required', message);

  @override
  String toString() {
    return message;
  }
}

/// Thrown if value does not fit the requirements
class InvalidValueException<T> extends ValueException<T> {
  const InvalidValueException(
    T invalidValue, {
    String code = 'invalid-value',
    String message = 'Invalid value.',
  }) : super(invalidValue, code, message);

  @override
  String toString() {
    return '$message: $invalidValue';
  }
}

class TooShortValueException<T> extends ValueException<T> {
  const TooShortValueException(
    T invalidValue, {
    String message = 'Value is too short',
  }) : super(invalidValue, 'short', message);

  @override
  String toString() {
    return '$message: $invalidValue';
  }
}

class TooLongValueException<T> extends ValueException<T> {
  const TooLongValueException(
    T invalidValue, {
    String message = 'Value is too long',
  }) : super(invalidValue, 'long', message);

  @override
  String toString() {
    return '$message: $invalidValue';
  }
}
