import 'package:flutter/material.dart';

void showBottomModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return SizedBox(
          height: 100,
          child: Container(
            padding: EdgeInsets.all(16),
            child: Text('asdasd'),
          ));
    },
  );
}
