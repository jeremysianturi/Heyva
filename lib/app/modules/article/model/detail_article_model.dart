class DetailArticleModel {
  final String? success;
  final List<Data>? data;
  final dynamic message;
  final dynamic error;

  DetailArticleModel({
    this.success,
    this.data,
    this.message,
    this.error,
  });

  DetailArticleModel.fromJson(Map<String, dynamic> json)
      : success = json['success'] as String?,
        data = (json['data'] as List?)?.map((dynamic e) => Data.fromJson(e as Map<String,dynamic>)).toList(),
        message = json['message'],
        error = json['error'];

  Map<String, dynamic> toJson() => {
    'success' : success,
    'data' : data?.map((e) => e.toJson()).toList(),
    'message' : message,
    'error' : error
  };
}

class Data {
  final String? id;
  final String? title;
  final List<Tags>? tags;
  final String? renderedBody;

  Data({
    this.id,
    this.title,
    this.tags,
    this.renderedBody,
  });

  Data.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        title = json['title'] as String?,
        tags = (json['tags'] as List?)?.map((dynamic e) => Tags.fromJson(e as Map<String,dynamic>)).toList(),
        renderedBody = json['rendered_body'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'title' : title,
    'tags' : tags?.map((e) => e.toJson()).toList(),
    'rendered_body' : renderedBody
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