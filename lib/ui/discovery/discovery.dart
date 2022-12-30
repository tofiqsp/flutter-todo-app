import 'package:todo/todo.dart';

class Discovery extends StatelessWidget {
  const Discovery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TodoController todoController = Get.put(TodoController());
    return ZoomDrawer(
      controller: z,
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
            Get.to(() => AddTodo());
          },
          tooltip: 'Add a todo',
          backgroundColor: Theme.of(context).primaryColor,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
