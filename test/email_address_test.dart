import 'package:flutter_test/flutter_test.dart';
import 'package:valid_value_objects/src/core/value_exceptions.dart';
import 'package:valid_value_objects/src/validations/email_address.dart';

void main() {
  test('Null & empty', () {
    expect(() => EmailAddressInput(''), throwsA(isA<RequiredValueException>()));
  });

  test('Valid', () {
    expect(EmailAddressInput('xy@gmail.com'), isA<EmailAddressInput>());
    expect(EmailAddressInput('xy@gmail.com'), isA<EmailAddressInput>());
  });

  test('fromJson & toJson', () {
    final email = EmailAddressInput.fromJson(const {'email': 'xy@gmail.com'});
    expect(email.toString(), 'xy@gmail.com');

    final email2 = EmailAddressInput.fromJson(const {'password': 'jdkJAkxc4', 'email': 'xy@gmail.com'});
    expect(email2.toString(), 'xy@gmail.com');

    expect(email.toJson().toString(), '{email: xy@gmail.com}');

    EmailAddressInput.key = 'em';
    expect(email2.toJson().toString(), '{em: xy@gmail.com}');

    expect(
      () => EmailAddressInput(null),
      throwsA(isA<RequiredValueException>()),
    );

    expect(
      () => EmailAddressInput.fromJson(const {'em': null}),
      throwsA(isA<InvalidValueException>()),
    );

    expect(
      () => EmailAddressInput.fromJson(const {'em': 10}),
      throwsA(isA<InvalidValueException>()),
    );

    expect(
      () => EmailAddressInput.fromJson(const {'qq': 'xy@gmail.com'}),
      throwsA(isA<InvalidValueException>()),
    );
  });

  test('Custom regex', () {
    EmailAddressInput.customValidator = (str) => str.contains('@');
    expect(EmailAddressInput('x@y'), isA<EmailAddressInput>());
    expect(() => EmailAddressInput('xy'), throwsA(isA<InvalidValueException>()));
    expect(() => EmailAddressInput(''), throwsA(isA<RequiredValueException>()));
  });
}
