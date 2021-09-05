import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../l10n/l10n.dart';
import '../stores/auth_store.dart';
import '../widgets/app_snack_bar.dart';
import '../widgets/icon_text_button.dart';

class ApiKeyDialog extends StatefulWidget {
  final GlobalKey<ScaffoldMessengerState> profileScaffoldMessengerKey;

  const ApiKeyDialog({required this.profileScaffoldMessengerKey});

  @override
  _ApiKeyDialogState createState() => _ApiKeyDialogState();
}

class _ApiKeyDialogState extends State<ApiKeyDialog> {
  final apiKeyTextFieldEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    apiKeyTextFieldEditingController.text =
        context.read<AuthStore>().apiKey ?? '';
  }

  @override
  void dispose() {
    apiKeyTextFieldEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),
          Row(
            children: [
              const SizedBox(width: 20),
              Container(
                decoration: BoxDecoration(
                  color: context.read<AuthStore>().apiKey == null
                      ? Colors.red
                      : Colors.green,
                  shape: BoxShape.circle,
                ),
                height: 10,
                width: 10,
              ),
              const SizedBox(width: 10),
              Text(
                context.read<AuthStore>().apiKey == null
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
                  ),
                  controller: apiKeyTextFieldEditingController,
                  onSubmitted: (apiKey) {
                    if (apiKey.isNotEmpty) {
                      context.read<AuthStore>().setApiKey(apiKey);

                      widget.profileScaffoldMessengerKey.currentState!
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                          AppSnackBar.success(
                            content: Text(
                              L10n.of(context)!.apiKeyDialog_apiKeySaved,
                            ),
                          ),
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
          Observer(builder: (_) {
            final isApiKey = context.read<AuthStore>().apiKey != null;

            return IconTextButton(
              icon: isApiKey
                  ? const Icon(Icons.delete)
                  : Icon(
                      Icons.delete,
                      color:
                          Theme.of(context).iconTheme.color!.withOpacity(0.3),
                    ),
              onPressed: isApiKey
                  ? () {
                      context.read<AuthStore>().setApiKey(null);

                      widget.profileScaffoldMessengerKey.currentState!
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                          AppSnackBar.success(
                            content: Text(
                              L10n.of(context)!.apiKeyDialog_apiKeyRemoved,
                            ),
                          ),
                        );

                      Navigator.pop(context);
                    }
                  : null,
              child: isApiKey
                  ? Text(L10n.of(context)!.apiKeyDialog_removeApiKey)
                  : Text(
                      L10n.of(context)!.apiKeyDialog_removeApiKey,
                      style: TextStyle(
                        color: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .color!
                            .withOpacity(0.3),
                      ),
                    ),
            );
          }),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

Future<void> showApiKeyDialog(
  BuildContext context,
  GlobalKey<ScaffoldMessengerState> profileScaffoldMessengerKey,
) async {
  return await showDialog(
    context: context,
    builder: (context) {
      return ApiKeyDialog(
        profileScaffoldMessengerKey: profileScaffoldMessengerKey,
      );
    },
  );
}
