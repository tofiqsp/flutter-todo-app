import 'package:todo/todo.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 70,
      left: 32,
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          border: Border.all(
            width: 2,
            color: Theme.of(context).primaryColor,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(37),
            border: Border.all(
              width: 3,
              color: Colors.transparent,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              color: Theme.of(context).backgroundColor,
            ),
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(35),
                child: Image.asset('images/me.jpg'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
