enum Gender { male, female }

double calculateBMR({
  required Gender gender,
  required double weightKg,
  required double heightCm,
  required int age,
}) {
  if (weightKg <= 0 || heightCm <= 0 || age <= 0) {
    throw ArgumentError('All parameters must be greater than zero.');
  }

  switch (gender) {
    case Gender.male:
      return 88.36 + (13.4 * weightKg) + (4.8 * heightCm) - (5.7 * age);
    case Gender.female:
      return 447.6 + (9.2 * weightKg) + (3.1 * heightCm) - (4.3 * age);
  }
}
