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
  var _currentColor = Colors.white;

  @override
  void initState() {
    _focusNode.addListener(() {
      setState(() {
        _currentColor = _currentColor == widget.accentColor
            ? Colors.white
            : widget.accentColor;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        fillColor: Colors.grey[800],
        focusColor: Colors.amber,
        filled: true,
        prefixIcon: Icon(
          Icons.search,
          color: _currentColor,
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
