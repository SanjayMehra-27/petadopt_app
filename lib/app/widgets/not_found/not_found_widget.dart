import 'package:flutter/material.dart';

class NotFoundWidget extends StatelessWidget {
  const NotFoundWidget({Key? key, this.title, this.style}) : super(key: key);
  final String? title;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title ?? "No pets found!",
        style: style ?? TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
      ),
    );
  }
}
