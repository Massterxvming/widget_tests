import 'package:objectbox/objectbox.dart';

@Entity()
class User {
  @Id()
  int id = 0;
  String name;
  String email;
  String password;
  @Backlink("user")
  final account=ToMany<Account>();

  User({
    required this.name,
    required this.email,
    required this.password,
  });
}

@Entity()
class Account {
  @Id()
  int id = 0;
  String name;
  String email;
  String password;

  final user = ToOne<User>();

  Account({
    required this.name,
    required this.email,
    required this.password,
  });
}