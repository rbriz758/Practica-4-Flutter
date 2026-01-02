// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'BRIMAS +';

  @override
  String get registerTitle => 'Create BRIMAS account';

  @override
  String get nameLabel => 'Full name';

  @override
  String get nameHint => 'Enter your name';

  @override
  String get emailLabel => 'Email';

  @override
  String get emailHint => 'name@email.com';

  @override
  String get birthDateLabel => 'Birth date';

  @override
  String get selectBirthDate => 'Select your birth date';

  @override
  String get eventTypeLabel => 'Plan type';

  @override
  String get selectEventType => 'Select plan';

  @override
  String get eventTypePremiere => 'Basic plan';

  @override
  String get eventTypeConcert => 'Standard plan';

  @override
  String get eventTypeMarathon => 'Premium plan';

  @override
  String get seatPreferenceLabel => 'Preferred genre';

  @override
  String get seatA => 'Drama';

  @override
  String get seatB => 'Action';

  @override
  String get seatC => 'Love';

  @override
  String get seatD => 'Other';

  @override
  String get termsLabel => 'I accept terms and privacy';

  @override
  String get submitButton => 'Create account';

  @override
  String get validationRequired => 'Required field';

  @override
  String get validationEmail => 'Invalid email';

  @override
  String get validationBirthDate => 'Select your birth date';

  @override
  String get validationEventType => 'Select a type';

  @override
  String get validationSeat => 'Select a preference';

  @override
  String get validationTerms => 'You must accept the terms';

  @override
  String get confirmDialogTitle => 'Confirm account';

  @override
  String get confirmDialogContent => 'Create your account with these details?';

  @override
  String get confirmDialogAccept => 'Confirm';

  @override
  String get confirmDialogCancel => 'Cancel';

  @override
  String get snackBarSaved => 'Data validated. Ready to create your account.';

  @override
  String get backToHome => 'Back to home';

  @override
  String get confirmationTitle => 'Account created';

  @override
  String get confirmationSubtitle => 'Here are your details:';

  @override
  String get languageLabel => 'Language';

  @override
  String get mainRegisterButton => 'Create account';

  @override
  String get mainMoviesButton => 'See movies';

  @override
  String get mainWelcome => 'Welcome viewer';

  @override
  String get loginTabSignIn => 'Sign in';

  @override
  String get loginUsernameLabel => 'Username';

  @override
  String get loginUsernameHint => 'Enter your username';

  @override
  String get loginPasswordLabel => 'Password';

  @override
  String get loginPasswordHint => 'Enter your password';

  @override
  String get loginButton => 'Sign in';
}
