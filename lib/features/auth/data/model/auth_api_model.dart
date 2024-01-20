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
  final String email;
  final String? password;

  AuthApiModel({
    this.userId,
    required this.fullname,
    required this.location,
   required this.phonenum,
     required this.email,
    required this.password,
  });

  factory AuthApiModel.fromJson(Map<String, dynamic> json) =>
      _$AuthApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthApiModelToJson(this);

  
  factory AuthApiModel.toEntity(AuthApiModel apiModel) {
    return AuthApiModel(
      userId: apiModel.userId,
      fullname: apiModel.fullname,
      location: apiModel.location,
     
      phonenum: apiModel.phonenum,
      
      email: apiModel.email,
      password: apiModel.password,
    );
  }

  
  factory AuthApiModel.fromEntity(AuthEntity entity) {
    return AuthApiModel(
      userId: entity.id,
      fullname: entity.fullname,
      location: entity.location,
      phonenum: entity.phonenum,
      email: entity.email,
      password: entity.password,
    );
  }
}
