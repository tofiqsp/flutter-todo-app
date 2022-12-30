import 'package:todo/todo.dart';

class AddTodo extends StatelessWidget {
  AddTodo({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    AddTodoController addTodoController = Get.put(AddTodoController());
    TodoController todoController = Get.put(TodoController());
    return Scaffold(
      appBar: EtAppBar(
        title: 'Add Task',
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  EtFormField(
                    controller: addTodoController.task,
                    labelText: 'Task',
                    validator: (value) => value!.isEmpty
                        ? 'You have to enter a task first.'
                        : null,
                    onChange: (value) {},
                    autofocus: true,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  // GestureDetector(
                  //   onTap: () async {
                  //     var a = await showDatePicker(
                  //       context: context,
                  //       initialDate: DateTime.now(),
                  //       firstDate: DateTime.now(),
                  //       lastDate: DateTime.now().add(
                  //         Duration(days: 365 * 5),
                  //       ),
                  //       builder: (context, child) {
                  //         return child!;
                  //       },
                  //     );
                  //     debugPrint(a.toString());
                  //     addTodoController.selectedDate.value = a;
                  //   },
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(10.0),
                  //     child: Row(
                  //       children: [
                  //         Icon(Icons.date_range),
                  //         SizedBox(
                  //           width: 16,
                  //         ),
                  //         Obx(
                  //           () => Text(
                  //             addTodoController.selectedDate.value
                  //                 .toString()
                  //                 .split(' ')
                  //                 .first,
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // GestureDetector(
                  //   onTap: () async {
                  //     var a = await showTimePicker(
                  //       context: context,
                  //       initialTime: TimeOfDay.now(),
                  //       builder: (context, child) {
                  //         return Theme(
                  //           data: Theme.of(context).copyWith(
                  //             colorScheme: ColorScheme.dark(
                  //               primary: Theme.of(context).canvasColor,
                  //               onPrimary: Colors.white, // header text color
                  //               onSurface: Colors.white, // body text color
                  //               surface: Theme.of(context).backgroundColor,
                  //               background: Theme.of(context).backgroundColor,
                  //             ),
                  //             textButtonTheme: TextButtonThemeData(
                  //               style: TextButton.styleFrom(
                  //                 primary: Theme.of(context)
                  //                     .colorScheme
                  //                     .secondary, // button text color
                  //               ),
                  //             ),
                  //           ),
                  //           child: child!,
                  //         );
                  //       },
                  //     );
                  //     debugPrint(a.toString());
                  //     addTodoController.selectedTime.value = a;
                  //   },
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(10.0),
                  //     child: Row(
                  //       children: [
                  //         Icon(Icons.more_time),
                  //         SizedBox(
                  //           width: 16,
                  //         ),
                  //         Obx(
                  //           () => Text(
                  //             '${addTodoController.selectedTime.value!.hour}:${addTodoController.selectedTime.value!.minute}',
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  Row(
                    children: [
                      Text('Select List: '),
                      SizedBox(
                        width: 16,
                      ),
                      Obx(
                        () => DropdownButton<Category>(
                          items: addTodoController.dropdownItems,
                          onChanged: (value) {
                            addTodoController.initialDropDownVal.value = value!;
                          },
                          value: addTodoController.initialDropDownVal.value,
                        ),
                      ),
                    ],
                  )
                  // EtFormField(
                  //   labelText: 'Password',
                  //   validator: (value) => value!.isEmpty
                  //       ? 'You have to enter a valide password.'
                  //       : null,
                  //   onSaved: (value) => description = value,
                  //   isPassword: true,
                  // ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 24),
              child: EtElevatedButton(
                verticalPadding: 16,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    var d =
                        addTodoController.selectedDate.value ?? DateTime.now();
                    var t =
                        addTodoController.selectedTime.value ?? TimeOfDay.now();
                    todoController.insertTodo(
                      Todo(
                        isDone: false,
                        category: addTodoController.initialDropDownVal.value,
                        title: addTodoController.task.text,
                        created: DateTime.now(),
                        // milestone:
                        //     DateTime(d.year, d.month, d.day, t.hour, t.minute),
                      ),
                    );
                    Get.back();
                  }
                },
                title: 'Save',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
