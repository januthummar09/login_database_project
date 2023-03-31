class UserModel {
  int? id;
  String? firstName;
  String? lastName;
  int? age;
  String? gender;
  String email;
  String password;
  String? conformPassword;

  UserModel({this.id, required this.email, required this.password, this.age, this.gender, this.firstName, this.lastName, this.conformPassword});

  UserModel.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        firstName = res['firstName'],
        lastName = res['lastName'],
        age = res['age'],
        gender = res['gender'],
        email = res["email"],
        password = res["password"],
        conformPassword = res['conformPassword'];

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'age': age,
      'gender': gender,
      'email': email,
      'password': password,
      'conformPassword': conformPassword,
    };
  }
}
