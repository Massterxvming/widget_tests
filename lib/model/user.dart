import 'package:objectbox/objectbox.dart';

@Entity()
class User {
  @Id()
  int? id;
  String name;
  String email;
  String password;
  @Backlink("user")
  final accounts=ToMany<Account>();

  User({
    required this.name,
    required this.email,
    required this.password,
    this.id,
  });

  @override
  String toString() => "User($id, $name, $email, $password)";
}

@Entity()
class Account {
  @Id()
  int? id;
  String name;
  String email;
  String password;

  final user = ToOne<User>();

  Account({
    required this.name,
    required this.email,
    required this.password,
  });

  @override
  String toString() => "Account($id, $name, $email, $password)";
}