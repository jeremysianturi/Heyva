class RecomendationModel {
  final String? success;
  final List<Data>? data;
  final dynamic message;
  final dynamic error;
  final Links? links;
  final int? count;

  RecomendationModel({
    this.success,
    this.data,
    this.message,
    this.error,
    this.links,
    this.count,
  });

  RecomendationModel.fromJson(Map<String, dynamic> json)
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
  final String? contentReferenceId;
  final ContentType? contentType;
  final Contents? contents;

  Data({
    this.id,
    this.contentReferenceId,
    this.contentType,
    this.contents,
  });

  Data.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        contentReferenceId = json['content_reference_id'] as String?,
        contentType = (json['content_type'] as Map<String,dynamic>?) != null ? ContentType.fromJson(json['content_type'] as Map<String,dynamic>) : null,
        contents = (json['contents'] as Map<String,dynamic>?) != null ? Contents.fromJson(json['contents'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'content_reference_id' : contentReferenceId,
    'content_type' : contentType?.toJson(),
    'contents' : contents?.toJson()
  };
}

class ContentType {
  final String? id;
  final String? type;
  final String? name;
  final dynamic parent;
  final dynamic icon;
  final dynamic value;

  ContentType({
    this.id,
    this.type,
    this.name,
    this.parent,
    this.icon,
    this.value,
  });

  ContentType.fromJson(Map<String, dynamic> json)
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

class Contents {
  final String? id;
  final String? title;
  final String? body;
  final String? creator;
  final String? banner;
  final String? thumbnail;

  Contents({
    this.id,
    this.title,
    this.body,
    this.creator,
    this.banner,
    this.thumbnail,
  });

  Contents.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        title = json['title'] as String?,
        body = json['body'] as String?,
        creator = json['creator'] as String?,
        banner = json['banner'] as String?,
        thumbnail = json['thumbnail'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'title' : title,
    'body' : body,
    'creator' : creator,
    'banner' : banner,
    'thumbnail' : thumbnail
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