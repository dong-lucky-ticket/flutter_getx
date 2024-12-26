

abstract class Callable {

  Callable();

  factory Callable.fromMap(Map<String, dynamic> map) {
    throw UnimplementedError('You must implement a factory constructor.');
  }

  // Callable fromMap(Map<String, dynamic> map);

  Map<String, dynamic> toMap();
}