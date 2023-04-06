class ContentDetailModel {
  final String? success;
  final Data? data;
  final dynamic message;
  final dynamic error;

  ContentDetailModel({
    this.success,
    this.data,
    this.message,
    this.error,
  });

  ContentDetailModel.fromJson(Map<String, dynamic> json)
      : success = json['success'] as String?,
        data = (json['data'] as Map<String, dynamic>?) != null
            ? Data.fromJson(json['data'] as Map<String, dynamic>)
            : null,
        message = json['message'],
        error = json['error'];

  Map<String, dynamic> toJson() => {
        'success': success,
        'data': data?.toJson(),
        'message': message,
        'error': error
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
        contentType = (json['content_type'] as Map<String, dynamic>?) != null
            ? ContentType.fromJson(json['content_type'] as Map<String, dynamic>)
            : null,
        contents = (json['contents'] as Map<String, dynamic>?) != null
            ? Contents.fromJson(json['contents'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'content_reference_id': contentReferenceId,
        'content_type': contentType?.toJson(),
        'contents': contents?.toJson()
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
        'id': id,
        'type': type,
        'name': name,
        'parent': parent,
        'icon': icon,
        'value': value
      };
}

class Contents {
  final String? id;
  final String? title;
  final String? body;
  final String? creator;
  final List<Tags>? tags;
  final List<Attachments>? attachments;
  final String? banner;

  Contents({
    this.id,
    this.title,
    this.body,
    this.creator,
    this.tags,
    this.attachments,
    this.banner,
  });

  Contents.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        title = json['title'] as String?,
        body = json['body'] as String?,
        creator = json['creator'] as String?,
        tags = (json['tags'] as List?)
            ?.map((dynamic e) => Tags.fromJson(e as Map<String, dynamic>))
            .toList(),
        attachments = (json['attachments'] as List?)
            ?.map(
                (dynamic e) => Attachments.fromJson(e as Map<String, dynamic>))
            .toList(),
        banner = json['banner'] as String?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'body': body,
        'creator': creator,
        'tags': tags?.map((e) => e.toJson()).toList(),
        'attachments': attachments?.map((e) => e.toJson()).toList(),
        'banner': banner
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
        tag = (json['tag'] as Map<String, dynamic>?) != null
            ? Tag.fromJson(json['tag'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {'id': id, 'tag': tag?.toJson()};
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
        'id': id,
        'type': type,
        'name': name,
        'parent': parent,
        'icon': icon,
        'value': value
      };
}

class Attachments {
  final String? id;
  final int? attachmentOrder;
  final String? attachment;
  final String? attachmentTitle;
  final dynamic attachmentLength;
  final String? thumbnail;

  Attachments({
    this.id,
    this.attachmentOrder,
    this.attachment,
    this.attachmentTitle,
    this.attachmentLength,
    this.thumbnail,
  });

  Attachments.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        attachmentOrder = json['attachment_order'] as int?,
        attachment = json['attachment'] as String?,
        attachmentTitle = json['attachment_title'] as String?,
        attachmentLength = json['attachment_length'],
        thumbnail = json['thumbnail'] as String?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'attachment_order': attachmentOrder,
        'attachment': attachment,
        'attachment_title': attachmentTitle,
        'attachment_length': attachmentLength,
        'thumbnail': thumbnail
      };
}
