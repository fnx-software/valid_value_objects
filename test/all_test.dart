import 'package:flutter_test/flutter_test.dart';

import 'email_address_test.dart' as email;
import 'flat_map_test.dart' as flat_map;
import 'helper_test.dart' as helper;
import 'id_test.dart' as id;
import 'ip_test.dart' as ip;
import 'isbn_test.dart' as isbn;
import 'password_test.dart' as password;
import 'phone_number_test.dart' as phone;

void main() {
  group('Email', email.main);

  group('Phone', phone.main);

  group('Id', id.main);

  group('Ip', ip.main);

  group('ISBN', isbn.main);

  group('Password', password.main);

  group('Flat map', flat_map.main);

  group('Helpers', helper.main);
}
