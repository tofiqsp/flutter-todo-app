import 'package:todo/todo.dart';

class TodoController extends GetxController {
  var todos = <Todo>[].obs;
  var filteredTodos = <Todo>[].obs;
  var categories = <Category>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() async {
    var cats = await getCategories();
    var tds = await getTodos();
    categories.assignAll(cats);
    tds.sort((a, b) => a.id!.compareTo(b.id!));
    todos.assignAll(tds);
    filteredTodos.assignAll(tds);
    assignNumberOfTasksToCategories();
    super.onInit();
  }

  assignNumberOfTasksToCategories() {
    for (var todo in todos) {
      for (var i = 0; i < categories.length; i++) {
        if (todo.category!.id == categories[i].id) {
          categories[i] = categories[i].copyWith(
            numberOfTasks: categories[i].numberOfTasks! + 1,
          );
          if (todo.isDone != null && todo.isDone!) {
            if (categories[i].numberOfDoneTasks == null) {
              categories[i] = categories[i].copyWith(
                numberOfDoneTasks: 0,
              );
            }
            categories[i] = categories[i].copyWith(
              numberOfDoneTasks: categories[i].numberOfDoneTasks! + 1,
            );
          }
        }
      }
    }
  }

  filterTodosWithCategory(Category category) {
    filteredTodos.clear();
    filteredTodos.addAll(todos.where((e) => e.category!.id == category.id));
  }

  filterTodosToShowAll() {
    filteredTodos.clear();
    filteredTodos.addAll(todos);
  }

// Define a function that inserts dogs into the database
  Future<void> insertTodo(Todo todo) async {
    int i = categories.indexWhere((element) => element.id == todo.category!.id);
    await database.insert(
      'todos',
      {'todo': json.encode(todo.toJson())},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    todos.insert(0, todo);
    filteredTodos.insert(0, todo);
    categories[i] =
        categories[i].copyWith(numberOfTasks: categories[i].numberOfTasks! + 1);
  }

  Future<void> insertRandomTodo() async {
    await insertTodo(
      Todo(
        created: DateTime.now(),
        isDone: Random().nextBool(),
        description: Random().nextDouble().toString(),
        title: 'Todo with random ${Random().nextInt(1000).toString()}',
        milestone: DateTime.now().add(
          Duration(
            days: Random().nextInt(30),
            hours: Random().nextInt(22),
            minutes: Random().nextInt(59),
            seconds: Random().nextInt(59),
          ),
        ),
        category: categories[Random().nextInt(categories.length)],
      ),
    );
  }

  Future<void> insertCategory(Category category) async {
    await database.insert(
      'categories',
      {'category': json.encode(category.toJson())},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    categories.add(category);
  }

  Future<void> insertDefaultCategories() async {
    List<Category> cats = [
      const Category(
        title: 'Personal',
        numberOfDoneTasks: 0,
        numberOfTasks: 0,
      ),
      const Category(
        title: 'Business',
        numberOfDoneTasks: 0,
        numberOfTasks: 0,
      ),
      const Category(
        title: 'Workout',
        numberOfDoneTasks: 0,
        numberOfTasks: 0,
      ),
    ];
    for (var cat in cats) {
      insertCategory(cat);
    }
  }

  Future<void> deleteCategory(Category category) async {
    await database.delete(
      'categories',
      where: 'id = ${category.id}',
    );
  }

  Future<void> deleteTodo(Todo todo) async {
    isLoading.value = true;
    var i = categories.indexWhere((element) => todo.category!.id == element.id);
    categories[i] =
        categories[i].copyWith(numberOfTasks: categories[i].numberOfTasks! - 1);
    await database.delete(
      'todos',
      where: 'id = ${todo.id}',
    );
    todos.remove(todo);
    filteredTodos.remove(todo);
    isLoading.value = false;
  }

  Future<void> toggleIsDoneTodo(Todo todo) async {
    isLoading.value = true;
    var i = todos.indexWhere((element) => todo.id == element.id);
    var i2 = filteredTodos.indexWhere((element) => todo.id == element.id);
    var i3 =
        categories.indexWhere((element) => todo.category!.id == element.id);
    todo = todo.copyWith(isDone: !todo.isDone!);
    await database.update(
      'todos',
      {'todo': json.encode(todo.toJson())},
      // Ensure that the Dog has a matching id.
      where: 'id = ${todo.id}',
    );
    todos[i] = todo;
    filteredTodos[i2] = todo;
    categories[i3] = categories[i3].copyWith(
        numberOfDoneTasks: todo.isDone!
            ? categories[i3].numberOfDoneTasks! + 1
            : categories[i3].numberOfDoneTasks! - 1);
    isLoading.value = false;
  }

  Future<List<Todo>> getTodos() async {
    final maps = await database.query('todos');
    List<Todo> tods = [];
    for (var map in maps) {
      tods.add(Todo.fromJson(json.decode(map['todo'] as String))
          .copyWith(id: map['id'].toString()));
    }
    return tods;
  }

  Future<List<Category>> getCategories() async {
    final maps = await database.query('categories');
    List<Category> cats = [];
    for (var map in maps) {
      cats.add(
        Category.fromJson(json.decode(map['category'] as String)).copyWith(
          id: map['id'].toString(),
          numberOfTasks: 0,
        ),
      );
    }
    return cats;
  }

  Future<void> deleteDatabase(String path) async {
    var storageController = StorageController();
    databaseFactory.deleteDatabase(path);
    await storageController.deleteValue('isCategoriesCreated');
  }
}
