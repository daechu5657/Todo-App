import 'package:flutter/material.dart';

Future<String?> showBottomModal(BuildContext context, String? value) async {
  TextEditingController textController = TextEditingController(text: value);

  final result = await showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SizedBox(
          height: 180,
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: () {
              Form.of(primaryFocus!.context!).save();
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
                    child: TextFormField(
                      controller: textController,
                      decoration: const InputDecoration(
                        labelText: "Task name",
                        border: OutlineInputBorder(),
                        hintText: 'Input task',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some task.';
                        }
                        return null;
                      },
                      onTapOutside: (event) =>
                          FocusManager.instance.primaryFocus?.unfocus(),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(null);
                        },
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          if (textController.text.isEmpty) {
                            return;
                          }

                          Navigator.of(context).pop(textController.text);
                        },
                        child: const Text('Save'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
    },
  );

  return result;
}
