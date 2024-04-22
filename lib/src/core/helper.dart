import 'dart:math';
import 'dart:convert';

const _hasNumberRegex = '(?=.*[0-9])';
const _hasLowerCharRegex = '(?=.*[a-z])';
const _hasUpperCharRegex = '(?=.*[A-Z])';
const _hasSpecialCharRegex = '(?=.*[ !"#\$%&\'()*+,-./:;<=>?@[\\]^_`{|}~])';

typedef ValidCallback = bool Function(String str);

bool hasNumeric(String str) => str.contains(RegExp(_hasNumberRegex));

bool hasLowerChar(String str) => str.contains(RegExp(_hasLowerCharRegex));

bool hasUpperChar(String str) => str.contains(RegExp(_hasUpperCharRegex));

bool hasSpecialChar(String str) => str.contains(RegExp(_hasSpecialCharRegex));

bool isNumeric(String str) => int.tryParse(str) == null ? false : true;

String capitalizeFirstLetter(String str) {
  if (str.isNotEmpty) {
    return '${str[0].toUpperCase()}${str.substring(1)}';
  }
  return str;
}

String getRandString(int length) {
  assert(length > 3);

  var random = Random.secure();
  var values = List<int>.generate(length, (i) => random.nextInt(255));
  final encodedVal = base64UrlEncode(values);

  return encodedVal.substring(0, encodedVal.length - 2);
}

Map<String, dynamic> flattenMap(dynamic map) {
  final flatMap = <String, dynamic>{};
  map.entries.forEach((e) {
    if (e.value is Map) {
      flatMap.addAll(flattenMap(e.value));
    } else {
      flatMap.addEntries([e]);
    }
  });
  return flatMap;
}
