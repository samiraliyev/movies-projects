abstract class CommonResponseEntity<T> {
  final T? data;
  final String? message;

  CommonResponseEntity({this.data, this.message});
}
