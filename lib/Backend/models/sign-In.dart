class SignInResponse {
  final String message;
  final String token;
  final String refreshToken;
  final String email;
  final String status;
  final String role;
  final String uid;
  final UserProfile profile;

  SignInResponse({
    required this.message,
    required this.token,
    required this.refreshToken,
    required this.email,
    required this.status,
    required this.role,
    required this.uid,
    required this.profile,
  });

  factory SignInResponse.fromJson(Map<String, dynamic> json) {
    return SignInResponse(
      message: json['message'] ?? '',
      token: json['token'] ?? '',
      refreshToken: json['refreshToken'] ?? '',
      email: json['email'] ?? '',
      status: json['status'] ?? '',
      role: json['role'] ?? '',
      uid: json['uid'] ?? '',
      profile: UserProfile.fromJson(json['profile'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'token': token,
      'refreshToken': refreshToken,
      'email': email,
      'status': status,
      'role': role,
      'uid': uid,
      'profile': profile.toJson(),
    };
  }
}

class UserProfile {
  final String id;
  final String userId;
  final String firstName;
  final String organization;
  final String roleOfOrganization;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  UserProfile({
    required this.id,
    required this.userId,
    required this.firstName,
    required this.organization,
    required this.roleOfOrganization,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['_id'] ?? '',
      userId: json['userId'] ?? '',
      firstName: json['firstName'] ?? '',
      organization: json['organization'] ?? '',
      roleOfOrganization: json['roleOfOrganization'] ?? '',
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : DateTime.now(),
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : DateTime.now(),
      v: json['__v'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'userId': userId,
      'firstName': firstName,
      'organization': organization,
      'roleOfOrganization': roleOfOrganization,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': v,
    };
  }
}
