import 'helper.dart';
import 'value_object.dart';

/// Generates a unique id:
///
/// *Example:* `2020-10-31 12:03:33.250111*b363c230e15c`
class UniqueId extends ValueObject<String> {
  /// Default value: `id`
  static String key = 'id';

  const UniqueId(super.id);

  /// Returns a valid [UniqueId] object.
  ///
  /// If [key] is `null` [UniqueId.key] is used to get it's corresponding value in [map].
  factory UniqueId.fromJson(Map<String, dynamic> map, {String? key}) {
    final flatMap = flattenMap(map);
    final value = flatMap[key ?? UniqueId.key].toString();

    return UniqueId(value);
  }

  Map<String, String> toJson({String? key}) => {key ?? UniqueId.key: toString()};
}

class TimeId extends UniqueId {
  /// Default value: `id`
  static String key = 'id';

  /// Creates a [TimeId] by concatenating `DateTime.now()` with a random string separated by an astrisk.
  ///
  /// Example: `2020-10-31 11:43:44.551947*LXoF9A`
  factory TimeId() {
    final id = '${DateTime.now().toString()}*${getRandString(4)}';

    return TimeId._(id);
  }

  factory TimeId.withTime(DateTime time, {String? randStr}) {
    final id = '$time*${randStr ?? getRandString(4)}';

    return TimeId._(id);
  }

  const TimeId._(super.id);

  /// Returns the creation time of `this`
  DateTime get createTime => DateTime.parse(super.toString().split('*')[0]);

  /// Returns a valid [TimeId] object.
  ///
  /// If [key] is `null` [TimeId.key] is used to get it's corresponding value in [map].
  ///
  /// Throws [FormatException] if [DateTime.parse] fails to parse string.
  factory TimeId.fromJson(Map<String, dynamic> map, {String? key}) {
    final flatMap = flattenMap(map);
    final value = flatMap[key ?? TimeId.key].toString();

    final idSplit = value.split('*');

    String? randStr;
    try {
      randStr = idSplit[1];
    } catch (_) {}

    return TimeId.withTime(
      DateTime.parse(idSplit[0]),
      randStr: randStr,
    );
  }

  @override
  Map<String, String> toJson({String? key}) => {key ?? TimeId.key: super.toString()};
}
