import 'package:flutter/material.dart';
import 'package:personal_work/home_view/view_model.dart';

import 'package:provider/provider.dart';

class TasksList extends StatefulWidget {
  const TasksList({Key? key}) : super(key: key);

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    var data = Provider.of<HomeViewModel>(context, listen: false);
    bool isChecked = false;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: Colors.grey.shade300,
      ),
      child: Provider.of<HomeViewModel>(context, listen: true).addTodo.isEmpty
          ? SizedBox(
              width: double.infinity,
              child: Center(
                child: Column(
                  children: [
                    const Text(
                      "No Todo yet",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    Image.asset(
                      "assets/images/no_todo.png",
                      height: 300,
                      width: 180,
                    ),
                  ],
                ),
              ),
            )
          : ListView.separated(
              shrinkWrap: true,
              itemCount: data.addTodo.length,
              itemBuilder: (context, index) => Container(
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        data.addTodo[index].title.toString(),
                        style: TextStyle(
                            decoration: data.isChecked
                                ? TextDecoration.lineThrough
                                : TextDecoration.none),
                      ),
                      Text(
                        data.addTodo[index].dueDate.toString(),
                        style: TextStyle(
                            decoration: data.isChecked
                                ? TextDecoration.lineThrough
                                : TextDecoration.none),
                      ),
                      Checkbox(
                          value: isChecked,
                          onChanged: (_) {
                            setState(() {
                              isChecked = !isChecked;
                            });
                            // newValue = data.isChecked;
                            // data.checkboxToggle(newValue);
                            // data.removeTodo(index);
                          })
                    ],
                  )),
              separatorBuilder: (context, index) => const Divider(
                height: 20,
              ),
            ),
    );
  }
}
