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

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Ming`
  String get appTitle {
    return Intl.message(
      'Ming',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `Flutter Demo Home Page`
  String get test {
    return Intl.message(
      'Flutter Demo Home Page',
      name: 'test',
      desc: '',
      args: [],
    );
  }

  /// `Initial state, try click refresh button.`
  String get initialStateTryClickRefreshButton {
    return Intl.message(
      'Initial state, try click refresh button.',
      name: 'initialStateTryClickRefreshButton',
      desc: '',
      args: [],
    );
  }

  /// `Ming`
  String get ming {
    return Intl.message(
      'Ming',
      name: 'ming',
      desc: '',
      args: [],
    );
  }

  /// `이 페이지는 아직 제작 중입니다.`
  String get onTheConstruction {
    return Intl.message(
      '이 페이지는 아직 제작 중입니다.',
      name: 'onTheConstruction',
      desc: '',
      args: [],
    );
  }

  /// `에러가 발생했어요.`
  String get errorMessage {
    return Intl.message(
      '에러가 발생했어요.',
      name: 'errorMessage',
      desc: '',
      args: [],
    );
  }

  /// `준비 중입니다.`
  String get onTheConstructionTitle {
    return Intl.message(
      '준비 중입니다.',
      name: 'onTheConstructionTitle',
      desc: '',
      args: [],
    );
  }

  /// `동물 페이지`
  String get petPageTitle {
    return Intl.message(
      '동물 페이지',
      name: 'petPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `쉼터 페이지`
  String get shelterPageTitle {
    return Intl.message(
      '쉼터 페이지',
      name: 'shelterPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `프로필 페이지`
  String get userProfileTitle {
    return Intl.message(
      '프로필 페이지',
      name: 'userProfileTitle',
      desc: '',
      args: [],
    );
  }

  /// `홈페이지`
  String get homePageTitle {
    return Intl.message(
      '홈페이지',
      name: 'homePageTitle',
      desc: '',
      args: [],
    );
  }

  /// `세팅 페이지`
  String get settingPageTitle {
    return Intl.message(
      '세팅 페이지',
      name: 'settingPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `쉼터 페이지`
  String get shelterSinglePageTitle {
    return Intl.message(
      '쉼터 페이지',
      name: 'shelterSinglePageTitle',
      desc: '',
      args: [],
    );
  }

  /// `로그인에 실패하였습니다.`
  String get loginFailedMessage {
    return Intl.message(
      '로그인에 실패하였습니다.',
      name: 'loginFailedMessage',
      desc: '',
      args: [],
    );
  }

  /// `로그인에 성공하였습니다.`
  String get loginSuccessMessage {
    return Intl.message(
      '로그인에 성공하였습니다.',
      name: 'loginSuccessMessage',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'ko', countryCode: 'KR'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
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
