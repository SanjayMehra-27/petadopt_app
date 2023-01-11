import 'package:flutter/material.dart';

class SquareIconWidget extends StatelessWidget {
  const SquareIconWidget({Key? key, required this.icon, this.onTab})
      : super(key: key);
  final IconData icon;
  final Function()? onTab;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Align(
        alignment: Alignment.center,
        child: IconButton(icon: Icon(icon), onPressed: onTab),
      ),
    );
  }
}
