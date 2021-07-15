import 'package:flutter/cupertino.dart';

class OptionsListItem extends StatefulWidget {
  final Icon icon;
  final String text;

  const OptionsListItem({
    required this.icon,
    required this.text,
  });

  @override
  _OptionsListItemState createState() => _OptionsListItemState(
        icon: icon,
        text: text,
      );
}

class _OptionsListItemState extends State<OptionsListItem> {
  final Icon icon;
  final String text;

  _OptionsListItemState({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 20),
        icon,
        const SizedBox(width: 20),
        Text(text),
      ],
    );
  }
}
