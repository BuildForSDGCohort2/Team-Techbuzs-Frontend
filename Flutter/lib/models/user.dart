class UserModel {
  final String id;
  final String fullName;
  final String email;
  final String location;

  UserModel({this.id, this.fullName, this.email, this.location});

  UserModel.fromData(Map<String, dynamic> data)
      : id = data['id'],
        fullName = data['fullName'],
        email = data['email'],
        location = data['location'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'location': location,
    };
  }
}
