import 'package:flutter_test/flutter_test.dart';
import 'package:valid_value_objects/valid_value_objects.dart';

void main() {
  test('Null & empty', () {
    expect(() => IPAddress(''), throwsA(isA<RequiredValueException>()));
  });

  test('Valid', () {
    final ipv4 = IPAddress('192.168.15.1');
    expect(ipv4.version, IPVersion.v4);

    final ipv6 = IPAddress('2001:db8:0:0:0:0:2:1');
    expect(ipv6.version, IPVersion.v6);
  });
}
