import 'package:todo/todo.dart';

class EtElevatedButton extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  final Color? backgroundColor;
  final bool? isLoading;
  final double? horizontalPadding;
  final double? verticalPadding;
  const EtElevatedButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.backgroundColor,
    this.isLoading,
    this.horizontalPadding,
    this.verticalPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        primary: Theme.of(context).primaryColor,
        onPrimary: Theme.of(context).textTheme.bodyLarge!.color,
        textStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        padding: EdgeInsets.symmetric(
          vertical: verticalPadding ?? 8,
          horizontal: horizontalPadding ?? 48,
        ),
      ),
      child: (isLoading != null && isLoading == true)
          ? CircularProgressIndicator(
              color: Theme.of(context).backgroundColor,
            )
          : Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
    );
  }
}
