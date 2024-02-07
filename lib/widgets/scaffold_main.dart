import 'package:flutter/material.dart';
import 'package:fluttertest/components/show_bottom_modal.dart';

class ScaffoldMain extends StatelessWidget {
  const ScaffoldMain({
    required this.body,
    Key? key,
  }) : super(key: key);

  final Widget body;

  _appBar(BuildContext context) => AppBar(
        title: const Text(
          'Todo',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            color: Colors.white,
            onPressed: () {
              showBottomModal(context);
            },
          ),
        ],
        backgroundColor: Colors.black87,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: SafeArea(
        child: body,
      ),
    );
  }
}
