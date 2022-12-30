import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo/todo.dart';

class TodosListview extends StatelessWidget {
  const TodosListview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TodoController todoController = Get.find();
    return Obx(
      () => ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: todoController.filteredTodos.length + 1,
        itemBuilder: (context, index) {
          // ignore: prefer_typing_uninitialized_variables
          var todo;
          if (index < todoController.filteredTodos.length) {
            todo = todoController.filteredTodos[index];
          }
          return index == todoController.filteredTodos.length
              ? const SizedBox(
                  height: 80,
                )
              : GestureDetector(
                  onTap: () {
                    todoController.toggleIsDoneTodo(todo);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).canvasColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Slidable(
                      key: ValueKey(index),
                      endActionPane: ActionPane(
                        motion: ScrollMotion(),
                        extentRatio: 0.2,
                        children: [
                          SlidableAction(
                            onPressed: (c) {
                              todoController.deleteTodo(todo);
                            },
                            backgroundColor: Colors.redAccent,
                            foregroundColor: Colors.white,
                            icon: Icons.delete_outline,
                            label: 'Delete',
                            borderRadius: BorderRadius.circular(10),
                            autoClose: true,
                            padding: EdgeInsets.symmetric(horizontal: 4),
                          ),
                        ],
                      ),
                      child: ListTile(
                        onTap: null,
                        title: AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 200),
                          style: todo.isDone!
                              ? const TextStyle(
                                  fontStyle: FontStyle.italic,
                                  decoration: TextDecoration.lineThrough,
                                )
                              : const TextStyle(),
                          child: Text(
                            todo.title!,
                          ),
                        ),
                        trailing: Text('${todo.category.title!}'),
                        leading: SizedBox(
                          width: 44,
                          height: 44,
                          child: Center(
                            child: todo.isDone!
                                ? SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          left: 5,
                                          top: 5,
                                          child: Container(
                                            height: 15,
                                            width: 15,
                                            color:
                                                Theme.of(context).canvasColor,
                                          ),
                                        ),
                                        Icon(
                                          Icons.check_box,
                                          color:
                                              Theme.of(context).backgroundColor,
                                        ),
                                      ],
                                    ),
                                  )
                                : Icon(
                                    Icons.circle_outlined,
                                    color: Theme.of(context).primaryColor,
                                  ),
                          ),
                        ),
                        // trailing: Text(todo.id!),
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }
}
