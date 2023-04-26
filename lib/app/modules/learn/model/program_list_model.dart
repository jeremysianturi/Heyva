class ProgramListModel {
  final String? success;
  final List<Data>? data;
  final dynamic message;
  final dynamic error;
  final Links? links;
  final int? count;

  ProgramListModel({
    this.success,
    this.data,
    this.message,
    this.error,
    this.links,
    this.count,
  });

  ProgramListModel.fromJson(Map<String, dynamic> json)
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
  final String? title;
  final String? body;
  final String? banner;
  final dynamic parent;
  final dynamic order;
  final String? thumbnail;
  final List<Tags>? tags;
  final List<Child>? child;
  final List<dynamic>? programDetail;
  final dynamic daysCount;

  Data({
    this.id,
    this.title,
    this.body,
    this.banner,
    this.parent,
    this.order,
    this.thumbnail,
    this.tags,
    this.child,
    this.programDetail,
    this.daysCount,
  });

  Data.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        title = json['title'] as String?,
        body = json['body'] as String?,
        banner = json['banner'] as String?,
        parent = json['parent'],
        order = json['order'],
        thumbnail = json['thumbnail'] as String?,
        tags = (json['tags'] as List?)?.map((dynamic e) => Tags.fromJson(e as Map<String,dynamic>)).toList(),
        child = (json['child'] as List?)?.map((dynamic e) => Child.fromJson(e as Map<String,dynamic>)).toList(),
        programDetail = json['program_detail'] as List?,
        daysCount = json['days_count'];

  Map<String, dynamic> toJson() => {
    'id' : id,
    'title' : title,
    'body' : body,
    'banner' : banner,
    'parent' : parent,
    'order' : order,
    'thumbnail' : thumbnail,
    'tags' : tags?.map((e) => e.toJson()).toList(),
    'child' : child?.map((e) => e.toJson()).toList(),
    'program_detail' : programDetail,
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

class Child {
  final String? id;
  final String? title;
  final String? body;
  final String? banner;
  final String? thumbnail;
  final dynamic order;
  final List<ProgramDetail>? programDetail;

  Child({
    this.id,
    this.title,
    this.body,
    this.banner,
    this.thumbnail,
    this.order,
    this.programDetail,
  });

  Child.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        title = json['title'] as String?,
        body = json['body'] as String?,
        banner = json['banner'] as String?,
        thumbnail = json['thumbnail'] as String?,
        order = json['order'],
        programDetail = (json['program_detail'] as List?)?.map((dynamic e) => ProgramDetail.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'id' : id,
    'title' : title,
    'body' : body,
    'banner' : banner,
    'thumbnail' : thumbnail,
    'order' : order,
    'program_detail' : programDetail?.map((e) => e.toJson()).toList()
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