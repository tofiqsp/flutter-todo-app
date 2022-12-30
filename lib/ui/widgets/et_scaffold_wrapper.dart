import 'package:todo/todo.dart';

class EtScaffoldWrapper extends StatelessWidget {
  const EtScaffoldWrapper({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: child,
      ),
    );
  }
}
