import 'package:todo/todo.dart';

class EtSettingCard extends StatelessWidget {
  final String titleRow;
  final IconData? iconRow;
  final Function()? onTap;
  final bool? isNavigate;

  const EtSettingCard({
    Key? key,
    required this.titleRow,
    this.iconRow,
    this.onTap,
    this.isNavigate,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(
                  iconRow,
                  color: Theme.of(context).primaryColor,
                  size: 16,
                ),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  titleRow,
                ),
                const Spacer(),
                isNavigate ?? false
                    ? const Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                      )
                    : Container()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
