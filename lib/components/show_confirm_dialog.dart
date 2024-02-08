import 'package:flutter/material.dart';

Future<bool> showConfirmDialog(context) async {
  return await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('This task will be deleted'),
            content: const Text('Are you sure?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text('Close'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: const Text('Delete'),
              )
            ],
          );
        },
      ) ??
      false;
}
