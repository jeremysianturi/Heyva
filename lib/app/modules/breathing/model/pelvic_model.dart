class PelvicModel {
  final String? success;
  final Data? data;
  final dynamic message;
  final dynamic error;

  PelvicModel({
    this.success,
    this.data,
    this.message,
    this.error,
  });

  PelvicModel.fromJson(Map<String, dynamic> json)
      : success = json['success'] as String?,
        data = (json['data'] as Map<String,dynamic>?) != null ? Data.fromJson(json['data'] as Map<String,dynamic>) : null,
        message = json['message'],
        error = json['error'];

  Map<String, dynamic> toJson() => {
    'success' : success,
    'data' : data?.toJson(),
    'message' : message,
    'error' : error
  };
}

class Data {
  final String? id;
  final String? title;
  final String? body;
  final dynamic banner;
  final dynamic parent;
  final dynamic order;
  final List<Tags>? tags;
  final List<dynamic>? child;
  final List<ProgramDetail>? programDetail;
  final String? daysCount;

  Data({
    this.id,
    this.title,
    this.body,
    this.banner,
    this.parent,
    this.order,
    this.tags,
    this.child,
    this.programDetail,
    this.daysCount,
  });

  Data.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        title = json['title'] as String?,
        body = json['body'] as String?,
        banner = json['banner'],
        parent = json['parent'],
        order = json['order'],
        tags = (json['tags'] as List?)?.map((dynamic e) => Tags.fromJson(e as Map<String,dynamic>)).toList(),
        child = json['child'] as List?,
        programDetail = (json['program_detail'] as List?)?.map((dynamic e) => ProgramDetail.fromJson(e as Map<String,dynamic>)).toList(),
        daysCount = json['days_count'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'title' : title,
    'body' : body,
    'banner' : banner,
    'parent' : parent,
    'order' : order,
    'tags' : tags?.map((e) => e.toJson()).toList(),
    'child' : child,
    'program_detail' : programDetail?.map((e) => e.toJson()).toList(),
    'days_count' : daysCount
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

class ProgramDetail {
  final String? id;
  final String? contentType;
  final String? textContent;
  final dynamic imageContent;
  final dynamic videoContent;
  final dynamic jsonContent;
  final int? order;

  ProgramDetail({
    this.id,
    this.contentType,
    this.textContent,
    this.imageContent,
    this.videoContent,
    this.jsonContent,
    this.order,
  });

  ProgramDetail.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        contentType = json['content_type'] as String?,
        textContent = json['text_content'] as String?,
        imageContent = json['image_content'],
        videoContent = json['video_content'],
        jsonContent = json['json_content'],
        order = json['order'] as int?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'content_type' : contentType,
    'text_content' : textContent,
    'image_content' : imageContent,
    'video_content' : videoContent,
    'json_content' : jsonContent,
    'order' : order
  };
}