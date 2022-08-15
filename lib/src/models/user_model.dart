import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  String? id;
  @JsonKey(name: 'fullname')
  String? name;
  String? email;
  String? phone;
  String? cpf;
  String? password;
  String? token;
  UserModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.cpf,
    this.password,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['fullname'],
      email: map['email'],
      phone: map['phone'],
      cpf: map['cpf'],
      password: map['password'],
      token: map['token'],
    );
  }

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fullname': name,
      'email': email,
      'phone': phone,
      'cpf': cpf,
      'password': password,
      'token': token,
    };
  }

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, phone: $phone, cpf: $cpf, password: $password, token: $token)';
  }
}
