import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final Widget? appBarTitle;
  final List<Widget>? appBarActions;

  const AppScaffold({
    required this.body,
    this.appBarTitle,
    this.appBarActions,
    Key? key,
  }) : super(key: key);

  _appBar() => AppBar(
        title: appBarTitle ??
            const Text(
              'Todo',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
        actions: appBarActions ?? [],
        backgroundColor: Colors.black87,
      );

  @override
  Widget build(context) {
    return Scaffold(
      appBar: _appBar(),
      body: SafeArea(
        child: body,
      ),
    );
  }
}
