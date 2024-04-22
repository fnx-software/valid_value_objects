import 'package:flutter_test/flutter_test.dart';
import 'package:valid_value_objects/valid_value_objects.dart';

void main() {
  test('RequiredValueException', () {
    expect(() => PhoneNumberInput(null), throwsA(isA<RequiredValueException>()));
    expect(() => PhoneNumberInput(''), throwsA(isA<RequiredValueException>()));
  });

  test('Hungarian phone numbers', () {
    expect(PhoneNumberInput('+36301457841'), isA<PhoneNumberInput>());
    expect(PhoneNumberInput('06301457841'), isA<PhoneNumberInput>());
  });

  test('Custom validation', () {
    PhoneNumberInput.customValidator = (str) => str.length > 5 && str.length < 12;
    expect(
      () => PhoneNumberInput('+36301457841'),
      throwsA(isA<InvalidValueException>()),
    );
    expect(PhoneNumberInput('06301457841'), isA<PhoneNumberInput>());
  });
}
