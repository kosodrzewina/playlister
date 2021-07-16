import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../l10n/l10n.dart';
import '../main.dart';
import '../widgets/options_list_item.dart';

class ApiKeyDialog extends StatelessWidget {
  final apiKeyIndicatorColor =
      authStore.apiKey == null ? Colors.red : Colors.green;
  final apiKeyIndicatorText = authStore.apiKey == null
      ? L10nStrings.apiKeyDialog_apiKeyIsNotSaved
      : L10nStrings.apiKeyDialog_apiKeyIsSaved;
  final TextEditingController apiKeyTextFieldEditingController =
      TextEditingController()..text = authStore.apiKey ?? '';

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
                  color: apiKeyIndicatorColor,
                  shape: BoxShape.circle,
                ),
                height: 10,
                width: 10,
              ),
              const SizedBox(width: 10),
              Text(apiKeyIndicatorText.tr(context)),
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
          OptionsListItem(
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
      });
}
