// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthApiModel _$AuthApiModelFromJson(Map<String, dynamic> json) => AuthApiModel(
      userId: json['_id'] as String?,
      fullname: json['fullname'] as String,
      location: json['location'] as String,
      phonenum: json['phonenum'] as String,
      username: json['username'] as String,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$AuthApiModelToJson(AuthApiModel instance) =>
    <String, dynamic>{
      '_id': instance.userId,
      'fullname': instance.fullname,
      'location': instance.location,
      'phonenum': instance.phonenum,
      'username': instance.username,
      'password': instance.password,
    };
