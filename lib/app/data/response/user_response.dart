import 'package:json_annotation/json_annotation.dart';
import 'package:technical_test/app/data/entity/user.dart';

part 'user_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class UserResponse {
  final int page;
  final int perPage;
  final int total;
  final int totalPages;
  final List<User> data;
  final Support support;
  @JsonKey(name: "_meta")
  final Meta meta;

  UserResponse({
    required this.data,
    required this.meta,
    required this.page,
    required this.perPage,
    required this.support,
    required this.total,
    required this.totalPages,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Support {
  final String text;
  final String url;

  Support({required this.text, required this.url});

  factory Support.fromJson(Map<String, dynamic> json) =>
      _$SupportFromJson(json);
  Map<String, dynamic> toJson() => _$SupportToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Meta {
  final String poweredBy;
  final String docsUrl;
  final String upgradeUrl;
  final String exampleUrl;
  final String variant;
  final String message;
  final CTA cta;
  final String context;

  Meta({
    required this.poweredBy,
    required this.docsUrl,
    required this.upgradeUrl,
    required this.exampleUrl,
    required this.variant,
    required this.message,
    required this.context,
    required this.cta,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
  Map<String, dynamic> toJson() => _$MetaToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class CTA {
  final String label;
  final String url;

  CTA({required this.label, required this.url});

  factory CTA.fromJson(Map<String, dynamic> json) => _$CTAFromJson(json);
  Map<String, dynamic> toJson() => _$CTAToJson(this);
}
