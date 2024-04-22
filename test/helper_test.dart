import 'dart:developer';

import 'package:flutter_test/flutter_test.dart';
import 'package:valid_value_objects/src/helper.dart';

void main() {
  test('Get random string invalid length', () {
    expect(() => getRandString(3), throwsA(isA<AssertionError>()));
    expect(() => getRandString(-1), throwsA(isA<AssertionError>()));
  });

  test('Valid random String', () {
    log(getRandString(4));
    log(getRandString(8));
  });
}
