class TrackerCreateModel {
  final String? success;
  final dynamic data;
  final dynamic message;
  final dynamic error;

  TrackerCreateModel({
    this.success,
    this.data,
    this.message,
    this.error,
  });

  TrackerCreateModel.fromJson(Map<String, dynamic> json)
      : success = json['success'] as String?,
        data = json['data'],
        message = json['message'],
        error = json['error'];

  Map<String, dynamic> toJson() => {
    'success' : success,
    'data' : data,
    'message' : message,
    'error' : error
  };
}