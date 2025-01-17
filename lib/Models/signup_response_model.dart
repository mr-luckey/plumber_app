class SignupResponseModel {
  final String message;
  final String id;

  SignupResponseModel({
    required this.message,
    required this.id,
  });

  factory SignupResponseModel.fromJson(Map<String, dynamic> json) {
    return SignupResponseModel(
      message: json['message'] ?? '',
      id: json['id'] ?? '',
    );
  }
}
