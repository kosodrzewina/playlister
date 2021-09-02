import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../stores/auth_store.dart';

class SearchField extends StatefulWidget {
  final String labelText;
  final Color accentColor;
  final ValueChanged<String> onSubmitted;
  final bool isEnabled;

  const SearchField({
    required this.labelText,
    required this.accentColor,
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
    return Observer(
      builder: (_) => TextField(
        enabled: context.read<AuthStore>().apiKey != null,
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
          fillColor: context.read<AuthStore>().apiKey != null
              ? Theme.of(context).cardColor
              : Theme.of(context).cardColor.withOpacity(0.3),
          filled: true,
          prefixIcon: Icon(
            Icons.search,
            color: _isFocused
                ? context.read<AuthStore>().apiKey != null
                    ? widget.accentColor
                    : widget.accentColor.withOpacity(0.3)
                : context.read<AuthStore>().apiKey != null
                    ? Theme.of(context).iconTheme.color!
                    : Theme.of(context).iconTheme.color!.withOpacity(0.3),
          ),
          labelStyle: TextStyle(
            color: context.read<AuthStore>().apiKey != null
                ? Theme.of(context).textTheme.bodyText1!.color!
                : Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .color!
                    .withOpacity(0.3),
          ),
          labelText: widget.labelText,
          floatingLabelBehavior: FloatingLabelBehavior.never,
        ),
        focusNode: _focusNode,
        cursorColor: widget.accentColor,
        onSubmitted: widget.onSubmitted,
      ),
    );
  }
}
