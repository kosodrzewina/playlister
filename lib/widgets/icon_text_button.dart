import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconTextButton extends StatefulWidget {
  final Icon icon;
  final Text text;
  final VoidCallback? onPressed;
  final bool matchParent;

  const IconTextButton({
    required this.icon,
    required this.text,
    required this.onPressed,
    this.matchParent = false,
  });

  @override
  _IconTextButtonState createState() => _IconTextButtonState();
}

class _IconTextButtonState extends State<IconTextButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.onPressed,
      child: Row(
        mainAxisSize: widget.matchParent ? MainAxisSize.max : MainAxisSize.min,
        children: [
          const SizedBox(width: 10),
          widget.icon,
          const SizedBox(width: 10),
          widget.text,
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
