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
    await storageController.write('isCategoriesCreated', 'true');
  }
  runApp(const MyApp());
}

final ZoomDrawerController z = ZoomDrawerController();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: themeDark,
      home: const Discovery(),
    );
  }
}
