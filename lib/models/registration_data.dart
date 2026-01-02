class RegistrationData {
  final String name;
  final String email;
  final DateTime birthDate;
  final String eventType;
  final String seatPreference;
  final bool acceptedTerms;

  const RegistrationData({
    required this.name,
    required this.email,
    required this.birthDate,
    required this.eventType,
    required this.seatPreference,
    required this.acceptedTerms,
  });
}
