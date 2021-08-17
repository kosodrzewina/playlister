import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {
  final String labelText;
  final Color accentColor;
  final Function(String) onSubmitted;

  const SearchField({
    required this.labelText,
    required this.accentColor,
    required this.onSubmitted,
  });

  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final FocusNode _focusNode = FocusNode();
  var _isFocused = false;

  @override
  void initState() {
    _focusNode.addListener(() => setState(() => _isFocused = !_isFocused));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
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
          Icons.search,
          color: _isFocused
              ? widget.accentColor
              : Theme.of(context).iconTheme.color,
        ),
        labelText: widget.labelText,
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
      focusNode: _focusNode,
      cursorColor: widget.accentColor,
      onSubmitted: widget.onSubmitted,
    );
  }
}
