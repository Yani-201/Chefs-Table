class UserUpdateDto {
  final String? username;
  final String? email;
  final String? role;
  final String? password;
  final String? oldPassword;
  final String? photo;

  UserUpdateDto({
    this.oldPassword,
    this.username,
    this.email,
    this.photo,
    this.password,
    this.role,
  });

  factory UserUpdateDto.fromJson(Map<String, dynamic> json) {
    return UserUpdateDto(
      username: json['username'],
      email: json['email'],
      photo: json['photo'],
    );
  }
}
