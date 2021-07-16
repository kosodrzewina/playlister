import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ApiKeyDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Theme.of(context).cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          Row(
            children: const [
              SizedBox(width: 10),
              Expanded(
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'API key',
                  ),
                ),
              ),
              SizedBox(width: 10),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

Future<void> showApiKeyDialog(BuildContext context) async {
  return await showDialog(
      context: context,
      builder: (context) {
        return ApiKeyDialog();
      });
}
