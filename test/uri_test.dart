import 'package:flutter_test/flutter_test.dart';
import 'package:valid_value_objects/src/core/value_exceptions.dart';
import 'package:valid_value_objects/src/validations/uri.dart';
import 'package:valid_value_objects/valid_value_objects.dart';

void main() {
  test('Null & empty', () {
    expect(() => URIInput(''), throwsA(isA<RequiredValueException>()));
  });

  test('Valid', () {
    /* final uri = URIInput('http://www.example.com/xyz.html', mustBeAbsolute: true);
    final uri1 = URIInput('https://john.doe@www.example.com:123/forum/questions/?tag=networking&order=newest#top');
    final uri2 = URIInput('ldap://[2001:db8::7]/c=GB?objectClass?one');
    final uri3 = URIInput('mailto:John.Doe@example.com');
    final uri4 = URIInput('news:comp.infosystems.www.servers.unix');
    final uri5 = URIInput('tel:+1-816-555-1212');
    final uri6 = URIInput('telnet://192.0.2.16:80/');
    final uri7 = URIInput('urn:oasis:names:specification:docbook:dtd:xml:4.1.2');
    final uri8 = URIInput('https://firebase.google.com/docs/android/setup');*/
  });

  test('fromJson & toJson', () {
    const url = 'https://medium.com/firebase-developers/how-to-build-a-team-based-user-management-system-with-firebase-6a9a6e5c740d';

    final map = {URIInput.key: url};
    final uri = URIInput.fromJson(map);
    final uriMap = uri.toJson();
    expect(uriMap['uri'], url);
  });
}
