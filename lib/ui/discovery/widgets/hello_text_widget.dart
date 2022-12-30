import 'package:todo/todo.dart';

class HelloTextWidget extends StatelessWidget {
  const HelloTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'What\'s up Tofiq!',
      style: Theme.of(context).textTheme.headline1!.copyWith(
            fontSize: 28,
            color: Colors.white,
          ),
    );
  }
}
