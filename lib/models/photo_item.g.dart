// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PhotoItem _$_$_PhotoItemFromJson(Map<String, dynamic> json) {
  return _$_PhotoItem(
    path: json['path'] as String,
    createDateTime: DateTime.parse(json['create_date_time'] as String),
  );
}

Map<String, dynamic> _$_$_PhotoItemToJson(_$_PhotoItem instance) =>
    <String, dynamic>{
      'path': instance.path,
      'create_date_time': instance.createDateTime.toIso8601String(),
    };
