import 'dart:async';
import 'package:flutter/material.dart';
import 'extention.dart';

class FutureOrBuilder<T> extends StatefulWidget {
  final T? initialData;
  final FutureOr<T>? futureOr;
  final AsyncWidgetBuilder<T> builder;

  const FutureOrBuilder(
      {Key? key, this.futureOr, required this.builder, this.initialData})
      : super(key: key);

  @override
  FutureOrBuilderState createState() => FutureOrBuilderState<T>();
}

class FutureOrBuilderState<T> extends State<FutureOrBuilder<T>> {
  @override
  Widget build(BuildContext context) {
    if (widget.futureOr == null) {
      return widget.builder(
        context,
        AsyncSnapshot.withData(ConnectionState.done, const SizedBox() as T),
      );
    } else if (widget.futureOr!.isNotFuture) {
      return widget.builder(
        context,
        AsyncSnapshot.withData(ConnectionState.done, widget.futureOr!.value),
      );
    }
    return FutureBuilder<T>(
      initialData: widget.initialData,
      future: widget.futureOr?.asFuture,
      builder: widget.builder,
    );
  }
}
