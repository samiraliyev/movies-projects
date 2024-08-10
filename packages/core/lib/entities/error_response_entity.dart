class ErrorResponseEntity {
  String? detail;
  String? error;

  ErrorResponseEntity({this.detail, this.error});
}

class ErrorResponseModel extends ErrorResponseEntity {
  ErrorResponseModel({super.detail, super.error});

  factory ErrorResponseModel.fromJson(Map<String, dynamic> json) {
    return ErrorResponseModel(
      detail: json['detail'],
      error: json['error'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['detail'] = detail;
    data['error'] = error;
    return data;
  }
}
