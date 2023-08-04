// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'exception.g.dart';

@JsonSerializable()
class CatchException {
  String message;
  int statusCode;

  CatchException({
    required this.message,
    required this.statusCode,
  });

  factory CatchException.fromJson(Map<String, dynamic> json) =>
      _$CatchExceptionFromJson(json);
  Map<String, dynamic> toJson() => _$CatchExceptionToJson(this);
}
