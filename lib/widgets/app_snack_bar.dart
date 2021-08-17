import 'package:flutter/material.dart';

class AppSnackBar extends SnackBar {
  AppSnackBar.success({
    Key? key,
    required Widget content,
    SnackBarAction? action,
  }) : super(
          key: key,
          content: Row(
            children: [
              const Icon(Icons.check_circle),
              const SizedBox(width: 8),
              content,
            ],
          ),
          action: action,
          backgroundColor: Colors.green[300],
        );

  AppSnackBar.info({
    Key? key,
    required Widget content,
    SnackBarAction? action,
  }) : super(
          key: key,
          content: Row(
            children: [
              const Icon(Icons.info),
              const SizedBox(width: 8),
              content,
            ],
          ),
          action: action,
          backgroundColor: Colors.blue[300],
        );

  AppSnackBar.warning({
    Key? key,
    required Widget content,
    SnackBarAction? action,
  }) : super(
          key: key,
          content: Row(
            children: [
              const Icon(Icons.warning),
              const SizedBox(width: 8),
              content,
            ],
          ),
          action: action,
          backgroundColor: Colors.orange[300],
        );

  AppSnackBar.error({
    Key? key,
    required Widget content,
    SnackBarAction? action,
  }) : super(
          key: key,
          content: Row(
            children: [
              const Icon(Icons.error),
              const SizedBox(width: 8),
              content,
            ],
          ),
          action: action,
          backgroundColor: Colors.red[300],
        );
}
