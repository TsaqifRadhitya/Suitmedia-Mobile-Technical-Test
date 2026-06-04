// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
  avatar: json['avatar'] as String,
  email: json['email'] as String,
  firstName: json['first_name'] as String,
  id: (json['id'] as num).toInt(),
  lastName: json['last_name'] as String,
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'avatar': instance.avatar,
};
