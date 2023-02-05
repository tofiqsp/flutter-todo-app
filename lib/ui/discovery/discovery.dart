import 'package:todo/todo.dart';

class Discovery extends StatelessWidget {
  Discovery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TodoController todoController = Get.put(TodoController());

    return ZoomDrawer(
      controller: todoController.z,
      menuBackgroundColor: Theme.of(context).canvasColor,
      angle: 0,
      menuScreen: const MenuScreen(),
      mainScreen: Scaffold(
        appBar: const DiscoveryAppbar(),
        body: SingleChildScrollView(
          child: Obx(
            (() => Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // HelloTextWidget(),
                      // SizedBox(height: 32),
                      TitleSectionWidget(title: 'LISTS'),
                      SizedBox(height: 8),
                      CategoriesListview(),
                      SizedBox(height: 32),
                      TitleSectionWidget(title: 'TASKS'),
                      todoController.filteredTodos.isNotEmpty
                          ? todoController.isLoading.value
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : TodosListview()
                          : const Center(
                              child: Text(
                                'You have no todo to do :)',
                              ),
                            ),
                    ],
                  ),
                )),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(
              () => AddTodo(),
              transition: Transition.downToUp,
              duration: Duration(milliseconds: 250),
            );
            // final formKey = GlobalKey<FormState>();
            // AddTodoController addTodoController = Get.put(AddTodoController());
            // TodoController todoController = Get.put(TodoController());
            // final focusNode = FocusNode();

            // Get.bottomSheet(
            //   Container(
            //     color: Get.theme.backgroundColor,
            //     padding: const EdgeInsets.all(16.0),
            //     child: Form(
            //       key: formKey,
            //       child: Row(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         mainAxisAlignment: MainAxisAlignment.start,
            //         children: <Widget>[
            //           Expanded(
            //             child: EtFormField(
            //               focusNode: focusNode,
            //               controller: addTodoController.task,
            //               labelText: 'Task',
            //               validator: (value) => value!.isEmpty
            //                   ? 'You have to enter a task first.'
            //                   : null,
            //               onChange: (value) {},
            //               autofocus: true,
            //               onEditingComplete: () {},
            //               onFieldSubmitted: (value) {
            //                 if (formKey.currentState!.validate()) {
            //                   todoController.insertTodo(
            //                     Todo(
            //                       isDone: false,
            //                       category: addTodoController
            //                           .initialDropDownVal.value,
            //                       title: addTodoController.task.text,
            //                       created: DateTime.now(),
            //                     ),
            //                   );
            //                   Get.back();
            //                 }
            //               },
            //             ),
            //           ),
            //           const SizedBox(
            //             width: 8,
            //           ),

            //           GestureDetector(
            //             onTap: () {},
            //             child: Obx(
            //               () => DropdownButton<Category>(
            //                 items: addTodoController.dropdownItems,
            //                 onChanged: (value) {
            //                   addTodoController.initialDropDownVal.value =
            //                       value!;
            //                 },
            //                 value: addTodoController.initialDropDownVal.value,
            //               ),
            //             ),
            //           ),
            //           // EtFormField(
            //           //   labelText: 'Password',
            //           //   validator: (value) => value!.isEmpty
            //           //       ? 'You have to enter a valide password.'
            //           //       : null,
            //           //   onSaved: (value) => description = value,
            //           //   isPassword: true,
            //           // ),
            //         ],
            //       ),
            //     ),
            //   ),
            // );
          },
          tooltip: 'Add a todo',
          backgroundColor: Theme.of(context).primaryColor,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
