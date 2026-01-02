import 'package:flutter/material.dart';
import 'package:isaacperezmascaro_rodrigobrizramos_p3/l10n/gen/app_localizations.dart';
import 'package:intl/intl.dart';
import '../models/registration_data.dart';
import 'login_view.dart';

class ConfirmationView extends StatelessWidget {
  final RegistrationData data;

  const ConfirmationView({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final dateText = DateFormat.yMMMd(localizations.localeName).format(data.birthDate);

    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        title: Text(localizations.confirmationTitle),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth > 700;
          final content = _buildContent(context, localizations, dateText, isWide);
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: content,
                );
        },
      ),
    );
  }

        Widget _buildContent(BuildContext context, AppLocalizations localizations, String dateText, bool isWide) {
    final details = Card(
      color: Colors.grey[900],
      margin: const EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              localizations.confirmationSubtitle,
              style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _infoRow(Icons.person, data.name),
            _infoRow(Icons.email, data.email),
            _infoRow(Icons.cake, dateText),
            _infoRow(Icons.event, _mapEventType(localizations)),
            _infoRow(Icons.chair, _mapSeat(localizations)),
            _infoRow(Icons.verified, data.acceptedTerms ? 'OK' : ''),
          ],
        ),
      ),
    );

    final profile = ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(
        'assets/images/profile_placeholder.png',
        width: isWide ? 240 : 180,
        height: isWide ? 240 : 180,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => Container(
          width: isWide ? 240 : 180,
          height: isWide ? 240 : 180,
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Center(
            child: Icon(Icons.account_circle, color: Colors.white70, size: 72),
          ),
        ),
      ),
    );

    final backButton = Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: ElevatedButton.icon(
        icon: const Icon(Icons.home),
        label: Text(localizations.backToHome),
        onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const LoginView()),
            (route) => false,
          );
        },
      ),
    );

    if (isWide) {
      return Column(
        key: const ValueKey('wide'),
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: details),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: profile,
              ),
            ],
          ),
          backButton,
        ],
      );
    }

    return SingleChildScrollView(
      key: const ValueKey('narrow'),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: profile),
          details,
          Center(child: backButton),
        ],
      ),
    );
  }

  Widget _infoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.greenAccent, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(color: Colors.white70, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  String _mapEventType(AppLocalizations l10n) {
    switch (data.eventType) {
      case 'premiere':
        return l10n.eventTypePremiere;
      case 'concert':
        return l10n.eventTypeConcert;
      case 'marathon':
        return l10n.eventTypeMarathon;
      default:
        return data.eventType;
    }
  }

  String _mapSeat(AppLocalizations l10n) {
    switch (data.seatPreference) {
      case 'A':
        return l10n.seatA;
      case 'B':
        return l10n.seatB;
      case 'C':
        return l10n.seatC;
      default:
        return data.seatPreference;
    }
  }
}
