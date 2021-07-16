import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OptionsListItem extends StatefulWidget {
  final Icon icon;
  final String text;
  final Function() onTap;

  const OptionsListItem({
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  _OptionsListItemState createState() => _OptionsListItemState();
}

class _OptionsListItemState extends State<OptionsListItem> {
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: widget.onTap,
        borderRadius: BorderRadius.circular(15),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              children: [
                const SizedBox(width: 20),
                widget.icon,
                const SizedBox(width: 20),
                Text(widget.text),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
