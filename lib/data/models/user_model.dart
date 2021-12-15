class UserModel {
  String? id;
  String name;
  String nickName;
  String email;
  String password;
  String avatarLink;

  UserModel(
      // constructor del modelo
      {
    this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.avatarLink,
    required this.nickName,
  });
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'userName': nickName,
      'email': email,
      'password': password,
      'avatarLink': avatarLink,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic>? map) {
    return UserModel(
      id: map?['id'],
      name: map?['name'],
      nickName: map?['userName'],
      email: map?['email'],
      password: map?['password'],
      avatarLink: map?['avatarLink'],
    );
  }
}
