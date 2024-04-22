import 'package:valid_value_objects/valid_value_objects.dart';

import '../core/helper.dart';

class URIInput extends ValueObject<Uri> {
  /// Default value: `uri`
  static String key = 'uri';

  /// Returns a valid [URIInput] object.
  ///
  /// Throws [ValueException]:
  /// - [RequiredValueException] if [str] is null or empty.
  /// - [InvalidValueException] if [str] is not a valid URIInput.
  factory URIInput(String? str, {bool mustBeAbsolute = false}) {
    if (str == null || str.isEmpty) {
      throw const RequiredValueException();
    }
    Uri uri;
    try {
      uri = Uri.parse(str);
    } on FormatException catch (e) {
      throw InvalidValueException(str, customMessage: e.message);
    }

    if (mustBeAbsolute && !uri.isAbsolute) {
      throw InvalidValueException(str, customMessage: '${ValueObjectLocalizationsImpl.current.uriInvalid}.');
    }
    return URIInput._(uri);
  }

  const URIInput._(super.uri);

  /// Returns a valid [URIInput] object.
  ///
  /// If [key] is `null` [URIInput.key] is used to get it's corresponding value in [map].
  ///
  /// Throws [InvalidValueException] if [map]'s value is not a valid URIInput.
  factory URIInput.fromJson(Map<String, dynamic> map, {String? key}) {
    final flatMap = flattenMap(map);
    final value = flatMap[key ?? URIInput.key].toString();

    return URIInput(value);
  }

  Map<String, String> toJson({String? key}) => {key ?? URIInput.key: super.toString()};
}
