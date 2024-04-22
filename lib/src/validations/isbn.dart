import 'package:string_validator/string_validator.dart';
import 'package:valid_value_objects/valid_value_objects.dart';

import '../core/helper.dart';

enum ISBNInputVersion { v10, v13 }

class ISBNInput extends ValueObject<String> {
  /// Default value: `isbn`
  static String key = 'isbn';

  /// Stores the ISBNInput version of `this`, which is either v10 or v13.
  final ISBNInputVersion version;

  /// Returns a valid [ISBNInput] object.
  ///
  /// Throws [ValueException]:
  /// - [RequiredValueException] if [str] is null or empty.
  /// - [InvalidValueException] if [str] is not a valid ISBNInput number.
  factory ISBNInput(String? str) {
    if (str == null || str.isEmpty) {
      throw const RequiredValueException();
    } else if (isISBN(str, '10')) {
      return ISBNInput._(str, ISBNInputVersion.v10);
    } else if (isISBN(str, '13')) {
      return ISBNInput._(str, ISBNInputVersion.v13);
    }
    throw InvalidValueException(str, customMessage: '${ValueObjectLocalizationsImpl.current.isbnInvalid}.');
  }

  const ISBNInput._(super.value, this.version);

  /// Returns a valid [ISBNInput] object.
  ///
  /// Throws [InvalidValueException] if [vo] is not a valid ISBNInput.
  factory ISBNInput.fromValueObject(ValueObject vo) {
    return ISBNInput(vo.toString());
  }

  /// Returns a valid [ISBNInput] object.
  ///
  /// If [key] is `null` [ISBNInput.key] is used to get it's corresponding value in [map].
  ///
  /// Throws [InvalidValueException] if [map]'s value is not a valid ISBNInput number.
  factory ISBNInput.fromJson(Map<String, dynamic> map, {String? key}) {
    final flatMap = flattenMap(map);
    final value = flatMap[key ?? ISBNInput.key].toString();
    return ISBNInput(value.toString());
  }

  Map<String, String> toJson({String? key}) => {key ?? ISBNInput.key: this.toString()};
}
