import 'package:flutter/material.dart';

class ErrorWidget extends StatelessWidget {
  const ErrorWidget(this.errorText, {Key? key}) : super(key: key);

  final String errorText;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(errorText));
  }
}
