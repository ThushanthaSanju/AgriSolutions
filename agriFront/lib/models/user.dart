class User {
  late String? id;
  String name;
  String mobileno;
  String email;
  String password;
  User(this.name, this.mobileno, this.email, this.password);

  User.create(this.id, this.name, this.mobileno, this.email, this.password);
  factory User.fromJson(Map<String, dynamic> json) {
    return User.create(json['_id'], json['name'], json['mobileno'],
        json['email'], json['password']);
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'mobileno': mobileno,
        'email': email,
        'password': password,
      };
}
