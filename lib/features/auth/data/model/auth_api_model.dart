import 'package:fruit_ordering_app/features/auth/domain/entity/auth_entity.dart';
import 'package:json_annotation/json_annotation.dart';


part 'auth_api_model.g.dart';

@JsonSerializable()
class AuthApiModel {
  @JsonKey(name: '_id')
  final String? userId;
  final String fullname;
  final String location;
  final String phonenum;
  final String username;
  final String? password;

  AuthApiModel({
    this.userId,
    required this.fullname,
    required this.location,
   required this.phonenum,
     required this.username,
    this.password,
  });

  factory AuthApiModel.fromJson(Map<String, dynamic> json) =>
      _$AuthApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthApiModelToJson(this);

  // To entity
  factory AuthApiModel.toEntity(AuthApiModel apiModel) {
    return AuthApiModel(
      userId: apiModel.userId,
      fullname: apiModel.fullname,
      location: apiModel.location,
     
      phonenum: apiModel.phonenum,
      
      username: apiModel.username,
      password: apiModel.password,
    );
  }

  // From entity
  factory AuthApiModel.fromEntity(AuthEntity entity) {
    return AuthApiModel(
      userId: entity.id,
      fullname: entity.fullname,
      location: entity.location,
      phonenum: entity.phonenum,
      username: entity.username,
      password: entity.password,
    );
  }
}
