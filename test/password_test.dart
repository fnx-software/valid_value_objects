import 'package:flutter_test/flutter_test.dart';
import 'package:valid_value_objects/src/password.dart';
import 'package:valid_value_objects/src/value_exceptions.dart';

void main() {
  Password.maxChar = 10;

  test('Null & empty', () {
    expect(() => Password(''), throwsA(isA<RequiredValueException>()));
  });

  test('Too short', () {
    expect(() => Password('sd'), throwsA(isA<TooShortValueException>()));
    expect(() => Password('dsfA1'), throwsA(isA<TooShortValueException>()));
  });

  test('Too long', () {
    expect(() => Password('sd14X47sad4'), throwsA(isA<TooLongValueException>()));
    expect(() => Password('ASkxckAJmxk58A&#'), throwsA(isA<TooLongValueException>()));
  });

  test('Valid', () {
    expect(Password('124Xy4Ad'), isA<Password>());
  });

  test('Invalid no upper char', () {
    expect(() => Password('124xy4ad'), throwsA(isA<InvalidValueException>()));
  });

  test('Invalid no lower char', () {
    expect(() => Password('124XY4AD'), throwsA(isA<InvalidValueException>()));
  });

  test('Invalid no numeric char', () {
    expect(() => Password('vk&xypjd'), throwsA(isA<InvalidValueException>()));
  });

  test('Changed requirements', () {
    Password.setRequirements(
      minChar: 1,
      maxChar: 4,
      mustContainLowerChar: false,
      mustContainNumeric: false,
      mustContainUpperChar: false,
    );

    expect(Password('sds'), isA<Password>());
  });
}
