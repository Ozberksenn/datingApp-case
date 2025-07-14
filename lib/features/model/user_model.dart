class UserModel {
  final String id;
  final String? token;
  final String name;
  final String email;
  final String? photoUrl;

  UserModel({
    required this.id,
    this.token,
    required this.name,
    required this.email,
    this.photoUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      token: json['token'] ?? "",
      name: json['name'],
      photoUrl: json['photoUrl'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'token': token,
      'email': email,
      'name': name,
      'photoUrl': photoUrl,
    };
  }
}
