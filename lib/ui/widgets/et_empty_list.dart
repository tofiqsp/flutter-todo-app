import 'package:todo/todo.dart';

class EtEmptyList extends StatelessWidget {
  const EtEmptyList({
    Key? key,
    required this.title,
    this.icon,
  }) : super(key: key);
  final String title;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.redAccent,
          ),
         const SizedBox(
            height: 16,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
