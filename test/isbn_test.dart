import 'package:flutter_test/flutter_test.dart';
import 'package:valid_value_objects/valid_value_objects.dart';

void main() {
  test('Null & empty', () {
    expect(() => ISBNInput(''), throwsA(isA<RequiredValueException>()));
  });

  test('Invalid', () {
    expect(() => ISBNInput('sd'), throwsA(isA<InvalidValueException>()));
    expect(() => ISBNInput('dsfA1'), throwsA(isA<InvalidValueException>()));
  });

  test('Valid ISBNInput 10', () {
    final isbn = ISBNInput('1-56619-909-3');
    expect(isbn.version, ISBNInputVersion.v10);
  });

  test('Valid ISBNInput 13', () {
    final isbn = ISBNInput('978-1-56619-909-4');
    expect(isbn.version, ISBNInputVersion.v13);
  });
}
