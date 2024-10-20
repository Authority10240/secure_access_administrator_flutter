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

class AppLocalizations {
  AppLocalizations();

  static AppLocalizations? _current;

  static AppLocalizations get current {
    assert(_current != null,
        'No instance of AppLocalizations was loaded. Try to initialize the AppLocalizations delegate before accessing AppLocalizations.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<AppLocalizations> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = AppLocalizations();
      AppLocalizations._current = instance;

      return instance;
    });
  }

  static AppLocalizations of(BuildContext context) {
    final instance = AppLocalizations.maybeOf(context);
    assert(instance != null,
        'No instance of AppLocalizations present in the widget tree. Did you add AppLocalizations.delegate in localizationsDelegates?');
    return instance!;
  }

  static AppLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  /// `Authenticate using biometrics `
  String get authenticateUsingBiometrics {
    return Intl.message(
      'Authenticate using biometrics ',
      name: 'authenticateUsingBiometrics',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to `
  String get welcomeTo {
    return Intl.message(
      'Welcome to ',
      name: 'welcomeTo',
      desc: '',
      args: [],
    );
  }

  /// `Secure Access Administrator `
  String get appName {
    return Intl.message(
      'Secure Access Administrator ',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Sign In `
  String get signIn {
    return Intl.message(
      'Sign In ',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up `
  String get signUp {
    return Intl.message(
      'Sign Up ',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Username `
  String get username {
    return Intl.message(
      'Username ',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Email Address * `
  String get emailAddress {
    return Intl.message(
      'Email Address * ',
      name: 'emailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Password `
  String get password {
    return Intl.message(
      'Password ',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password `
  String get forgotPassword {
    return Intl.message(
      'Forgot Password ',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account? `
  String get dontHaveAnAccount {
    return Intl.message(
      'Don\'t have an account? ',
      name: 'dontHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password? `
  String get forgotPasswordQ {
    return Intl.message(
      'Forgot Password? ',
      name: 'forgotPasswordQ',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password `
  String get confirmPassword {
    return Intl.message(
      'Confirm Password ',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Have an account? `
  String get haveAnAccount {
    return Intl.message(
      'Have an account? ',
      name: 'haveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Conditions `
  String get termsAndConditions {
    return Intl.message(
      'Terms & Conditions ',
      name: 'termsAndConditions',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'continue.' key

  /// `Submit `
  String get submit {
    return Intl.message(
      'Submit ',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Forgot your Password? `
  String get forgotYourPassword {
    return Intl.message(
      'Forgot your Password? ',
      name: 'forgotYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Reset Your Password `
  String get resetYourPassword {
    return Intl.message(
      'Reset Your Password ',
      name: 'resetYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter a new password below to change your password `
  String get enterANewPasswordBelowToChangeYourPassword {
    return Intl.message(
      'Enter a new password below to change your password ',
      name: 'enterANewPasswordBelowToChangeYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Reset `
  String get reset {
    return Intl.message(
      'Reset ',
      name: 'reset',
      desc: '',
      args: [],
    );
  }

  /// `New Password `
  String get newPassword {
    return Intl.message(
      'New Password ',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `View All`
  String get viewAll {
    return Intl.message(
      'View All',
      name: 'viewAll',
      desc: '',
      args: [],
    );
  }

  /// `Please enter an email address`
  String get pleaseEnterUserName {
    return Intl.message(
      'Please enter an email address',
      name: 'pleaseEnterUserName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a password`
  String get pleaseEnterAPassword {
    return Intl.message(
      'Please enter a password',
      name: 'pleaseEnterAPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please re-enter a password`
  String get pleaseReenterAPassword {
    return Intl.message(
      'Please re-enter a password',
      name: 'pleaseReenterAPassword',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get passwordsDoNotMatch {
    return Intl.message(
      'Passwords do not match',
      name: 'passwordsDoNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get wcontinue {
    return Intl.message(
      'Continue',
      name: 'wcontinue',
      desc: '',
      args: [],
    );
  }

  /// `Name *`
  String get name {
    return Intl.message(
      'Name *',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Surname *`
  String get surname {
    return Intl.message(
      'Surname *',
      name: 'surname',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: [],
    );
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

  /// `Personal details`
  String get personalDetails {
    return Intl.message(
      'Personal details',
      name: 'personalDetails',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get logout {
    return Intl.message(
      'Log out',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Enable biometrics?`
  String get enableBiometrics {
    return Intl.message(
      'Enable biometrics?',
      name: 'enableBiometrics',
      desc: '',
      args: [],
    );
  }

  /// `Biometrics`
  String get biometrics {
    return Intl.message(
      'Biometrics',
      name: 'biometrics',
      desc: '',
      args: [],
    );
  }

  /// `Enable/Disable Biometrics`
  String get enableDisableBiometrics {
    return Intl.message(
      'Enable/Disable Biometrics',
      name: 'enableDisableBiometrics',
      desc: '',
      args: [],
    );
  }

  /// `Sign in using phone number`
  String get signInUsingPhoneNumber {
    return Intl.message(
      'Sign in using phone number',
      name: 'signInUsingPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Sign in using email address`
  String get signinUsingEmailAddress {
    return Intl.message(
      'Sign in using email address',
      name: 'signinUsingEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `and`
  String get and {
    return Intl.message(
      'and',
      name: 'and',
      desc: '',
      args: [],
    );
  }

  /// `Sign in using`
  String get signInUsing {
    return Intl.message(
      'Sign in using',
      name: 'signInUsing',
      desc: '',
      args: [],
    );
  }

  /// `Create your secure account`
  String get createYourSecureAccount {
    return Intl.message(
      'Create your secure account',
      name: 'createYourSecureAccount',
      desc: '',
      args: [],
    );
  }

  /// `Please enter an email address`
  String get pleaseEnterEmailAddress {
    return Intl.message(
      'Please enter an email address',
      name: 'pleaseEnterEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email address`
  String get pleaseEnterAValidEmailAddress {
    return Intl.message(
      'Please enter a valid email address',
      name: 'pleaseEnterAValidEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Success!`
  String get success {
    return Intl.message(
      'Success!',
      name: 'success',
      desc: '',
      args: [],
    );
  }

  /// `Profile creation successful, Please sign in to continue`
  String get profileCreationSuccessful {
    return Intl.message(
      'Profile creation successful, Please sign in to continue',
      name: 'profileCreationSuccessful',
      desc: '',
      args: [],
    );
  }

  /// `Password too short`
  String get passwordTooShort {
    return Intl.message(
      'Password too short',
      name: 'passwordTooShort',
      desc: '',
      args: [],
    );
  }

  /// `Choose a password with at least 8 characters\n`
  String get passwordMustHaveAtLeast8characters {
    return Intl.message(
      'Choose a password with at least 8 characters\n',
      name: 'passwordMustHaveAtLeast8characters',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one lowercase letter\n`
  String get passwordMustContainOneLowercaseCharacter {
    return Intl.message(
      'Password must contain at least one lowercase letter\n',
      name: 'passwordMustContainOneLowercaseCharacter',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one uppercase letter\n`
  String get passwordMustContainAtLeastOneUppercaseCharacter {
    return Intl.message(
      'Password must contain at least one uppercase letter\n',
      name: 'passwordMustContainAtLeastOneUppercaseCharacter',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one digit\n`
  String get passwordMustContainAtLeastOneDigit {
    return Intl.message(
      'Password must contain at least one digit\n',
      name: 'passwordMustContainAtLeastOneDigit',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one symbol\n`
  String get passwordMustContainAtLeastOneSymbol {
    return Intl.message(
      'Password must contain at least one symbol\n',
      name: 'passwordMustContainAtLeastOneSymbol',
      desc: '',
      args: [],
    );
  }

  /// `Complex name`
  String get complexName {
    return Intl.message(
      'Complex name',
      name: 'complexName',
      desc: '',
      args: [],
    );
  }

  /// `Who is visiting today?`
  String get whoIsVisitingToday {
    return Intl.message(
      'Who is visiting today?',
      name: 'whoIsVisitingToday',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get welcome {
    return Intl.message(
      'Welcome',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Truck`
  String get truck {
    return Intl.message(
      'Truck',
      name: 'truck',
      desc: '',
      args: [],
    );
  }

  /// `Car`
  String get car {
    return Intl.message(
      'Car',
      name: 'car',
      desc: '',
      args: [],
    );
  }

  /// `Bike`
  String get bike {
    return Intl.message(
      'Bike',
      name: 'bike',
      desc: '',
      args: [],
    );
  }

  /// `Person`
  String get person {
    return Intl.message(
      'Person',
      name: 'person',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle`
  String get vehicle {
    return Intl.message(
      'Vehicle',
      name: 'vehicle',
      desc: '',
      args: [],
    );
  }

  /// `Passport`
  String get passport {
    return Intl.message(
      'Passport',
      name: 'passport',
      desc: '',
      args: [],
    );
  }

  /// `License`
  String get license {
    return Intl.message(
      'License',
      name: 'license',
      desc: '',
      args: [],
    );
  }

  /// `ID *`
  String get id {
    return Intl.message(
      'ID *',
      name: 'id',
      desc: '',
      args: [],
    );
  }

  /// `Manual`
  String get manual {
    return Intl.message(
      'Manual',
      name: 'manual',
      desc: '',
      args: [],
    );
  }

  /// `Bus`
  String get bus {
    return Intl.message(
      'Bus',
      name: 'bus',
      desc: '',
      args: [],
    );
  }

  /// `What type of vehicle are they driving?`
  String get whatTypeOfVehicleAreTheyDriving {
    return Intl.message(
      'What type of vehicle are they driving?',
      name: 'whatTypeOfVehicleAreTheyDriving',
      desc: '',
      args: [],
    );
  }

  /// `What kind of identification do they have?`
  String get whatKindOfIdentificationDoTheyHave {
    return Intl.message(
      'What kind of identification do they have?',
      name: 'whatKindOfIdentificationDoTheyHave',
      desc: '',
      args: [],
    );
  }

  /// `Car details:`
  String get carDetails {
    return Intl.message(
      'Car details:',
      name: 'carDetails',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `VIN`
  String get vin {
    return Intl.message(
      'VIN',
      name: 'vin',
      desc: '',
      args: [],
    );
  }

  /// `Engine Number`
  String get engineNumber {
    return Intl.message(
      'Engine Number',
      name: 'engineNumber',
      desc: '',
      args: [],
    );
  }

  /// `Expiration Year`
  String get expirationYear {
    return Intl.message(
      'Expiration Year',
      name: 'expirationYear',
      desc: '',
      args: [],
    );
  }

  /// `Registration Number`
  String get registrationNumber {
    return Intl.message(
      'Registration Number',
      name: 'registrationNumber',
      desc: '',
      args: [],
    );
  }

  /// `Capture vehicle details`
  String get captureVehicleDetails {
    return Intl.message(
      'Capture vehicle details',
      name: 'captureVehicleDetails',
      desc: '',
      args: [],
    );
  }

  /// `Visitor is driving a`
  String get visitorIsDrivingA {
    return Intl.message(
      'Visitor is driving a',
      name: 'visitorIsDrivingA',
      desc: '',
      args: [],
    );
  }

  /// `Make`
  String get make {
    return Intl.message(
      'Make',
      name: 'make',
      desc: '',
      args: [],
    );
  }

  /// `Model`
  String get model {
    return Intl.message(
      'Model',
      name: 'model',
      desc: '',
      args: [],
    );
  }

  /// `Color`
  String get color {
    return Intl.message(
      'Color',
      name: 'color',
      desc: '',
      args: [],
    );
  }

  /// `No Scan`
  String get noScan {
    return Intl.message(
      'No Scan',
      name: 'noScan',
      desc: '',
      args: [],
    );
  }

  /// `No License disk scanned, Try entering vehicle details manually `
  String get noLicenseDiskScannedTryEnteringVehicleDetailsManually {
    return Intl.message(
      'No License disk scanned, Try entering vehicle details manually ',
      name: 'noLicenseDiskScannedTryEnteringVehicleDetailsManually',
      desc: '',
      args: [],
    );
  }

  /// `Phone number *`
  String get phoneNumber {
    return Intl.message(
      'Phone number *',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Capture visitor's ID details`
  String get captureVisitorsIDDetails {
    return Intl.message(
      'Capture visitor\'s ID details',
      name: 'captureVisitorsIDDetails',
      desc: '',
      args: [],
    );
  }

  /// `Capture visitor's passport details`
  String get captureVisitorsPassportDetails {
    return Intl.message(
      'Capture visitor\'s passport details',
      name: 'captureVisitorsPassportDetails',
      desc: '',
      args: [],
    );
  }

  /// `Capture visitor's license details`
  String get captureVisitorsLicenseDetails {
    return Intl.message(
      'Capture visitor\'s license details',
      name: 'captureVisitorsLicenseDetails',
      desc: '',
      args: [],
    );
  }

  /// `Scan Error`
  String get scanError {
    return Intl.message(
      'Scan Error',
      name: 'scanError',
      desc: '',
      args: [],
    );
  }

  /// `Scan again`
  String get scanAgain {
    return Intl.message(
      'Scan again',
      name: 'scanAgain',
      desc: '',
      args: [],
    );
  }

  /// `Invalid license disk, please scan License disk presented on car wind shield`
  String get invalidLicenseDiskPleaseScanLicenseDiskPresentedOnCarWindShield {
    return Intl.message(
      'Invalid license disk, please scan License disk presented on car wind shield',
      name: 'invalidLicenseDiskPleaseScanLicenseDiskPresentedOnCarWindShield',
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

  /// `Middle Name`
  String get middleName {
    return Intl.message(
      'Middle Name',
      name: 'middleName',
      desc: '',
      args: [],
    );
  }

  /// `last Name`
  String get lastName {
    return Intl.message(
      'last Name',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// `Personnel Details`
  String get personnelDetails {
    return Intl.message(
      'Personnel Details',
      name: 'personnelDetails',
      desc: '',
      args: [],
    );
  }

  /// `Invalid ID code, Please scan a valid Identification card or document.`
  String get invalidIdCode {
    return Intl.message(
      'Invalid ID code, Please scan a valid Identification card or document.',
      name: 'invalidIdCode',
      desc: '',
      args: [],
    );
  }

  /// `Invalid passport code, Please scan a valid passport document`
  String get invalidPassport {
    return Intl.message(
      'Invalid passport code, Please scan a valid passport document',
      name: 'invalidPassport',
      desc: '',
      args: [],
    );
  }

  /// `No identification document scanned`
  String get noIdentificationDocumentScanned {
    return Intl.message(
      'No identification document scanned',
      name: 'noIdentificationDocumentScanned',
      desc: '',
      args: [],
    );
  }

  /// `Walk in`
  String get walkIn {
    return Intl.message(
      'Walk in',
      name: 'walkIn',
      desc: '',
      args: [],
    );
  }

  /// `Mobile number`
  String get mobileNumber {
    return Intl.message(
      'Mobile number',
      name: 'mobileNumber',
      desc: '',
      args: [],
    );
  }

  /// `Visitation logged successfully`
  String get visitationLoggedSuccessfully {
    return Intl.message(
      'Visitation logged successfully',
      name: 'visitationLoggedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Unit visited`
  String get unitVisited {
    return Intl.message(
      'Unit visited',
      name: 'unitVisited',
      desc: '',
      args: [],
    );
  }

  /// `Who has been here today?`
  String get whoHasBeenHereToday {
    return Intl.message(
      'Who has been here today?',
      name: 'whoHasBeenHereToday',
      desc: '',
      args: [],
    );
  }

  /// `Test me`
  String get testMe {
    return Intl.message(
      'Test me',
      name: 'testMe',
      desc: '',
      args: [],
    );
  }

  /// `Was driving a`
  String get wasDrivingA {
    return Intl.message(
      'Was driving a',
      name: 'wasDrivingA',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Drive in`
  String get drivein {
    return Intl.message(
      'Drive in',
      name: 'drivein',
      desc: '',
      args: [],
    );
  }

  /// `Time:`
  String get time {
    return Intl.message(
      'Time:',
      name: 'time',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get date {
    return Intl.message(
      'Date',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `Today`
  String get today {
    return Intl.message(
      'Today',
      name: 'today',
      desc: '',
      args: [],
    );
  }

  /// `Yesterday`
  String get yesterday {
    return Intl.message(
      'Yesterday',
      name: 'yesterday',
      desc: '',
      args: [],
    );
  }

  /// `Visitation(s)`
  String get visitations {
    return Intl.message(
      'Visitation(s)',
      name: 'visitations',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get more {
    return Intl.message(
      'More',
      name: 'more',
      desc: '',
      args: [],
    );
  }

  /// `Walked in`
  String get walkedIn {
    return Intl.message(
      'Walked in',
      name: 'walkedIn',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);
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
