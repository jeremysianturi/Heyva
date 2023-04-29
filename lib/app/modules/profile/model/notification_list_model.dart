class NotificationListModel {
  final String? success;
  final List<Data>? data;
  final dynamic message;
  final dynamic error;
  final Links? links;
  final int? count;

  NotificationListModel({
    this.success,
    this.data,
    this.message,
    this.error,
    this.links,
    this.count,
  });

  NotificationListModel.fromJson(Map<String, dynamic> json)
      : success = json['success'] as String?,
        data = (json['data'] as List?)
            ?.map((dynamic e) => Data.fromJson(e as Map<String, dynamic>))
            .toList(),
        message = json['message'],
        error = json['error'],
        links = (json['links'] as Map<String, dynamic>?) != null
            ? Links.fromJson(json['links'] as Map<String, dynamic>)
            : null,
        count = json['count'] as int?;

  Map<String, dynamic> toJson() => {
        'success': success,
        'data': data?.map((e) => e.toJson()).toList(),
        'message': message,
        'error': error,
        'links': links?.toJson(),
        'count': count
      };
}

class Data {
  final String? id;
  bool? isActive;
  final String? type;
  final dynamic platform;
  final dynamic version;
  final dynamic textContent;
  final JsonContent? jsonContent;
  bool? isAgree;

  Data({
    this.id,
    this.isActive,
    this.type,
    this.platform,
    this.version,
    this.textContent,
    this.jsonContent,
    this.isAgree,
  });

  Data.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        isActive = json['is_active'] as bool?,
        type = json['type'] as String?,
        platform = json['platform'],
        version = json['version'],
        textContent = json['text_content'],
        jsonContent = (json['json_content'] as Map<String, dynamic>?) != null
            ? JsonContent.fromJson(json['json_content'] as Map<String, dynamic>)
            : null,
        isAgree = json['is_agree'] as bool?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'is_active': isActive,
        'type': type,
        'platform': platform,
        'version': version,
        'text_content': textContent,
        'json_content': jsonContent?.toJson(),
        'is_agree': isAgree
      };
}

class JsonContent {
  final String? body;
  final String? title;

  JsonContent({
    this.body,
    this.title,
  });

  JsonContent.fromJson(Map<String, dynamic> json)
      : body = json['body'] as String?,
        title = json['title'] as String?;

  Map<String, dynamic> toJson() => {'body': body, 'title': title};
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

  Map<String, dynamic> toJson() => {'next': next, 'previous': previous};
}
