import 'package:string_validator/string_validator.dart';
import 'package:valid_value_objects/localization/l10n.dart';

import '../core/helper.dart';
import '../core/value_exceptions.dart';
import '../core/value_object.dart';

enum IPVersion { v4, v6 }

class IPAddress extends ValueObject<String> {
  /// Default value: `ip`
  static String key = 'ip';

  /// Stores the IP version of `this`, which is either IPv4 or IPv6.
  final IPVersion version;

  /// Returns a valid [IPAddress] object.
  ///
  /// Throws [ValueException]:
  /// - [RequiredValueException] if [str] is null or empty.
  /// - [InvalidValueException] if [str] is not a valid IPv4 or IPv6 address.
  factory IPAddress(String? str) {
    if (str == null || str.isEmpty) {
      throw const RequiredValueException();
    }

    if (isIP(str, '4')) {
      return IPAddress._(str, IPVersion.v4);
    } else if (isIP(str, '6')) {
      return IPAddress._(str, IPVersion.v6);
    }

    throw InvalidValueException(
      str,
      customMessage: '$str ${ValueObjectLocalizationsImpl.current.ipInvalid}',
    );
  }

  const IPAddress._(super.value, this.version);

  /// Returns a valid [IPAddress] object.
  ///
  /// If [key] is `null` [IPAddress.key] is used to get it's corresponding value in [map].
  ///
  /// Throws [InvalidValueException] if [map]'s value is not a valid IPv4 or IPv6 address.
  factory IPAddress.fromJson(Map<String, dynamic> map, {String? key}) {
    final flatMap = flattenMap(map);
    final value = flatMap[key ?? IPAddress.key].toString();

    return IPAddress(value);
  }

  /// Returns a valid [IPAddress] object.
  ///
  /// Throws [InvalidValueException] if [vo] is not a valid IPv4 or IPv6 address.
  factory IPAddress.fromValueObject(ValueObject vo) {
    return IPAddress(vo.toString());
  }

  Map<String, String> toJson({String? key}) => {key ?? IPAddress.key: super.toString()};
}
