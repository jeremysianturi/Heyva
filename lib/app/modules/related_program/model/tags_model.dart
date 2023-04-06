

class TagsModel {
  final String? success;
  final List<Data>? data;
  final dynamic message;
  final dynamic error;

  TagsModel({
    this.success,
    this.data,
    this.message,
    this.error,
  });

  TagsModel.fromJson(Map<String, dynamic> json)
      : success = json['success'] as String?,
        data = (json['data'] as List?)
            ?.map((dynamic e) => Data.fromJson(e as Map<String, dynamic>))
            .toList(),
        message = json['message'],
        error = json['error'];

  Map<String, dynamic> toJson() => {
        'success': success,
        'data': data?.map((e) => e.toJson()).toList(),
        'message': message,
        'error': error
      };
}

class Data {
  final String? id;
  final String? type;
  final String? name;
  final dynamic parent;
  final dynamic icon;
  final dynamic value;
  bool isSelected = false;

  Data({
    this.id,
    this.type,
    this.name,
    this.parent,
    this.icon,
    this.value,
    this.isSelected = false,
  });

  Data.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        type = json['type'] as String?,
        name = json['name'] as String?,
        parent = json['parent'],
        icon = json['icon'],
        value = json['value'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
        'name': name,
        'parent': parent,
        'icon': icon,
        'value': value
      };
}
