class PregnancyStatusModel {
  PregnancyStatusModel({
    required this.success,
    required this.data,
    required this.message,
    required this.error,
  });

  late final String? success;
  late final List<Data>? data;
  late final String? message;
  late final String? error;

  PregnancyStatusModel.fromJson(Map<String?, dynamic> json) {
    success = json['success'];
    data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
    message = json['message'];
    error = json['error'];
  }

  Map<String?, dynamic> toJson() {
    final _data = <String?, dynamic>{};
    _data['success'] = success;
    _data['data'] = data?.map((e) => e.toJson()).toList();
    _data['message'] = message;
    _data['error'] = error;
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.type,
    required this.name,
    required this.parent,
    required this.icon,
  });

  late final String? id;
  late final String? type;
  late final String? name;
  late final String? parent;
  late final String? icon;

  Data.fromJson(Map<String?, dynamic> json) {
    id = json['id'];
    type = json['type'];
    name = json['name'];
    parent = json['parent'].toString();
    icon = json['icon'].toString();
  }

  Map<String?, dynamic> toJson() {
    final _data = <String?, dynamic>{};
    _data['id'] = id;
    _data['type'] = type;
    _data['name'] = name;
    _data['parent'] = parent;
    _data['icon'] = icon;
    return _data;
  }
}
