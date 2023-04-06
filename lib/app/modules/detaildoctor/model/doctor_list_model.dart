class DoctorListModel {
  final String? success;
  final List<Data>? data;
  final dynamic message;
  final dynamic error;
  final Links? links;
  final int? count;

  DoctorListModel({
    this.success,
    this.data,
    this.message,
    this.error,
    this.links,
    this.count,
  });

  DoctorListModel.fromJson(Map<String, dynamic> json)
      : success = json['success'] as String?,
        data = (json['data'] as List?)?.map((dynamic e) => Data.fromJson(e as Map<String,dynamic>)).toList(),
        message = json['message'],
        error = json['error'],
        links = (json['links'] as Map<String,dynamic>?) != null ? Links.fromJson(json['links'] as Map<String,dynamic>) : null,
        count = json['count'] as int?;

  Map<String, dynamic> toJson() => {
    'success' : success,
    'data' : data?.map((e) => e.toJson()).toList(),
    'message' : message,
    'error' : error,
    'links' : links?.toJson(),
    'count' : count
  };
}

class Data {
  final String? id;
  final String? code;
  final dynamic profileCode;
  final String? name;
  final dynamic specialist;
  final String? about;
  final dynamic rate;
  final dynamic domicile;
  final dynamic phoneNumber;
  final List<Tags>? tags;

  Data({
    this.id,
    this.code,
    this.profileCode,
    this.name,
    this.specialist,
    this.about,
    this.rate,
    this.domicile,
    this.phoneNumber,
    this.tags,
  });

  Data.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        code = json['code'] as String?,
        profileCode = json['profile_code'],
        name = json['name'] as String?,
        specialist = json['specialist'],
        about = json['about'] as String?,
        rate = json['rate'],
        domicile = json['domicile'],
        phoneNumber = json['phone_number'],
        tags = (json['tags'] as List?)?.map((dynamic e) => Tags.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'id' : id,
    'code' : code,
    'profile_code' : profileCode,
    'name' : name,
    'specialist' : specialist,
    'about' : about,
    'rate' : rate,
    'domicile' : domicile,
    'phone_number' : phoneNumber,
    'tags' : tags?.map((e) => e.toJson()).toList()
  };
}

class Tags {
  final String? id;
  final Tag? tag;

  Tags({
    this.id,
    this.tag,
  });

  Tags.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        tag = (json['tag'] as Map<String,dynamic>?) != null ? Tag.fromJson(json['tag'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'tag' : tag?.toJson()
  };
}

class Tag {
  final String? id;
  final String? type;
  final String? name;
  final dynamic parent;
  final dynamic icon;
  final dynamic value;

  Tag({
    this.id,
    this.type,
    this.name,
    this.parent,
    this.icon,
    this.value,
  });

  Tag.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        type = json['type'] as String?,
        name = json['name'] as String?,
        parent = json['parent'],
        icon = json['icon'],
        value = json['value'];

  Map<String, dynamic> toJson() => {
    'id' : id,
    'type' : type,
    'name' : name,
    'parent' : parent,
    'icon' : icon,
    'value' : value
  };
}

class Links {
  final dynamic next;
  final dynamic previous;

  Links({
    this.next,
    this.previous,
  });

  Links.fromJson(Map<String, dynamic> json)
      : next = json['next'],
        previous = json['previous'];

  Map<String, dynamic> toJson() => {
    'next' : next,
    'previous' : previous
  };
}