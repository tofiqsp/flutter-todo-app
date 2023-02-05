import 'package:todo/todo.dart';

class BackButtonMenu extends StatelessWidget {
  const BackButtonMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
        onPressed: () {
          ZoomDrawer.of(context)!.close();
        },
        highlightColor: Colors.transparent,
        icon: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            // color: Colors.transparent,
            border: Border.all(
              width: 1,
              color: Theme.of(context).backgroundColor,
            ),
          ),
          padding: const EdgeInsets.only(left: 6),
          child: const Center(
            child: Icon(
              Icons.arrow_back_ios,
              size: 15,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
