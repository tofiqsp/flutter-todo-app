import 'package:todo/todo.dart';

class CommonStyle {
  static InputDecoration textFieldStyle(
      {String labelTextStr = "", String hintTextStr = ""}) {
    return InputDecoration(
      labelText: labelTextStr,
      hintText: hintTextStr,
      border: const OutlineInputBorder(
        borderSide: BorderSide(),
      ),
    );
  }

  static InputDecoration buttonFieldStyleInAppBar(BuildContext context,
      {String labelTextStr = "", String hintTextStr = ""}) {
    return InputDecoration(
      contentPadding: const EdgeInsets.fromLTRB(6, 2, 10, 2),
      fillColor: Colors.white,
      labelText: labelTextStr,
      hintText: hintTextStr,
      border: const OutlineInputBorder(
        borderSide: BorderSide(),
      ),
    );
  }

  static TextStyle inactiveTextStyle() {
    return const TextStyle(color: Colors.grey);
  }

  static TextStyle titleQuestionTextStyle() {
    return const TextStyle(fontWeight: FontWeight.w600, fontSize: 16);
  }

  static TextStyle titleMainTextStyle() {
    return const TextStyle(fontWeight: FontWeight.w600, fontSize: 18);
  }

  static TextStyle titleAnswerTextStyle() {
    return const TextStyle(fontWeight: FontWeight.w500, fontSize: 15);
  }
}
