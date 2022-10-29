import 'package:flutter/material.dart';
import 'package:personal_work/components/list_tasks.dart';
import 'package:personal_work/components/new_todo.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future getUsers() async {
    var response =
        await http.get(Uri.parse('https://gorest.co.in/public/v2/users'));
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    print("**** new page");

    return Scaffold(
      appBar: AppBar(
        title: const Text("Demo project"),
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(height: 20),
            // AddNewTodo(),
            SizedBox(height: 20),
            TasksList(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        isExtended: true,
        child: const Text("add"),
        onPressed: () {
          getUsers();
          showModalBottomSheet(
            backgroundColor: Colors.transparent,
            context: context,
            builder: (_) => const AddNewTodo(),
          );
        },
      ),
    );
  }
}
