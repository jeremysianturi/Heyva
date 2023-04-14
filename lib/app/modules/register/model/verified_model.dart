class VerifiedModel {
  final String? success;
  final dynamic data;
  final String? message;
  final dynamic error;

  VerifiedModel({
    this.success,
    this.data,
    this.message,
    this.error,
  });

  VerifiedModel.fromJson(Map<String, dynamic> json)
      : success = json['success'] as String?,
        data = json['data'],
        message = json['message'] as String?,
        error = json['error'];

  Map<String, dynamic> toJson() => {
    'success' : success,
    'data' : data,
    'message' : message,
    'error' : error
  };
}