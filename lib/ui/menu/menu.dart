import 'package:todo/todo.dart';


class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 48),
        child: Stack(
          children: [
            const BackButtonMenu(),
            const ProfileImage(),
            Positioned(
              top: 160,
              left: 16,
              child: Text(
                'Tofiq Samali',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const MenuList(),
            const ConsistencyWidget(),
          ],
        ),
      ),
    );
  }
}
