import 'package:flutter_test/flutter_test.dart';
import 'package:valid_value_objects/src/email_address.dart';
import 'package:valid_value_objects/src/value_exceptions.dart';

void main() {
  test('Null & empty', () {
    expect(() => EmailAddress(''), throwsA(isA<RequiredValueException>()));
  });

  test('Valid', () {
    expect(EmailAddress('xy@gmail.com'), isA<EmailAddress>());
    expect(EmailAddress('xy@gmail.com'), isA<EmailAddress>());
  });

  test('fromJson & toJson', () {
    final email = EmailAddress.fromJson(const {'email': 'xy@gmail.com'});
    expect(email.toString(), 'xy@gmail.com');

    final email2 = EmailAddress.fromJson(const {'password': 'jdkJAkxc4', 'email': 'xy@gmail.com'});
    expect(email2.toString(), 'xy@gmail.com');

    expect(email.toJson().toString(), '{email: xy@gmail.com}');

    EmailAddress.key = 'em';
    expect(email2.toJson().toString(), '{em: xy@gmail.com}');

    expect(
      () => EmailAddress(null),
      throwsA(isA<RequiredValueException>()),
    );

    expect(
      () => EmailAddress.fromJson(const {'em': null}),
      throwsA(isA<InvalidValueException>()),
    );

    expect(
      () => EmailAddress.fromJson(const {'em': 10}),
      throwsA(isA<InvalidValueException>()),
    );

    expect(
      () => EmailAddress.fromJson(const {'qq': 'xy@gmail.com'}),
      throwsA(isA<InvalidValueException>()),
    );
  });

  test('Custom regex', () {
    EmailAddress.customValidator = (str) => str.contains('@');
    expect(EmailAddress('x@y'), isA<EmailAddress>());
    expect(() => EmailAddress('xy'), throwsA(isA<InvalidValueException>()));
    expect(() => EmailAddress(''), throwsA(isA<RequiredValueException>()));
  });
}
