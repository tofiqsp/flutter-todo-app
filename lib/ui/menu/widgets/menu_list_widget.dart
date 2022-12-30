import 'package:todo/todo.dart';

class MenuListWidget extends StatelessWidget {
  const MenuListWidget({Key? key, required this.title, this.icon, this.onTap})
      : super(key: key);
  final IconData? icon;
  final String? title;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          icon != null
              ? Icon(
                  icon,
                  color: Theme.of(context).backgroundColor,
                )
              : const SizedBox(width: 25),
          const SizedBox(width: 16),
          Text(
            title!,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
