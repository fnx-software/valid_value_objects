import 'package:flutter_test/flutter_test.dart';
import 'package:valid_value_objects/src/phone_number.dart';
import 'package:valid_value_objects/src/value_exceptions.dart';

void main() {
  test('RequiredValueException', () {
    expect(() => PhoneNumber(null), throwsA(isA<RequiredValueException>()));
    expect(() => PhoneNumber(''), throwsA(isA<RequiredValueException>()));
  });

  test('Hungarian phone numbers', () {
    expect(PhoneNumber('+36301457841'), isA<PhoneNumber>());
    expect(PhoneNumber('06301457841'), isA<PhoneNumber>());
  });

  test('Custom validation', () {
    PhoneNumber.customValidator = (str) => str.length > 5 && str.length < 12;
    expect(
      () => PhoneNumber('+36301457841'),
      throwsA(isA<InvalidValueException>()),
    );
    expect(PhoneNumber('06301457841'), isA<PhoneNumber>());
  });
}
