import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
    Locale('fr'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'BRIMAS +'**
  String get appTitle;

  /// No description provided for @registerTitle.
  ///
  /// In en, this message translates to:
  /// **'Create BRIMAS account'**
  String get registerTitle;

  /// No description provided for @nameLabel.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get nameLabel;

  /// No description provided for @nameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your name'**
  String get nameHint;

  /// No description provided for @emailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get emailLabel;

  /// No description provided for @emailHint.
  ///
  /// In en, this message translates to:
  /// **'name@email.com'**
  String get emailHint;

  /// No description provided for @birthDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Birth date'**
  String get birthDateLabel;

  /// No description provided for @selectBirthDate.
  ///
  /// In en, this message translates to:
  /// **'Select your birth date'**
  String get selectBirthDate;

  /// No description provided for @eventTypeLabel.
  ///
  /// In en, this message translates to:
  /// **'Plan type'**
  String get eventTypeLabel;

  /// No description provided for @selectEventType.
  ///
  /// In en, this message translates to:
  /// **'Select plan'**
  String get selectEventType;

  /// No description provided for @eventTypePremiere.
  ///
  /// In en, this message translates to:
  /// **'Basic plan'**
  String get eventTypePremiere;

  /// No description provided for @eventTypeConcert.
  ///
  /// In en, this message translates to:
  /// **'Standard plan'**
  String get eventTypeConcert;

  /// No description provided for @eventTypeMarathon.
  ///
  /// In en, this message translates to:
  /// **'Premium plan'**
  String get eventTypeMarathon;

  /// No description provided for @seatPreferenceLabel.
  ///
  /// In en, this message translates to:
  /// **'Preferred genre'**
  String get seatPreferenceLabel;

  /// No description provided for @seatA.
  ///
  /// In en, this message translates to:
  /// **'Drama'**
  String get seatA;

  /// No description provided for @seatB.
  ///
  /// In en, this message translates to:
  /// **'Action'**
  String get seatB;

  /// No description provided for @seatC.
  ///
  /// In en, this message translates to:
  /// **'Love'**
  String get seatC;

  /// No description provided for @seatD.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get seatD;

  /// No description provided for @termsLabel.
  ///
  /// In en, this message translates to:
  /// **'I accept terms and privacy'**
  String get termsLabel;

  /// No description provided for @submitButton.
  ///
  /// In en, this message translates to:
  /// **'Create account'**
  String get submitButton;

  /// No description provided for @validationRequired.
  ///
  /// In en, this message translates to:
  /// **'Required field'**
  String get validationRequired;

  /// No description provided for @validationEmail.
  ///
  /// In en, this message translates to:
  /// **'Invalid email'**
  String get validationEmail;

  /// No description provided for @validationBirthDate.
  ///
  /// In en, this message translates to:
  /// **'Select your birth date'**
  String get validationBirthDate;

  /// No description provided for @validationEventType.
  ///
  /// In en, this message translates to:
  /// **'Select a type'**
  String get validationEventType;

  /// No description provided for @validationSeat.
  ///
  /// In en, this message translates to:
  /// **'Select a preference'**
  String get validationSeat;

  /// No description provided for @validationTerms.
  ///
  /// In en, this message translates to:
  /// **'You must accept the terms'**
  String get validationTerms;

  /// No description provided for @confirmDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Confirm account'**
  String get confirmDialogTitle;

  /// No description provided for @confirmDialogContent.
  ///
  /// In en, this message translates to:
  /// **'Create your account with these details?'**
  String get confirmDialogContent;

  /// No description provided for @confirmDialogAccept.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirmDialogAccept;

  /// No description provided for @confirmDialogCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get confirmDialogCancel;

  /// No description provided for @snackBarSaved.
  ///
  /// In en, this message translates to:
  /// **'Data validated. Ready to create your account.'**
  String get snackBarSaved;

  /// No description provided for @backToHome.
  ///
  /// In en, this message translates to:
  /// **'Back to home'**
  String get backToHome;

  /// No description provided for @confirmationTitle.
  ///
  /// In en, this message translates to:
  /// **'Account created'**
  String get confirmationTitle;

  /// No description provided for @confirmationSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Here are your details:'**
  String get confirmationSubtitle;

  /// No description provided for @languageLabel.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get languageLabel;

  /// No description provided for @mainRegisterButton.
  ///
  /// In en, this message translates to:
  /// **'Create account'**
  String get mainRegisterButton;

  /// No description provided for @mainMoviesButton.
  ///
  /// In en, this message translates to:
  /// **'See movies'**
  String get mainMoviesButton;

  /// No description provided for @mainWelcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome viewer'**
  String get mainWelcome;

  /// No description provided for @loginTabSignIn.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get loginTabSignIn;

  /// No description provided for @loginUsernameLabel.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get loginUsernameLabel;

  /// No description provided for @loginUsernameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your username'**
  String get loginUsernameHint;

  /// No description provided for @loginPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get loginPasswordLabel;

  /// No description provided for @loginPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get loginPasswordHint;

  /// No description provided for @loginButton.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get loginButton;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
