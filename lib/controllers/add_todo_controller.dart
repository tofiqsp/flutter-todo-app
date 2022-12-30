import 'package:todo/todo.dart';

class AddTodoController extends GetxController {
  TodoController todoController = Get.find();
  var selectedIndex = 0.obs; //where I want to store the selected index
  var initialDropDownVal = Category().obs;
  var dropdownItems = <DropdownMenuItem<Category>>[].obs;
  Rx<DateTime?> selectedDate = DateTime.now().add(Duration(days: 1)).obs;
  Rx<TimeOfDay?> selectedTime = TimeOfDay(hour: 10, minute: 00).obs;

  @override
  void onInit() {
    for (int i = 0; i < todoController.categories.length; ++i) {
      Category val = todoController.categories[i];
      if (i == 0) {
        initialDropDownVal.value = val;
      }
      var newItem = DropdownMenuItem(
        child: Text(val.title!),
        value: val,
      );
      dropdownItems.add(newItem);
    }
    super.onInit();
  }

  TextEditingController task = TextEditingController();
  TextEditingController description = TextEditingController();
}
