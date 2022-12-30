import 'package:todo/todo.dart';

class EtAppBar extends StatelessWidget implements PreferredSizeWidget {
  const EtAppBar(
      {Key? key, this.scaffoldKey, this.title, this.leading, this.actions})
      : super(key: key);
  @override
  final preferredSize = const Size.fromHeight(kToolbarHeight);
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final String? title;
  final List<Widget>? actions;
  final Widget? leading;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title != null
          ? Text(
              title!,
              style: Theme.of(context).textTheme.titleMedium,
            )
          : null,
      // flexibleSpace: Opacity(
      //   opacity: 0.75,
      //   child: Image.asset(
      //     'images/slim.png',
      //     fit: BoxFit.cover,
      //   ),
      // ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      iconTheme: IconThemeData(
        color: Colors.white.withAlpha(150), //change your color here
      ),
      elevation: 0,
      centerTitle: false,
      actions: actions,
      leading: leading,
    );
  }
}
