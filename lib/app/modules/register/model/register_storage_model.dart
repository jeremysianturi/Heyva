class RegisterStorageModel {
  RegisterStorageModel({
    required this.email,
    required this.password,
    required this.fullName,
    required this.birthDate,
    required this.pregnancyStatus,
    required this.interests,
  });
  late final String email;
  late final String password;
  late final String fullName;
  late final String birthDate;
  late final String pregnancyStatus;
  late final List<String> interests;

  RegisterStorageModel.fromJson(Map<String, dynamic> json){
    email = json['email'];
    password = json['password'];
    fullName = json['full_name'];
    birthDate = json['birth_date'];
    pregnancyStatus = json['pregnancy_status'];
    interests = List.castFrom<dynamic, String>(json['interests']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['email'] = email;
    _data['password'] = password;
    _data['full_name'] = fullName;
    _data['birth_date'] = birthDate;
    _data['pregnancy_status'] = pregnancyStatus;
    _data['interests'] = interests;
    return _data;
  }
}