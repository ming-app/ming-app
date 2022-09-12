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

  /// `봉사지역`
  String get regionString {
    return Intl.message(
      '봉사지역',
      name: 'regionString',
      desc: '',
      args: [],
    );
  }

  /// `로그인 및 회원가입`
  String get loginButtonText {
    return Intl.message(
      '로그인 및 회원가입',
      name: 'loginButtonText',
      desc: '',
      args: [],
    );
  }

  /// `보호소`
  String get shelter {
    return Intl.message(
      '보호소',
      name: 'shelter',
      desc: '',
      args: [],
    );
  }

  /// `개`
  String get unitStringOfShelter {
    return Intl.message(
      '개',
      name: 'unitStringOfShelter',
      desc: '',
      args: [],
    );
  }

  /// `보호동물`
  String get protectingPet {
    return Intl.message(
      '보호동물',
      name: 'protectingPet',
      desc: '',
      args: [],
    );
  }

  /// `마리`
  String get unitStringOfPet {
    return Intl.message(
      '마리',
      name: 'unitStringOfPet',
      desc: '',
      args: [],
    );
  }

  /// `입양된 동물`
  String get adoptedPet {
    return Intl.message(
      '입양된 동물',
      name: 'adoptedPet',
      desc: '',
      args: [],
    );
  }

  /// `봉사자`
  String get volunteer {
    return Intl.message(
      '봉사자',
      name: 'volunteer',
      desc: '',
      args: [],
    );
  }

  /// `명`
  String get unitStringOfPerson {
    return Intl.message(
      '명',
      name: 'unitStringOfPerson',
      desc: '',
      args: [],
    );
  }

  /// `살`
  String get ageString {
    return Intl.message(
      '살',
      name: 'ageString',
      desc: '',
      args: [],
    );
  }

  /// `수컷`
  String get maleString {
    return Intl.message(
      '수컷',
      name: 'maleString',
      desc: '',
      args: [],
    );
  }

  /// `암컷`
  String get femaleString {
    return Intl.message(
      '암컷',
      name: 'femaleString',
      desc: '',
      args: [],
    );
  }

  /// `사진 전체보기`
  String get showAllPhotos {
    return Intl.message(
      '사진 전체보기',
      name: 'showAllPhotos',
      desc: '',
      args: [],
    );
  }

  /// `봉사예약`
  String get reserveVolunteer {
    return Intl.message(
      '봉사예약',
      name: 'reserveVolunteer',
      desc: '',
      args: [],
    );
  }

  /// `유기견`
  String get anbandonedDogString {
    return Intl.message(
      '유기견',
      name: 'anbandonedDogString',
      desc: '',
      args: [],
    );
  }

  /// `유기묘`
  String get abandonedCatString {
    return Intl.message(
      '유기묘',
      name: 'abandonedCatString',
      desc: '',
      args: [],
    );
  }

  /// `공유하기`
  String get share {
    return Intl.message(
      '공유하기',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// `리뷰`
  String get review {
    return Intl.message(
      '리뷰',
      name: 'review',
      desc: '',
      args: [],
    );
  }

  /// `명의 봉사자들이 함께 하고 있어요.`
  String get volunteerNumberSentenceString {
    return Intl.message(
      '명의 봉사자들이 함께 하고 있어요.',
      name: 'volunteerNumberSentenceString',
      desc: '',
      args: [],
    );
  }

  /// `더보기`
  String get showMore {
    return Intl.message(
      '더보기',
      name: 'showMore',
      desc: '',
      args: [],
    );
  }

  /// `축소`
  String get showLess {
    return Intl.message(
      '축소',
      name: 'showLess',
      desc: '',
      args: [],
    );
  }

  /// `봉사 스케쥴`
  String get volunteerSchedule {
    return Intl.message(
      '봉사 스케쥴',
      name: 'volunteerSchedule',
      desc: '',
      args: [],
    );
  }

  /// `위치`
  String get location {
    return Intl.message(
      '위치',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `대표 관리자`
  String get shelterOwner {
    return Intl.message(
      '대표 관리자',
      name: 'shelterOwner',
      desc: '',
      args: [],
    );
  }

  /// `연락하기`
  String get doCall {
    return Intl.message(
      '연락하기',
      name: 'doCall',
      desc: '',
      args: [],
    );
  }

  /// `날짜`
  String get date {
    return Intl.message(
      '날짜',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `시간`
  String get time {
    return Intl.message(
      '시간',
      name: 'time',
      desc: '',
      args: [],
    );
  }

  /// `봉사인원`
  String get numberOfVolunteers {
    return Intl.message(
      '봉사인원',
      name: 'numberOfVolunteers',
      desc: '',
      args: [],
    );
  }

  /// `보호 중인 친구들`
  String get protectingPets {
    return Intl.message(
      '보호 중인 친구들',
      name: 'protectingPets',
      desc: '',
      args: [],
    );
  }

  /// `입양 신청`
  String get adoptRequest {
    return Intl.message(
      '입양 신청',
      name: 'adoptRequest',
      desc: '',
      args: [],
    );
  }

  /// `입양 신청하기`
  String get adoptRequestButton {
    return Intl.message(
      '입양 신청하기',
      name: 'adoptRequestButton',
      desc: '',
      args: [],
    );
  }

  /// `강아지`
  String get dog {
    return Intl.message(
      '강아지',
      name: 'dog',
      desc: '',
      args: [],
    );
  }

  /// `고양이`
  String get cat {
    return Intl.message(
      '고양이',
      name: 'cat',
      desc: '',
      args: [],
    );
  }

  /// `로그인 또는 회원가입`
  String get loginTitle {
    return Intl.message(
      '로그인 또는 회원가입',
      name: 'loginTitle',
      desc: '',
      args: [],
    );
  }

  /// `로그인을 해야 다음 단계로 넘어갈 수 있어요!`
  String get loginGuide1 {
    return Intl.message(
      '로그인을 해야 다음 단계로 넘어갈 수 있어요!',
      name: 'loginGuide1',
      desc: '',
      args: [],
    );
  }

  /// `Kakao`
  String get kakao {
    return Intl.message(
      'Kakao',
      name: 'kakao',
      desc: '',
      args: [],
    );
  }

  /// `Facebook`
  String get facebook {
    return Intl.message(
      'Facebook',
      name: 'facebook',
      desc: '',
      args: [],
    );
  }

  /// `Google`
  String get google {
    return Intl.message(
      'Google',
      name: 'google',
      desc: '',
      args: [],
    );
  }

  /// `로그인은 개인 보호 정책 및 서비스 약관에 동의하는 것을 의미하며, \n서비스 이용을 위해 이메일과 이름, 프로필 이미지를 수집합니다.`
  String get loginGuide2 {
    return Intl.message(
      '로그인은 개인 보호 정책 및 서비스 약관에 동의하는 것을 의미하며, \n서비스 이용을 위해 이메일과 이름, 프로필 이미지를 수집합니다.',
      name: 'loginGuide2',
      desc: '',
      args: [],
    );
  }

  /// `주소 복사`
  String get copyAddress {
    return Intl.message(
      '주소 복사',
      name: 'copyAddress',
      desc: '',
      args: [],
    );
  }

  /// `주소 복사 완료`
  String get completeCopyingAddress {
    return Intl.message(
      '주소 복사 완료',
      name: 'completeCopyingAddress',
      desc: '',
      args: [],
    );
  }

  /// `관리자`
  String get managerTitle {
    return Intl.message(
      '관리자',
      name: 'managerTitle',
      desc: '',
      args: [],
    );
  }

  /// `수정`
  String get edit {
    return Intl.message(
      '수정',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `취소`
  String get cancel {
    return Intl.message(
      '취소',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `저장`
  String get save {
    return Intl.message(
      '저장',
      name: 'save',
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
