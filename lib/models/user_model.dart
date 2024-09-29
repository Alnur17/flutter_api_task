class User {
  final String name;
  final String email;
  final String bloodGroup;

  User({required this.name, required this.email, required this.bloodGroup});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      bloodGroup: json['bloodGroup'],
    );
  }
}
