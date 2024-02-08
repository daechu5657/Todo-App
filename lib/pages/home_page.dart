import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:fluttertest/components/show_bottom_modal.dart';
import 'package:fluttertest/components/show_confirm_dialog.dart';
import 'package:fluttertest/widgets/app_scaffold.dart';

class CustomObject {
  final String a;
  final int b;

  CustomObject(this.a, this.b);
}

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> list = [];

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarActions: [
        IconButton(
          icon: const Icon(Icons.add),
          color: Colors.white,
          onPressed: () async {
            final result = await showBottomModal(context, '');

            if (result == null) {
              return;
            }

            setState(() {
              list.add({'task': result, 'isSelected': false});
            });
          },
        ),
      ],
      body: Center(
        child: ListView.separated(
          padding: const EdgeInsets.all(10),
          itemCount: list.length,
          separatorBuilder: (context, index) => const Divider(
            color: Colors.transparent,
            height: 10,
          ),
          itemBuilder: (context, index) {
            return SizedBox(
              height: 50,
              child: InkWell(
                onTap: () async {
                  final result =
                      await showBottomModal(context, list[index]['task']);

                  if (result != null) {
                    setState(() {
                      list[index]['task'] = result;
                      list[index]['isSelected'] = false;
                    });
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      color: list[index]['isSelected']
                          ? Colors.black12
                          : Colors.transparent),
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('${(list[index]['task'])}'),
                      SizedBox(
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.delete),
                              padding: EdgeInsets.zero,
                              onPressed: () async {
                                final result = await showConfirmDialog(context);

                                if (!result) {
                                  return;
                                }

                                setState(() {
                                  list.removeAt(index);
                                });
                              },
                            ),
                            Checkbox(
                              checkColor: Colors.black,
                              fillColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.transparent),
                              value: list[index]['isSelected'],
                              onChanged: (bool? value) {
                                setState(() {
                                  list[index]['isSelected'] = value!;
                                });
                              },
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
