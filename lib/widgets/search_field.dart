import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {
  final String labelText;
  final Icon icon;
  final Color fillColor;
  final Color accentColor;
  final TextStyle? labelStyle;
  final ValueChanged<String> onSubmitted;
  final bool isEnabled;

  const SearchField({
    required this.labelText,
    required this.icon,
    required this.fillColor,
    required this.accentColor,
    this.labelStyle,
    required this.onSubmitted,
    this.isEnabled = true,
  });

  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final FocusNode _focusNode = FocusNode();
  var _isFocused = false;

  @override
  void initState() {
    _focusNode
        .addListener(() => setState(() => _isFocused = _focusNode.hasFocus));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: widget.isEnabled,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide.none,
        ),
        fillColor: Theme.of(context).cardColor,
        filled: true,
        prefixIcon: Icon(
          widget.icon.icon,
          color: _isFocused ? widget.accentColor : widget.icon.color,
        ),
        labelText: widget.labelText,
        labelStyle: widget.labelStyle,
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
      focusNode: _focusNode,
      cursorColor: widget.accentColor,
      onSubmitted: widget.onSubmitted,
    );
  }
}
