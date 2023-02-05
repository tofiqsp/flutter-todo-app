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
          icon: Stack(
            children: [
              Icon(Icons.notifications_outlined),
              Container(
                width: 13,
                height: 13,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.5),
                  color: Colors.redAccent,
                  border: Border.all(
                    width: 2.5,
                    color: Get.theme.backgroundColor,
                  ),
                ),
              ),
            ],
          ),
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
