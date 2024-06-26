import 'package:flutter_test/flutter_test.dart';
import 'package:valid_value_objects/valid_value_objects.dart';

void main() {
  test('Null & empty', () {
    expect(() => IPAddressInput(''), throwsA(isA<RequiredValueException>()));
  });

  test('Valid', () {
    final ipv4 = IPAddressInput('192.168.15.1');
    expect(ipv4.version, IPVersion.v4);

    final ipv6 = IPAddressInput('2001:db8:0:0:0:0:2:1');
    expect(ipv6.version, IPVersion.v6);
  });
}
