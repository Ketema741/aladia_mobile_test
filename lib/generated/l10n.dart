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

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get getStarted {
    return Intl.message(
      'Get Started',
      name: 'getStarted',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to HakimHub`
  String get welcome {
    return Intl.message(
      'Welcome to HakimHub',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get enterYourEmail {
    return Intl.message(
      'Enter your email',
      name: 'enterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Provide easily accessible information about healthcare facilities and healthcare professionals`
  String get welcomeDescription {
    return Intl.message(
      'Provide easily accessible information about healthcare facilities and healthcare professionals',
      name: 'welcomeDescription',
      desc: '',
      args: [],
    );
  }

  /// `Standby Doctors`
  String get welcome2 {
    return Intl.message(
      'Standby Doctors',
      name: 'welcome2',
      desc: '',
      args: [],
    );
  }

  /// `Effortlessly connect with top doctors. Review, schedule, and explore your healthcare options.`
  String get welcomeDescription2 {
    return Intl.message(
      'Effortlessly connect with top doctors. Review, schedule, and explore your healthcare options.',
      name: 'welcomeDescription2',
      desc: '',
      args: [],
    );
  }

  /// `Nearby Hospitals`
  String get welcome3 {
    return Intl.message(
      'Nearby Hospitals',
      name: 'welcome3',
      desc: '',
      args: [],
    );
  }

  /// `Discover, schedule, rate: nearby hospitals at your fingertips`
  String get welcomeDescription3 {
    return Intl.message(
      'Discover, schedule, rate: nearby hospitals at your fingertips',
      name: 'welcomeDescription3',
      desc: '',
      args: [],
    );
  }

  /// `Meet HakimBot`
  String get welcome4 {
    return Intl.message(
      'Meet HakimBot',
      name: 'welcome4',
      desc: '',
      args: [],
    );
  }

  /// `HakimBot: Your 24/7 health assistant for instant medical support`
  String get welcomeDescription4 {
    return Intl.message(
      'HakimBot: Your 24/7 health assistant for instant medical support',
      name: 'welcomeDescription4',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Or login with`
  String get orLoginWith {
    return Intl.message(
      'Or login with',
      name: 'orLoginWith',
      desc: '',
      args: [],
    );
  }

  /// `Don''t have an account?`
  String get dontHaveAccount {
    return Intl.message(
      'Don\'\'t have an account?',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get firstName {
    return Intl.message(
      'First Name',
      name: 'firstName',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get lastName {
    return Intl.message(
      'Last Name',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Or sign up with`
  String get orSignUpWith {
    return Intl.message(
      'Or sign up with',
      name: 'orSignUpWith',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Doctors`
  String get doctors {
    return Intl.message(
      'Doctors',
      name: 'doctors',
      desc: '',
      args: [],
    );
  }

  /// `Hospitals`
  String get hospitals {
    return Intl.message(
      'Hospitals',
      name: 'hospitals',
      desc: '',
      args: [],
    );
  }

  /// `HakimBot`
  String get hakimBot {
    return Intl.message(
      'HakimBot',
      name: 'hakimBot',
      desc: '',
      args: [],
    );
  }

  /// `Favorites`
  String get favorites {
    return Intl.message(
      'Favorites',
      name: 'favorites',
      desc: '',
      args: [],
    );
  }

  /// `Search Doctors`
  String get searchDoctors {
    return Intl.message(
      'Search Doctors',
      name: 'searchDoctors',
      desc: '',
      args: [],
    );
  }

  /// `See All`
  String get seeAll {
    return Intl.message(
      'See All',
      name: 'seeAll',
      desc: '',
      args: [],
    );
  }

  /// `Specialities`
  String get specialities {
    return Intl.message(
      'Specialities',
      name: 'specialities',
      desc: '',
      args: [],
    );
  }

  /// `Search Hospitals`
  String get searchHospitals {
    return Intl.message(
      'Search Hospitals',
      name: 'searchHospitals',
      desc: '',
      args: [],
    );
  }

  /// `Services`
  String get services {
    return Intl.message(
      'Services',
      name: 'services',
      desc: '',
      args: [],
    );
  }

  /// `Filter Result`
  String get filterResult {
    return Intl.message(
      'Filter Result',
      name: 'filterResult',
      desc: '',
      args: [],
    );
  }

  /// `Remove Filter`
  String get removeFilter {
    return Intl.message(
      'Remove Filter',
      name: 'removeFilter',
      desc: '',
      args: [],
    );
  }

  /// `List of Hospitals`
  String get listOfHospital {
    return Intl.message(
      'List of Hospitals',
      name: 'listOfHospital',
      desc: '',
      args: [],
    );
  }

  /// `No search history`
  String get noSearchHistory {
    return Intl.message(
      'No search history',
      name: 'noSearchHistory',
      desc: '',
      args: [],
    );
  }

  /// `No hospital found`
  String get noHospitalFound {
    return Intl.message(
      'No hospital found',
      name: 'noHospitalFound',
      desc: '',
      args: [],
    );
  }

  /// `No doctor found`
  String get noDoctorFound {
    return Intl.message(
      'No doctor found',
      name: 'noDoctorFound',
      desc: '',
      args: [],
    );
  }

  /// `Search Result`
  String get searchResult {
    return Intl.message(
      'Search Result',
      name: 'searchResult',
      desc: '',
      args: [],
    );
  }

  /// `Search History`
  String get searchHistory {
    return Intl.message(
      'Search History',
      name: 'searchHistory',
      desc: '',
      args: [],
    );
  }

  /// `Profile Setting`
  String get profileSettings {
    return Intl.message(
      'Profile Setting',
      name: 'profileSettings',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get editProfile {
    return Intl.message(
      'Edit Profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get changePassword {
    return Intl.message(
      'Change Password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Change Language`
  String get changeLanguage {
    return Intl.message(
      'Change Language',
      name: 'changeLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Preferences`
  String get preferences {
    return Intl.message(
      'Preferences',
      name: 'preferences',
      desc: '',
      args: [],
    );
  }

  /// `General`
  String get general {
    return Intl.message(
      'General',
      name: 'general',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get update {
    return Intl.message(
      'Update',
      name: 'update',
      desc: '',
      args: [],
    );
  }

  /// `Old Password`
  String get oldPassword {
    return Intl.message(
      'Old Password',
      name: 'oldPassword',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPassword {
    return Intl.message(
      'New Password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Amharic`
  String get amharic {
    return Intl.message(
      'Amharic',
      name: 'amharic',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'am'),
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
