import 'package:flutter_test/flutter_test.dart';
import 'package:valid_value_objects/valid_value_objects.dart';

void main() {
  PasswordInput.maxChar = 10;

  test('Null & empty', () {
    expect(() => PasswordInput(''), throwsA(isA<RequiredValueException>()));
  });

  test('Too short', () {
    expect(() => PasswordInput('sd'), throwsA(isA<TooShortValueException>()));
    expect(() => PasswordInput('dsfA1'), throwsA(isA<TooShortValueException>()));
  });

  test('Too long', () {
    expect(() => PasswordInput('sd14X47sad4'), throwsA(isA<TooLongValueException>()));
    expect(() => PasswordInput('ASkxckAJmxk58A&#'), throwsA(isA<TooLongValueException>()));
  });

  test('Valid', () {
    expect(PasswordInput('124Xy4Ad'), isA<PasswordInput>());
  });

  test('Invalid no upper char', () {
    expect(() => PasswordInput('124xy4ad'), throwsA(isA<InvalidValueException>()));
  });

  test('Invalid no lower char', () {
    expect(() => PasswordInput('124XY4AD'), throwsA(isA<InvalidValueException>()));
  });

  test('Invalid no numeric char', () {
    expect(() => PasswordInput('vk&xypjd'), throwsA(isA<InvalidValueException>()));
  });

  test('Changed requirements', () {
    PasswordInput.setRequirements(
      minChar: 1,
      maxChar: 4,
      mustContainLowerChar: false,
      mustContainNumeric: false,
      mustContainUpperChar: false,
    );

    expect(PasswordInput('sds'), isA<PasswordInput>());
  });
}
