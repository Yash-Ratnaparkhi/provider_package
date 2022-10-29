import 'package:flutter/material.dart';
import 'package:personal_work/home_view/view_model.dart';
import 'package:personal_work/widgets/text_field.dart';
import 'package:provider/provider.dart';

class AddNewTodo extends StatelessWidget {
  const AddNewTodo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController dueDateController = TextEditingController();
    return Container(
      height: 250,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: Colors.grey.shade400,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextInputField(controller: titleController, label: "Title"),
          const SizedBox(height: 20),
          TextInputField(controller: dueDateController, label: "Due date"),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: ElevatedButton(
              child: const SizedBox(
                width: double.infinity,
                child: Center(
                  child: Text(
                    "Add",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              onPressed: () {
                Provider.of<HomeViewModel>(context, listen: false)
                    .addNewTodo(titleController.text, dueDateController.text);
                titleController.clear();
                dueDateController.clear();
                Navigator.pop(context);
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
