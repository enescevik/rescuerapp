import 'package:json_annotation/json_annotation.dart';
import 'package:rescuerapp/apis/models/base_model.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends BaseModel {
  final int id;
  final String mail;
  final String name;
  final String surname;
  final String phoneNumber;
  final String token;

  User({
    this.id,
    this.mail,
    this.name,
    this.surname,
    this.phoneNumber,
    this.token,
  });

  User fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
