import 'dart:async' show FutureOr;

extension FutureOrTools<T> on FutureOr<T> {
  bool get isFuture => !isNotFuture;

  bool get isNotFuture => this is! Future;

  T get value => this as T;

  Future<T> get future => this as Future<T>;

  Future<T> get asFuture => isFuture ? this : Future.value(this);
}
