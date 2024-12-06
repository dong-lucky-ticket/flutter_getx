
class ResponseModal<T> {
  final T result;
  final String message;
  final bool success;
  final int code;
  ResponseModal({
    required this.result,
    required this.message,
    required this.success,
    required this.code,
  });
}
