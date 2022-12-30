import 'package:todo/todo.dart';

class TitleSectionWidget extends StatelessWidget {
  const TitleSectionWidget({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleSmall,
    );
  }
}
