import 'helper.dart';
import 'value_exceptions.dart';
import 'value_object.dart';

class URI extends ValueObject<Uri> {
  /// Default value: `uri`
  static String key = 'uri';

  /// Returns a valid [URI] object.
  ///
  /// Throws [ValueException]:
  /// - [RequiredValueException] if [str] is null or empty.
  /// - [InvalidValueException] if [str] is not a valid URI.
  factory URI(String? str, {bool mustBeAbsolute = false}) {
    if (str == null || str.isEmpty) {
      throw const RequiredValueException();
    }
    Uri uri;
    try {
      uri = Uri.parse(str);
    } on FormatException catch (e) {
      throw InvalidValueException(str, message: e.message);
    }

    if (mustBeAbsolute && !uri.isAbsolute) {
      throw InvalidValueException(str, message: 'URI must be absolute.');
    }
    return URI._(uri);
  }

  const URI._(super.uri);

  /// Returns a valid [URI] object.
  ///
  /// If [key] is `null` [URI.key] is used to get it's corresponding value in [map].
  ///
  /// Throws [InvalidValueException] if [map]'s value is not a valid URI.
  factory URI.fromJson(Map<String, dynamic> map, {String? key}) {
    final flatMap = flattenMap(map);
    final value = flatMap[key ?? URI.key].toString();

    return URI(value);
  }

  Map<String, String> toJson({String? key}) => {key ?? URI.key: super.toString()};
}
