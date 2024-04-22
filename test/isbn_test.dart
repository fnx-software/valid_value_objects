import 'package:flutter_test/flutter_test.dart';
import 'package:valid_value_objects/valid_value_objects.dart';

void main() {
  test('Null & empty', () {
    expect(() => ISBN(''), throwsA(isA<RequiredValueException>()));
  });

  test('Invalid', () {
    expect(() => ISBN('sd'), throwsA(isA<InvalidValueException>()));
    expect(() => ISBN('dsfA1'), throwsA(isA<InvalidValueException>()));
  });

  test('Valid ISBN 10', () {
    final isbn = ISBN('1-56619-909-3');
    expect(isbn.version, ISBNVersion.v10);
  });

  test('Valid ISBN 13', () {
    final isbn = ISBN('978-1-56619-909-4');
    expect(isbn.version, ISBNVersion.v13);
  });
}
