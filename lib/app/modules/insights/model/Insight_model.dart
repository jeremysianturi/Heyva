class InsightModel {
  final String? success;
  final List<Data>? data;
  final dynamic message;
  final dynamic error;

  InsightModel({
    this.success,
    this.data,
    this.message,
    this.error,
  });

  InsightModel.fromJson(Map<String, dynamic> json)
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
  final String? insightDate;
  final List<Insight>? insight;

  Data({
    this.insightDate,
    this.insight,
  });

  Data.fromJson(Map<String, dynamic> json)
      : insightDate = json['insight_date'] as String?,
        insight = (json['insight'] as List?)?.map((dynamic e) => Insight.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'insight_date' : insightDate,
    'insight' : insight?.map((e) => e.toJson()).toList()
  };
}

class Insight {
  final String? id;
  final String? profileCode;
  final Type? type;
  final List<Response>? response;

  Insight({
    this.id,
    this.profileCode,
    this.type,
    this.response,
  });

  Insight.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        profileCode = json['profile_code'] as String?,
        type = (json['type'] as Map<String,dynamic>?) != null ? Type.fromJson(json['type'] as Map<String,dynamic>) : null,
        response = (json['response'] as List?)?.map((dynamic e) => Response.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'id' : id,
    'profile_code' : profileCode,
    'type' : type?.toJson(),
    'response' : response?.map((e) => e.toJson()).toList()
  };
}

class Type {
  final String? id;
  final String? type;
  final String? title;
  final String? description;

  Type({
    this.id,
    this.type,
    this.title,
    this.description,
  });

  Type.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        type = json['type'] as String?,
        title = json['title'] as String?,
        description = json['description'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'type' : type,
    'title' : title,
    'description' : description
  };
}

class Response {
  final TrackerDetail? trackerDetail;
  final List<Answer>? answer;
  final String? note;

  Response({
    this.trackerDetail,
    this.answer,
    this.note,
  });

  Response.fromJson(Map<String, dynamic> json)
      : trackerDetail = (json['tracker_detail'] as Map<String,dynamic>?) != null ? TrackerDetail.fromJson(json['tracker_detail'] as Map<String,dynamic>) : null,
        answer = (json['answer'] as List?)?.map((dynamic e) => Answer.fromJson(e as Map<String,dynamic>)).toList(),
        note = json['note'] as String?;

  Map<String, dynamic> toJson() => {
    'tracker_detail' : trackerDetail?.toJson(),
    'answer' : answer?.map((e) => e.toJson()).toList(),
    'note' : note
  };
}

class TrackerDetail {
  final String? id;
   String? title;
  final int? order;

  TrackerDetail({
    this.id,
    this.title,
    this.order,
  });

  TrackerDetail.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        title = json['title'] as String?,
        order = json['order'] as int?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'title' : title,
    'order' : order
  };
}

class Answer {
  final String? id;
  final String? name;
  final String? emoji;
  final int? value;
  final List<String>? relatedTag;

  Answer({
    this.id,
    this.name,
    this.emoji,
    this.value,
    this.relatedTag,
  });

  Answer.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        name = json['name'] as String?,
        emoji = json['emoji'] as String?,
        value = json['value'] as int?,
        relatedTag = (json['related_tag'] as List?)?.map((dynamic e) => e as String).toList();

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name,
    'emoji' : emoji,
    'value' : value,
    'related_tag' : relatedTag
  };
}