import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:valid_value_objects/src/validations/id.dart';

void main() {
  test('UniqueId', () {
    const uid = UniqueId('uniqueId');

    if (kDebugMode) {
      print(uid.toString());
    }
  });

  test('fromJson & toJson', () {
    final id = UniqueId.fromJson({UniqueId.key: 'uniqueId'});

    expect(id.toJson(), {UniqueId.key: 'uniqueId'});

    expect(id, isA<UniqueId>());
    expect(
      UniqueId.fromJson({
        'x': {UniqueId.key: 'uniqueId'}
      }),
      isA<UniqueId>(),
    );
  });

  test('TimeId with DateTime.now()', () {
    final now = DateTime.now();

    final id = TimeId.withTime(now);

    log(now.toString());

    expect(id.createTime, now);
  });

  test('TimeId fromJson toJson', () {
    final dt = DateTime.parse('2021-03-11 00:15:50.285701');
    final map = {TimeId.key: '2021-03-11 00:15:50.285701*1A1Xk'};

    final id = TimeId.fromJson(map);

    expect(id.createTime, dt);
    expect(id.toJson(), map);
  });
}
