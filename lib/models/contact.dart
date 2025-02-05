class Contact {
  final int id;
  final String name;
  final String? surname;
  final String? phone;
  final String? email;
  final DateTime? birthDate;

  Contact({
    required this.id,
    required this.name,
    this.surname,
    this.phone,
    this.email,
    this.birthDate,
  });

  bool get isBirthday {
    if (birthDate == null) return false;
    final now = DateTime.now();
    return now.month == birthDate!.month && now.day == birthDate!.day;
  }
}
