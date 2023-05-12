class RegisterStorageModel {
  RegisterStorageModel({
    required this.email,
    required this.password,
    required this.fullName,
    required this.birthDate,
    required this.pregnancyStatus,
    required this.interests,
    required this.childBirthDate,
    required this.estimateDueDate,
    this.avatar,
    this.googleId,
  });

  late final String email;
  late final String password;
  late final String fullName;
  late final String birthDate;
  late final String pregnancyStatus;
  late final List<String> interests;
  late final String childBirthDate;
  late final String estimateDueDate;
  late final String? avatar;
  late final String? googleId;
}
