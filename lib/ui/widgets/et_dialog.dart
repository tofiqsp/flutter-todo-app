import 'package:todo/todo.dart';

class EtDialog extends StatelessWidget {
  const EtDialog({
    Key? key,
    this.title,
    this.content,
    this.ok,
    this.okOnPressed,
    this.cancel,
    this.cancelOnPressed,
    this.cancelColor,
  }) : super(key: key);
  final String? title;
  final String? content;
  final String? ok;
  final Function()? okOnPressed;
  final String? cancel;
  final Function()? cancelOnPressed;
  final Color? cancelColor;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AlertDialog(
        title: title != null ? Text(title!) : Container(),
        content: content != null ? Text(content!) : Container(),
        actions: [
          TextButton(
            onPressed: cancelOnPressed,
            child: cancel != null
                ? Text(
                    cancel!,
                    style: TextStyle(
                      color: cancelColor ?? Colors.black,
                    ),
                  )
                : Container(),
          ),
          TextButton(
            onPressed: okOnPressed,
            child: ok != null ? Text(ok!) : Container(),
          ),
        ],
      ),
    );
  }
}
