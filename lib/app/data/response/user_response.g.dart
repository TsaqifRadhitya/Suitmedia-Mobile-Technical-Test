// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
  data: (json['data'] as List<dynamic>)
      .map((e) => User.fromJson(e as Map<String, dynamic>))
      .toList(),
  meta: Meta.fromJson(json['_meta'] as Map<String, dynamic>),
  page: (json['page'] as num).toInt(),
  perPage: (json['per_page'] as num).toInt(),
  support: Support.fromJson(json['support'] as Map<String, dynamic>),
  total: (json['total'] as num).toInt(),
  totalPages: (json['total_pages'] as num).toInt(),
);

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'per_page': instance.perPage,
      'total': instance.total,
      'total_pages': instance.totalPages,
      'data': instance.data,
      'support': instance.support,
      '_meta': instance.meta,
    };

Support _$SupportFromJson(Map<String, dynamic> json) =>
    Support(text: json['text'] as String, url: json['url'] as String);

Map<String, dynamic> _$SupportToJson(Support instance) => <String, dynamic>{
  'text': instance.text,
  'url': instance.url,
};

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
  poweredBy: json['powered_by'] as String,
  docsUrl: json['docs_url'] as String,
  upgradeUrl: json['upgrade_url'] as String,
  exampleUrl: json['example_url'] as String,
  variant: json['variant'] as String,
  message: json['message'] as String,
  context: json['context'] as String,
  cta: CTA.fromJson(json['cta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
  'powered_by': instance.poweredBy,
  'docs_url': instance.docsUrl,
  'upgrade_url': instance.upgradeUrl,
  'example_url': instance.exampleUrl,
  'variant': instance.variant,
  'message': instance.message,
  'cta': instance.cta,
  'context': instance.context,
};

CTA _$CTAFromJson(Map<String, dynamic> json) =>
    CTA(label: json['label'] as String, url: json['url'] as String);

Map<String, dynamic> _$CTAToJson(CTA instance) => <String, dynamic>{
  'label': instance.label,
  'url': instance.url,
};
