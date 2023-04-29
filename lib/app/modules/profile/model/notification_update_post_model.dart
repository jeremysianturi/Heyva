class NotificationUpdatePostModel {
  final List<String> termsPrivacy;
  final List<bool> isAgree;

  NotificationUpdatePostModel({
    required this.termsPrivacy,
    required this.isAgree,
  });

  Map<String, dynamic> toJson() =>
      {'terms_privacy': termsPrivacy, 'is_agree': isAgree};
}
