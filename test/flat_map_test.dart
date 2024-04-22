import 'package:flutter_test/flutter_test.dart';
import 'package:valid_value_objects/src/core/helper.dart';

void main() {
  const sample = {
    'person': {
      'name': 'hehe',
      'email': 'xy@gmail.com',
      'address': {
        'country': 'Hungary',
        'city': 'Szekszard',
        'street': 'Béri Balogh Ádám u.',
      },
      'colors': ['green', 'red', 'yellow'],
    },
    'food': {'fruit': 'apple', 'meat': 'chicken'},
  };

  test('Flatten map and test if they contains a key', () {
    final flatMap = flattenMap(sample);

    expect(flatMap.containsKey('name'), true);
    expect(flatMap.containsKey('colors'), true);
    expect(flatMap.containsKey('meat'), true);
    expect(flatMap.containsKey('city'), true);
    expect(flatMap.containsKey('food'), false);
    expect(flatMap.containsKey('address'), false);
  });
}
