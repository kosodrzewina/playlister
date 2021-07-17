import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../l10n/l10n.dart';
import '../main.dart';
import '../widgets/text_button_icon.dart';

class ApiKeyDialog extends StatefulWidget {
  @override
  _ApiKeyDialogState createState() => _ApiKeyDialogState();
}

class _ApiKeyDialogState extends State<ApiKeyDialog> {
  final apiKeyTextFieldEditingController = TextEditingController()
    ..text = authStore.apiKey ?? '';

  @override
  void dispose() {
    apiKeyTextFieldEditingController.dispose();
    super.dispose();
  }

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
          const SizedBox(height: 20),
          Row(
            children: [
              const SizedBox(width: 20),
              Container(
                decoration: BoxDecoration(
                  color: authStore.apiKey == null ? Colors.red : Colors.green,
                  shape: BoxShape.circle,
                ),
                height: 10,
                width: 10,
              ),
              const SizedBox(width: 10),
              Text(
                authStore.apiKey == null
                    ? L10n.of(context)!.apiKeyDialog_apiKeyIsNotSaved
                    : L10n.of(context)!.apiKeyDialog_apiKeyIsSaved,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: L10n.of(context)!.apiKeyDialog_apiKey,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  controller: apiKeyTextFieldEditingController,
                  onSubmitted: (apiKey) {
                    if (apiKey.isNotEmpty) {
                      authStore.setApiKey(apiKey);
                      Fluttertoast.showToast(
                        msg: L10n.of(context)!.apiKeyDialog_apiKeySaved,
                      );
                    }

                    Navigator.pop(context);
                  },
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
          const SizedBox(height: 10),
          TextButtonIcon(
            icon: const Icon(Icons.delete),
            text: L10n.of(context)!.apiKeyDialog_removeApiKey,
            onTap: () {
              authStore.setApiKey(null);
              Fluttertoast.showToast(
                msg: L10n.of(context)!.apiKeyDialog_apiKeyRemoved,
              );
              Navigator.pop(context);
            },
          ),
          const SizedBox(height: 20),
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
    },
  );
}
