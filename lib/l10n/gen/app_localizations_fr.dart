// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'BRIMAS +';

  @override
  String get registerTitle => 'Créer un compte BRIMAS';

  @override
  String get nameLabel => 'Nom complet';

  @override
  String get nameHint => 'Entrez votre nom';

  @override
  String get emailLabel => 'Email';

  @override
  String get emailHint => 'nom@email.com';

  @override
  String get birthDateLabel => 'Date de naissance';

  @override
  String get selectBirthDate => 'Sélectionnez votre date de naissance';

  @override
  String get eventTypeLabel => 'Type de plan';

  @override
  String get selectEventType => 'Sélectionnez un plan';

  @override
  String get eventTypePremiere => 'Plan Basique';

  @override
  String get eventTypeConcert => 'Plan Standard';

  @override
  String get eventTypeMarathon => 'Plan Premium';

  @override
  String get seatPreferenceLabel => 'Genre préféré';

  @override
  String get seatA => 'Drame';

  @override
  String get seatB => 'Action';

  @override
  String get seatC => 'Amour';

  @override
  String get seatD => 'Autre';

  @override
  String get termsLabel => 'J\'accepte les conditions et la confidentialité';

  @override
  String get submitButton => 'Créer le compte';

  @override
  String get validationRequired => 'Champ obligatoire';

  @override
  String get validationEmail => 'Email invalide';

  @override
  String get validationBirthDate => 'Choisissez votre date de naissance';

  @override
  String get validationEventType => 'Choisissez un type';

  @override
  String get validationSeat => 'Choisissez une préférence';

  @override
  String get validationTerms => 'Vous devez accepter les conditions';

  @override
  String get confirmDialogTitle => 'Confirmer le compte';

  @override
  String get confirmDialogContent => 'Créer votre compte avec ces données ?';

  @override
  String get confirmDialogAccept => 'Confirmer';

  @override
  String get confirmDialogCancel => 'Annuler';

  @override
  String get snackBarSaved => 'Données validées. Prêtes à créer votre compte.';

  @override
  String get backToHome => 'Retour à l\'accueil';

  @override
  String get confirmationTitle => 'Compte créé';

  @override
  String get confirmationSubtitle => 'Voici vos informations :';

  @override
  String get languageLabel => 'Langue';

  @override
  String get mainRegisterButton => 'Créer un compte';

  @override
  String get mainMoviesButton => 'Voir les films';

  @override
  String get mainWelcome => 'Bienvenue spectateur';

  @override
  String get loginTabSignIn => 'Se connecter';

  @override
  String get loginUsernameLabel => 'Utilisateur';

  @override
  String get loginUsernameHint => 'Entrez votre utilisateur';

  @override
  String get loginPasswordLabel => 'Mot de passe';

  @override
  String get loginPasswordHint => 'Entrez votre mot de passe';

  @override
  String get loginButton => 'Se connecter';
}
