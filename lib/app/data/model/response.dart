
class ResponseModal<T> {
  final T? result;
  final String message;
  final bool success;
  final int code;
  ResponseModal({
    this.result,
    required this.message,
    required this.success,
    required this.code,
  });

  factory ResponseModal.fromMap(
    Map<String, dynamic> map,
    T Function(Map<String, dynamic> map) fromMapT,
  ) {
    return ResponseModal(
      result: map['result']!= null? fromMapT(map['result']) : null,
      message: map['message'],
      success: map['success'],
      code: map['code'],
    );
  }
}
