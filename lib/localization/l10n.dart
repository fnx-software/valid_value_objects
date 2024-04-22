// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class ValueObjectLocalizationsImpl {
  ValueObjectLocalizationsImpl();

  static ValueObjectLocalizationsImpl? _current;

  static ValueObjectLocalizationsImpl get current {
    assert(_current != null,
        'No instance of ValueObjectLocalizationsImpl was loaded. Try to initialize the ValueObjectLocalizationsImpl delegate before accessing ValueObjectLocalizationsImpl.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<ValueObjectLocalizationsImpl> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = ValueObjectLocalizationsImpl();
      ValueObjectLocalizationsImpl._current = instance;

      return instance;
    });
  }

  static ValueObjectLocalizationsImpl of(BuildContext context) {
    final instance = ValueObjectLocalizationsImpl.maybeOf(context);
    assert(instance != null,
        'No instance of ValueObjectLocalizationsImpl present in the widget tree. Did you add ValueObjectLocalizationsImpl.delegate in localizationsDelegates?');
    return instance!;
  }

  static ValueObjectLocalizationsImpl? maybeOf(BuildContext context) {
    return Localizations.of<ValueObjectLocalizationsImpl>(
        context, ValueObjectLocalizationsImpl);
  }

  /// `Value must be required`
  String get valueRequired {
    return Intl.message(
      'Value must be required',
      name: 'valueRequired',
      desc: '',
      args: [],
    );
  }

  /// `Invalid value'`
  String get valueInvalid {
    return Intl.message(
      'Invalid value\'',
      name: 'valueInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Value is too short`
  String get valueShort {
    return Intl.message(
      'Value is too short',
      name: 'valueShort',
      desc: '',
      args: [],
    );
  }

  /// `Value is too long`
  String get valueLong {
    return Intl.message(
      'Value is too long',
      name: 'valueLong',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email address`
  String get emailInvalid {
    return Intl.message(
      'Invalid email address',
      name: 'emailInvalid',
      desc: '',
      args: [],
    );
  }

  /// `is not a valid IP address`
  String get ipInvalid {
    return Intl.message(
      'is not a valid IP address',
      name: 'ipInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Invalid ISBN number`
  String get isbnInvalid {
    return Intl.message(
      'Invalid ISBN number',
      name: 'isbnInvalid',
      desc: '',
      args: [],
    );
  }

  /// `URI must be absolute`
  String get uriInvalid {
    return Intl.message(
      'URI must be absolute',
      name: 'uriInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Invalid phone number`
  String get phoneInvalid {
    return Intl.message(
      'Invalid phone number',
      name: 'phoneInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain a lower case letter`
  String get passwordLower {
    return Intl.message(
      'Password must contain a lower case letter',
      name: 'passwordLower',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain an upper case letter`
  String get passwordUpper {
    return Intl.message(
      'Password must contain an upper case letter',
      name: 'passwordUpper',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain a number`
  String get passwordNumber {
    return Intl.message(
      'Password must contain a number',
      name: 'passwordNumber',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain a special character`
  String get passwordSpecialCharacter {
    return Intl.message(
      'Password must contain a special character',
      name: 'passwordSpecialCharacter',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate
    extends LocalizationsDelegate<ValueObjectLocalizationsImpl> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<ValueObjectLocalizationsImpl> load(Locale locale) =>
      ValueObjectLocalizationsImpl.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
