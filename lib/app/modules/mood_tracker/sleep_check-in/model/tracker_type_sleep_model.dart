class TrackerTypeSleepModel {
  final String? success;
  final List<Data>? data;
  final dynamic message;
  final dynamic error;

  TrackerTypeSleepModel({
    this.success,
    this.data,
    this.message,
    this.error,
  });

  TrackerTypeSleepModel.fromJson(Map<String, dynamic> json)
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
  final String? title;
  final String? description;
  final List<TrackerDetail>? trackerDetail;

  Data({
    this.id,
    this.type,
    this.title,
    this.description,
    this.trackerDetail,
  });

  Data.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        type = json['type'] as String?,
        title = json['title'] as String?,
        description = json['description'] as String?,
        trackerDetail = (json['tracker_detail'] as List?)
            ?.map((dynamic e) =>
                TrackerDetail.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
        'title': title,
        'description': description,
        'tracker_detail': trackerDetail?.map((e) => e.toJson()).toList()
      };
}

class TrackerDetail {
  final String? id;
  final String? title;
  final dynamic body;
  final String? contentType;
  final List<JsonContent>? jsonContent;
  final int? order;
  String notes = "";

  TrackerDetail({
    this.id,
    this.title,
    this.body,
    this.contentType,
    this.jsonContent,
    this.order,
    this.notes = "",
  });

  TrackerDetail.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        title = json['title'] as String?,
        body = json['body'],
        contentType = json['content_type'] as String?,
        jsonContent = (json['json_content'] as List?)
            ?.map(
                (dynamic e) => JsonContent.fromJson(e as Map<String, dynamic>))
            .toList(),
        order = json['order'] as int?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'body': body,
        'content_type': contentType,
        'json_content': jsonContent?.map((e) => e.toJson()).toList(),
        'order': order
      };
}

class JsonContent {
  final String? id;
  final String? name;
  final int? value;
  final List<dynamic>? relatedTag;
  bool isSelected = false;
  String notes = "";
  final String? emoji;

  JsonContent({
    this.id,
    this.name,
    this.value,
    this.relatedTag,
    this.isSelected = false,
    this.notes = "",
    this.emoji,
  });

  JsonContent.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        name = json['name'] as String?,
        value = json['value'] as int?,
        emoji = json['emoji'] as String?,
        relatedTag = json['related_tag'] as List?;

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'value': value,
    'related_tag': relatedTag,
    'emoji': emoji,
  };
}