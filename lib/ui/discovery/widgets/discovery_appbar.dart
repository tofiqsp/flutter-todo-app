import 'package:todo/todo.dart';

class DiscoveryAppbar extends StatelessWidget implements PreferredSizeWidget {
  const DiscoveryAppbar({
    Key? key,
  }) : super(key: key);
  @override
  final preferredSize = const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    TodoController todoController = Get.find();
    return EtAppBar(
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
          highlightColor: Colors.transparent,
        ),
        IconButton(
          onPressed: () {
            todoController.deleteDatabase('todo_database.db');
          },
          icon: const Icon(Icons.notifications_outlined),
          highlightColor: Colors.transparent,
        ),
      ],
      leading: IconButton(
        onPressed: () {
          ZoomDrawer.of(context)!.toggle();
        },
        icon: const Icon(Icons.menu),
        highlightColor: Colors.transparent,
      ),
    );
  }
}
