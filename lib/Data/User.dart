import 'package:sqflite/sqflite.dart';
import 'package:virtualstocktrader/Data/Database.dart';

class User{
  int? id;
  final String username;
  double balance;

  User(this.id,this.username, this.balance);
  User.newUser(this.username, this.balance);


  factory User.fromMap(Map<String, dynamic> json) => new User(json["id"],json["username"],json["balance"]);

  Map<String, dynamic> toMap() => {
    "id": id,
    "username": username,
    "balance": balance,
  };


}