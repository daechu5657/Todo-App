import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Pretendard',
      ),
      home: const TodoScreen(),
    );
  }
}

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  TodoScreenState createState() => TodoScreenState();
}

class TodoScreenState extends State<TodoScreen> {
  List<String> todoItems = [];

  _appBar() => AppBar(
        backgroundColor: Colors.black87,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          color: Colors.white,
          onPressed: () {},
        ),
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
              _showDialog(context);
            },
          ),
        ],
      );

  _divider() => const Divider(
        color: Colors.transparent,
        height: 10,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.all(10),
          itemCount: todoItems.length,
          separatorBuilder: (context, index) => _divider(),
          itemBuilder: (context, index) {
            // return ListTile(
            //   title: Text(todoItems[index]),
            //   tileColor: Colors.amber,
            //   contentPadding: EdgeInsets.all(10),
            // );

            return Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          todoItems[index],
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const CreateCheckBox(),
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

  void _showDialog(BuildContext context) {
    TextEditingController textController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('할일 넣으셈'),
          content: TextField(
            controller: textController,
            onChanged: (value) {},
            decoration: const InputDecoration(hintText: "입력하셈"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('끄셈'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  todoItems.add(textController.text);
                });
                Navigator.of(context).pop();
              },
              child: const Text('저장하셈'),
            ),
          ],
        );
      },
    );
  }
}

class CreateCheckBox extends StatefulWidget {
  const CreateCheckBox({super.key});

  @override
  State<CreateCheckBox> createState() => _CreateCheckBoxState();
}

class _CreateCheckBoxState extends State<CreateCheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };

      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }

      return Colors.black38;
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}
