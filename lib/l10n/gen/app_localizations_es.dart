// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'BRIMAS +';

  @override
  String get registerTitle => 'Crear cuenta BRIMAS';

  @override
  String get nameLabel => 'Nombre completo';

  @override
  String get nameHint => 'Introduce tu nombre';

  @override
  String get emailLabel => 'Correo electrónico';

  @override
  String get emailHint => 'nombre@correo.com';

  @override
  String get birthDateLabel => 'Fecha de nacimiento';

  @override
  String get selectBirthDate => 'Selecciona tu fecha de nacimiento';

  @override
  String get eventTypeLabel => 'Tipo de plan';

  @override
  String get selectEventType => 'Selecciona plan';

  @override
  String get eventTypePremiere => 'Plan Básico';

  @override
  String get eventTypeConcert => 'Plan Estándar';

  @override
  String get eventTypeMarathon => 'Plan Premium';

  @override
  String get seatPreferenceLabel => 'Género preferido';

  @override
  String get seatA => 'Drama';

  @override
  String get seatB => 'Acción';

  @override
  String get seatC => 'Amor';

  @override
  String get seatD => 'Otro';

  @override
  String get termsLabel => 'Acepto términos y privacidad';

  @override
  String get submitButton => 'Crear cuenta';

  @override
  String get validationRequired => 'Campo obligatorio';

  @override
  String get validationEmail => 'Correo no válido';

  @override
  String get validationBirthDate => 'Selecciona tu fecha de nacimiento';

  @override
  String get validationEventType => 'Selecciona un tipo';

  @override
  String get validationSeat => 'Selecciona una preferencia';

  @override
  String get validationTerms => 'Debes aceptar los términos';

  @override
  String get confirmDialogTitle => 'Confirmar alta';

  @override
  String get confirmDialogContent =>
      '¿Quieres crear tu cuenta con estos datos?';

  @override
  String get confirmDialogAccept => 'Confirmar';

  @override
  String get confirmDialogCancel => 'Cancelar';

  @override
  String get snackBarSaved => 'Datos validados. Listos para crear tu cuenta.';

  @override
  String get backToHome => 'Volver al inicio';

  @override
  String get confirmationTitle => 'Cuenta creada';

  @override
  String get confirmationSubtitle => 'Estos son tus datos:';

  @override
  String get languageLabel => 'Idioma';

  @override
  String get mainRegisterButton => 'Crear cuenta';

  @override
  String get mainMoviesButton => 'Ver películas';

  @override
  String get mainWelcome => 'Bienvenido espectador';

  @override
  String get loginTabSignIn => 'Iniciar sesión';

  @override
  String get loginUsernameLabel => 'Usuario';

  @override
  String get loginUsernameHint => 'Introduce tu usuario';

  @override
  String get loginPasswordLabel => 'Contraseña';

  @override
  String get loginPasswordHint => 'Introduce tu contraseña';

  @override
  String get loginButton => 'Entrar';
}
