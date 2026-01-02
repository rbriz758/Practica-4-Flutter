import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:isaacperezmascaro_rodrigobrizramos_p3/l10n/gen/app_localizations.dart';

import '../main.dart';
import '../models/registration_data.dart';
import 'confirmation_view.dart';

class RegistrationView extends StatelessWidget {
  final void Function(Locale locale) onLocaleChanged;

  const RegistrationView({Key? key, required this.onLocaleChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        title: Text(localizations.registerTitle),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: RegistrationForm(onLocaleChanged: onLocaleChanged),
      ),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  final void Function(Locale locale) onLocaleChanged;

  const RegistrationForm({Key? key, required this.onLocaleChanged}) : super(key: key);

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _dateController = TextEditingController();

  String? _name;
  String? _email;
  DateTime? _birthDate;
  String? _eventType;
  String? _seatPreference;
  bool _acceptedTerms = false;

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final localizations = AppLocalizations.of(context)!;
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(now.year - 18, now.month, now.day),
      firstDate: DateTime(1900),
      lastDate: now,
    );
    if (picked != null) {
      setState(() {
        _birthDate = picked;
        _dateController.text = DateFormat.yMMMd(localizations.localeName).format(picked);
      });
    }
  }

  Future<bool?> _showConfirmDialog() {
    final localizations = AppLocalizations.of(context)!;
    return showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(localizations.confirmDialogTitle),
        content: Text(localizations.confirmDialogContent),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(localizations.confirmDialogCancel),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(localizations.confirmDialogAccept),
          ),
        ],
      ),
    );
  }

  void _changeLanguage(Locale locale) {
    widget.onLocaleChanged(locale);
    MyApp.of(context)?.setLocale(locale);
  }

  void _submit() async {
    final localizations = AppLocalizations.of(context)!;
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) return;

    _formKey.currentState!.save();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(localizations.snackBarSaved)),
    );

    final confirmed = await _showConfirmDialog();
    if (confirmed != true) return;

    final data = RegistrationData(
      name: _name ?? '',
      email: _email ?? '',
      birthDate: _birthDate!,
      eventType: _eventType!,
      seatPreference: _seatPreference!,
      acceptedTerms: _acceptedTerms,
    );

    if (!mounted) return;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => ConfirmationView(data: data)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final languages = <Locale>[
      const Locale('es'),
      const Locale('en'),
      const Locale('fr'),
    ];

    final currentLocale = languages.firstWhere(
      (l) => l.languageCode == Localizations.localeOf(context).languageCode,
      orElse: () => languages.first,
    );

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                localizations.registerTitle,
                style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton<Locale>(
                  dropdownColor: Colors.black,
                  icon: const Icon(Icons.language, color: Colors.white),
                  value: currentLocale,
                  items: languages
                      .map(
                        (l) => DropdownMenuItem<Locale>(
                          value: l,
                          child: Text(
                            l.languageCode.toUpperCase(),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (locale) {
                    if (locale != null) {
                      _changeLanguage(locale);
                    }
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 80,
            width: double.infinity,
            child: CustomPaint(painter: HeaderAccentPainter()),
          ),
          TextFormField(
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: localizations.nameLabel,
              hintText: localizations.nameHint,
              prefixIcon: const Icon(Icons.person),
              labelStyle: const TextStyle(color: Colors.white),
              hintStyle: const TextStyle(color: Colors.white70),
            ),
            keyboardType: TextInputType.name,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return localizations.validationRequired;
              }
              return null;
            },
            onSaved: (value) => _name = value?.trim(),
          ),
          const SizedBox(height: 16),
          TextFormField(
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: localizations.emailLabel,
              hintText: localizations.emailHint,
              prefixIcon: const Icon(Icons.email),
              labelStyle: const TextStyle(color: Colors.white),
              hintStyle: const TextStyle(color: Colors.white70),
            ),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return localizations.validationRequired;
              }
              final emailRegex = RegExp(r'^.+@.+\..+$');
              if (!emailRegex.hasMatch(value)) {
                return localizations.validationEmail;
              }
              return null;
            },
            onSaved: (value) => _email = value?.trim(),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _dateController,
            readOnly: true,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: localizations.birthDateLabel,
              hintText: localizations.selectBirthDate,
              prefixIcon: const Icon(Icons.cake),
              labelStyle: const TextStyle(color: Colors.white),
              hintStyle: const TextStyle(color: Colors.white70),
            ),
            onTap: _pickDate,
            validator: (_) {
              if (_birthDate == null) {
                return localizations.validationBirthDate;
              }
              return null;
            },
            onSaved: (value) {
              _dateController.text = value ?? _dateController.text;
            },
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: localizations.eventTypeLabel,
              prefixIcon: const Icon(Icons.event),
            ),
            value: _eventType,
            items: [
              DropdownMenuItem(
                value: 'premiere',
                child: Text(
                  localizations.eventTypePremiere,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              DropdownMenuItem(
                value: 'concert',
                child: Text(
                  localizations.eventTypeConcert,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              DropdownMenuItem(
                value: 'marathon',
                child: Text(
                  localizations.eventTypeMarathon,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ],
            onChanged: (value) => setState(() => _eventType = value),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return localizations.validationEventType;
              }
              return null;
            },
            onSaved: (value) => _eventType = value,
          ),
          const SizedBox(height: 16),
          FormField<String>(
            validator: (_) {
              if (_seatPreference == null) {
                return localizations.validationSeat;
              }
              return null;
            },
            onSaved: (_) {},
            builder: (fieldState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    localizations.seatPreferenceLabel,
                    style: const TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                  RadioListTile<String>(
                    title: Text(localizations.seatA, style: const TextStyle(color: Colors.white)),
                    value: 'A',
                    groupValue: _seatPreference,
                    onChanged: (value) => setState(() => _seatPreference = value),
                  ),
                  RadioListTile<String>(
                    title: Text(localizations.seatB, style: const TextStyle(color: Colors.white)),
                    value: 'B',
                    groupValue: _seatPreference,
                    onChanged: (value) => setState(() => _seatPreference = value),
                  ),
                  RadioListTile<String>(
                    title: Text(localizations.seatC, style: const TextStyle(color: Colors.white)),
                    value: 'C',
                    groupValue: _seatPreference,
                    onChanged: (value) => setState(() => _seatPreference = value),
                  ),
                  RadioListTile<String>(
                    title: Text(localizations.seatD, style: const TextStyle(color: Colors.white)),
                    value: 'D',
                    groupValue: _seatPreference,
                    onChanged: (value) => setState(() => _seatPreference = value),
                  ),
                  if (fieldState.hasError)
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Text(
                        fieldState.errorText!,
                        style: const TextStyle(color: Colors.redAccent),
                      ),
                    ),
                ],
              );
            },
          ),
          FormField<bool>(
            initialValue: _acceptedTerms,
            validator: (value) {
              if (value != true) {
                return localizations.validationTerms;
              }
              return null;
            },
            onSaved: (value) => _acceptedTerms = value ?? false,
            builder: (fieldState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CheckboxListTile(
                    title: Text(localizations.termsLabel, style: const TextStyle(color: Colors.white)),
                    value: fieldState.value ?? false,
                    onChanged: (value) {
                      setState(() => _acceptedTerms = value ?? false);
                      fieldState.didChange(value ?? false);
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                  if (fieldState.hasError)
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Text(
                        fieldState.errorText!,
                        style: const TextStyle(color: Colors.redAccent),
                      ),
                    ),
                ],
              );
            },
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: _submit,
              icon: const Icon(Icons.send),
              label: Text(localizations.submitButton),
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderAccentPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..shader = const LinearGradient(
        colors: [Color(0xFF1DB954), Color(0xFF0A7CFF)],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final path = Path()
      ..moveTo(0, size.height * 0.6)
      ..quadraticBezierTo(
        size.width * 0.25,
        size.height * 0.3,
        size.width * 0.5,
        size.height * 0.5,
      )
      ..quadraticBezierTo(
        size.width * 0.75,
        size.height * 0.7,
        size.width,
        size.height * 0.4,
      )
      ..lineTo(size.width, 0)
      ..lineTo(0, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
