// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exception.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatchException _$CatchExceptionFromJson(Map<String, dynamic> json) =>
    CatchException(
      message: json['message'] as String,
      statusCode: json['statusCode'] as int,
    );

Map<String, dynamic> _$CatchExceptionToJson(CatchException instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statusCode': instance.statusCode,
    };
