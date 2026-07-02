class UserModel {
  final String userName;
  final String userEmail;
  final int userPhone;
  final String gender;

  UserModel(
      {required this.gender,
      required this.userEmail,
      required this.userName,
      required this.userPhone});

  UserModel toJson() {
    return UserModel(
        gender: gender,
        userEmail: userEmail,
        userName: userName,
        userPhone: userPhone);
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        gender: json['gender'],
        userEmail: json['email'],
        userName: json['User_Name'],
        userPhone: json["phone"]);
  }
}
