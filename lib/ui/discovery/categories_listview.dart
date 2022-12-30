import 'package:todo/todo.dart';

class CategoriesListview extends StatelessWidget {
  const CategoriesListview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TodoController todoController = Get.find();
    return SizedBox(
      height: 120,
      child: Obx(
        () => ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: todoController.categories.length + 2,
          itemBuilder: (context, index) {
            Category cat = const Category();
            if (index < todoController.categories.length + 1 && index > 0) {
              cat = todoController.categories[index - 1];
            }
            return index == todoController.categories.length + 1
                ? const AddCategoryButton()
                : index == 0
                    ? GestureDetector(
                        onLongPress: () {
                          // TODO: Edit list name or delete
                          // TODO: Delete list and move todo to uncat or remove
                        },
                        onTap: () {
                          todoController.filterTodosToShowAll();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).canvasColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          margin: const EdgeInsets.only(right: 8),
                          padding: const EdgeInsets.all(16),
                          // height: 150,
                          width: 192,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 12,
                              ),
                              Text(
                                '${todoController.todos.length} tasks',
                                style: Theme.of(context).textTheme.caption,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                'All Tasks',
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              LinearProgressIndicator(
                                value: 0.3,
                                backgroundColor:
                                    Theme.of(context).backgroundColor,
                                minHeight: 3,
                              )
                            ],
                          ),
                        ),
                      )
                    : GestureDetector(
                        onLongPress: () {
                          // TODO: Edit list name or delete
                          // TODO: Delete list and move todo to uncat or remove
                        },
                        onTap: () {
                          todoController.filterTodosWithCategory(cat);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).canvasColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          margin: const EdgeInsets.only(right: 8),
                          padding: const EdgeInsets.all(16),
                          // height: 150,
                          width: 192,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 12,
                              ),
                              Text(
                                '${cat.numberOfTasks} tasks',
                                style: Theme.of(context).textTheme.caption,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                cat.title!,
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              LinearProgressIndicator(
                                value: cat.numberOfTasks != 0
                                    ? cat.numberOfDoneTasks! /
                                        cat.numberOfTasks!
                                    : 0,
                                backgroundColor:
                                    Theme.of(context).backgroundColor,
                                minHeight: 3,
                              )
                            ],
                          ),
                        ),
                      );
          },
        ),
      ),
    );
  }
}
