import 'dart:async';
import 'package:flutter/material.dart';
import 'extention.dart';

class FutureOrBuilder<T> extends StatefulWidget {
  final T? initialData;
  final FutureOr<T> futureOr;
  final AsyncWidgetBuilder<T> builder;

  const FutureOrBuilder(
      {Key? key,required this.futureOr, required this.builder, this.initialData})
      : super(key: key);

  @override
  _FutureOrBuilderState createState() => _FutureOrBuilderState<T>();
}

class _FutureOrBuilderState<T> extends State<FutureOrBuilder<T>> {
  @override
  Widget build(BuildContext context) {
    if (widget.futureOr.isNotFuture)
      return widget.builder(
        context,
        AsyncSnapshot.withData(ConnectionState.done, widget.futureOr.value),
      );
    return FutureBuilder<T>(
      initialData: widget.initialData,
      future: widget.futureOr.asFuture as Future<T>,
      builder: widget.builder,
    );
  }
}
