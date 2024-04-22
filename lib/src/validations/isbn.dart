import 'package:string_validator/string_validator.dart';
import 'package:valid_value_objects/valid_value_objects.dart';

import '../core/helper.dart';

enum ISBNVersion { v10, v13 }

class ISBN extends ValueObject<String> {
  /// Default value: `isbn`
  static String key = 'isbn';

  /// Stores the ISBN version of `this`, which is either v10 or v13.
  final ISBNVersion version;

  /// Returns a valid [ISBN] object.
  ///
  /// Throws [ValueException]:
  /// - [RequiredValueException] if [str] is null or empty.
  /// - [InvalidValueException] if [str] is not a valid ISBN number.
  factory ISBN(String? str) {
    if (str == null || str.isEmpty) {
      throw const RequiredValueException();
    } else if (isISBN(str, '10')) {
      return ISBN._(str, ISBNVersion.v10);
    } else if (isISBN(str, '13')) {
      return ISBN._(str, ISBNVersion.v13);
    }
    throw InvalidValueException(str, customMessage: '${ValueObjectLocalizationsImpl.current.isbnInvalid}.');
  }

  const ISBN._(super.value, this.version);

  /// Returns a valid [ISBN] object.
  ///
  /// Throws [InvalidValueException] if [vo] is not a valid ISBN.
  factory ISBN.fromValueObject(ValueObject vo) {
    return ISBN(vo.toString());
  }

  /// Returns a valid [ISBN] object.
  ///
  /// If [key] is `null` [ISBN.key] is used to get it's corresponding value in [map].
  ///
  /// Throws [InvalidValueException] if [map]'s value is not a valid ISBN number.
  factory ISBN.fromJson(Map<String, dynamic> map, {String? key}) {
    final flatMap = flattenMap(map);
    final value = flatMap[key ?? ISBN.key].toString();
    return ISBN(value.toString());
  }

  Map<String, String> toJson({String? key}) => {key ?? ISBN.key: this.toString()};
}
