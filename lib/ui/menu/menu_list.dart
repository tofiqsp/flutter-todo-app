import 'package:todo/todo.dart';

class MenuList extends StatelessWidget {
  const MenuList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          MenuListWidget(
            title: 'Lists',
            icon: Icons.category_rounded,
          ),
          SizedBox(height: 24),
          MenuListWidget(
            title: 'Templates',
            icon: Icons.design_services,
          ),
          SizedBox(height: 24),
          MenuListWidget(
            title: 'Analytics',
            icon: Icons.analytics_outlined,
          ),
        ],
      ),
    );
  }
}
