import 'package:meta/meta.dart';

@immutable
abstract class ValueObject<T> {
  final T value;

  const ValueObject(this.value);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is ValueObject<T> && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  /// Returns the object's valid value as a String
  @override
  String toString() {
    return value.toString();
  }
}
