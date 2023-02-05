import 'package:flutter/services.dart';
import 'package:todo/todo.dart';

// ignore: prefer_typing_uninitialized_variables
late Database database;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  database = await openDatabase(
    join(await getDatabasesPath(), 'todo_database.db'),
    onCreate: (db, version) async {
      db.execute(
          'CREATE TABLE categories(id INTEGER PRIMARY KEY, category TEXT)');
      return db.execute(
        'CREATE TABLE todos(id INTEGER PRIMARY KEY, todo TEXT)',
      );
    },
    version: 1,
  );
  // final tables =
  //     await database.rawQuery('SELECT * FROM sqlite_master ORDER BY name;');
  // print(tables);
  var storageController = StorageController();
  // await storageController.write('isCategoriesCreated', 'false');
  var a = await storageController.getValue('isCategoriesCreated');
  // debugPrint('$a');
  // debugPrint('${a.runtimeType}');
  if (a == 'false' || a == null) {
    await TodoController().insertDefaultCategories();
    await TodoController().insertDefaultTodos();
    await storageController.write('isCategoriesCreated', 'true');
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routingCallback: (value) {
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarIconBrightness: Brightness.dark,
            statusBarColor: Get.theme.backgroundColor,
            systemNavigationBarColor: Get.theme.backgroundColor,
          ),
        );
      },
      title: 'Todoix',
      theme: themeDark,
      home: Discovery(),
    );
  }
}
