class UserInfo {
  String id, email, firstName, surname, role;

  UserInfo(this.id, this.email, this.firstName, this.surname, this.role);

  UserInfo.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        email = json['email'],
        firstName = json['firstName'],
        surname = json['surname'],
        role = json['role'];
}
