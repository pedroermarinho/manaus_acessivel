class User {
  String idUser;
  String name;
  String email;
  String password;
  String userType;
  String pathPhoto;

  User({
    this.idUser,
    this.name,
    this.email,
    this.password,
    this.userType,
    this.pathPhoto,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "name": name,
      "email": email,
      "userType": userType,
      "pathPhoto": pathPhoto
    };
    return map;
  }
}
