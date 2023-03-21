class RegisterModel {
  RegisterModel({
    required this.success,
    required this.data,
    required this.message,
    required this.error,
  });
  late final String? success;
  late final Data? data;
  late final String? message;
  late final String? error;

  RegisterModel.fromJson(Map<String, dynamic> json){
    success = json['success'];
    data = Data.fromJson(json['data']);
    message = null;
    error = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['data'] = data?.toJson();
    _data['message'] = message;
    _data['error'] = error;
    return _data;
  }
}

class Data {
  Data({
    required this.id,
  });
  late final String? id;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    return _data;
  }
}