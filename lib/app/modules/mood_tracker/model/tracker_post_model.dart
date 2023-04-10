class TrackerPostModel {
  final List<Data>? data;

  TrackerPostModel({
    this.data,
  });

  TrackerPostModel.fromJson(Map<String, dynamic> json)
      : data = (json['data'] as List?)?.map((dynamic e) => Data.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'data' : data?.map((e) => e.toJson()).toList()
  };
}

class Data {
  final String? type;
  final List<Response>? response;

  Data({
    this.type,
    this.response,
  });

  Data.fromJson(Map<String, dynamic> json)
      : type = json['type'] as String?,
        response = (json['response'] as List?)?.map((dynamic e) => Response.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'type' : type,
    'response' : response?.map((e) => e.toJson()).toList()
  };
}

class Response {
  final String? trackerDetailId;
  final List<String>? answer;
  final String? note;

  Response({
    this.trackerDetailId,
    this.answer,
    this.note,
  });

  Response.fromJson(Map<String, dynamic> json)
      : trackerDetailId = json['tracker_detail_id'] as String?,
        answer = (json['answer'] as List?)?.map((dynamic e) => e as String).toList(),
        note = json['note'] as String?;

  Map<String, dynamic> toJson() => {
    'tracker_detail_id' : trackerDetailId,
    'answer' : answer,
    'note' : note
  };
}