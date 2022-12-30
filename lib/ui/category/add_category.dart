import 'package:todo/controllers/add_category_controller.dart';
import 'package:todo/todo.dart';

class AddCategory extends StatelessWidget {
  AddCategory({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    AddCategoryController addCategoryController =
        Get.put(AddCategoryController());
    TodoController todoController = Get.put(TodoController());
    return Scaffold(
      appBar: EtAppBar(
        title: 'Add Category',
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 24),
              child: Form(
                key: formKey,
                child: EtFormField(
                  autofocus: true,
                  controller: addCategoryController.category,
                  labelText: 'List',
                  validator: (value) =>
                      value!.isEmpty ? 'You have to enter a task first.' : null,
                  onChange: (value) {},
                  onFieldSubmitted: (s) {
                    if (formKey.currentState!.validate()) {
                      todoController.insertCategory(
                        Category(
                          title: addCategoryController.category.text,
                          created: DateTime.now(),
                          numberOfTasks: 0,
                        ),
                      );
                      Get.back();
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
