
import '../entities/response_entity.dart';

class ResponseModel<T> extends ResponseEntity {
  ResponseModel({
    super.message,
    super.data,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
        message: json['message'],
        data: json['data'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['data'] = this.data;
    return data;
  }
}