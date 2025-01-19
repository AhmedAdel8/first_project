import 'package:json_annotation/json_annotation.dart';

part 'user_data_model.g.dart';

@JsonSerializable()
class UserDataModel {
  String? message;
  Authorization? authorization;

  @JsonKey(name: 'result')
  Result? userData;

  UserDataModel({this.message, this.authorization, this.userData});

  factory UserDataModel.fromJson(Map<String, dynamic> data) => _$UserDataModelFromJson(data);

  Map<String, dynamic> toJson() => _$UserDataModelToJson(this);
}

@JsonSerializable()
class Authorization {
  String? token;

  Authorization({this.token});

  factory Authorization.fromJson(Map<String, dynamic> data) => _$AuthorizationFromJson(data);

  Map<String, dynamic> toJson() => _$AuthorizationToJson(this);

}

@JsonSerializable()
class Result {
  @JsonKey(name: '_id')
  String? userId;

  String? userName;
  String? email;
  String? password;
  String? role;
  bool? isDeleted;
  bool? isBlocked;

  Result(
      {this.userId,
        this.userName,
        this.email,
        this.password,
        this.role,
        this.isDeleted,
        this.isBlocked});

  factory Result.fromJson(Map<String, dynamic> data) => _$ResultFromJson(data);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
