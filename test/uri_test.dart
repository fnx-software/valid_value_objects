import 'package:flutter_test/flutter_test.dart';
import 'package:valid_value_objects/src/uri.dart';
import 'package:valid_value_objects/src/value_exceptions.dart';

void main() {
  test('Null & empty', () {
    expect(() => URI(''), throwsA(isA<RequiredValueException>()));
  });

  test('Valid', () {
    /* final uri = URI('http://www.example.com/xyz.html', mustBeAbsolute: true);
    final uri1 = URI('https://john.doe@www.example.com:123/forum/questions/?tag=networking&order=newest#top');
    final uri2 = URI('ldap://[2001:db8::7]/c=GB?objectClass?one');
    final uri3 = URI('mailto:John.Doe@example.com');
    final uri4 = URI('news:comp.infosystems.www.servers.unix');
    final uri5 = URI('tel:+1-816-555-1212');
    final uri6 = URI('telnet://192.0.2.16:80/');
    final uri7 = URI('urn:oasis:names:specification:docbook:dtd:xml:4.1.2');
    final uri8 = URI('https://firebase.google.com/docs/android/setup');*/
  });

  test('fromJson & toJson', () {
    const url = 'https://medium.com/firebase-developers/how-to-build-a-team-based-user-management-system-with-firebase-6a9a6e5c740d';

    final map = {URI.key: url};
    final uri = URI.fromJson(map);
    final uriMap = uri.toJson();
    expect(uriMap['uri'], url);
  });
}
