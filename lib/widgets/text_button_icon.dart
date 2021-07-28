import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextButtonIcon extends StatefulWidget {
  final Icon icon;
  final String text;
  final Function() onPressed;

  const TextButtonIcon({
    required this.icon,
    required this.text,
    required this.onPressed,
  });

  @override
  _TextButtonIconState createState() => _TextButtonIconState();
}

class _TextButtonIconState extends State<TextButtonIcon> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.onPressed,
      child: Row(
        children: [
          const SizedBox(width: 10),
          widget.icon,
          const SizedBox(width: 10),
          Text(
            widget.text,
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
