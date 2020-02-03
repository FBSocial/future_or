import 'dart:async' show FutureOr;

///
/// contains extensions methods for FutureOr
///
extension FutureOrTools<T> on FutureOr<T> {
  ///
  /// returns true if [this] is of type [Future<T>]
  ///
  bool get isFuture => !isNotFuture;

  ///
  /// returns true if [this] is a value of type [T]
  ///
  bool get isNotFuture => this is! Future;

  ///
  /// If [this] is not a value than a cast exception is going to be thrown
  ///
  T get value => this as T;

  ///
  /// If [this] is not a Future than a cast exception is going to be thrown
  /// for a safer alternative use [asFuture]
  ///
  Future<T> get future => this as Future<T>;

  ///
  /// will return a future version of [this]
  ///
  Future<T> get asFuture => isFuture ? this : Future.value(this);
}
