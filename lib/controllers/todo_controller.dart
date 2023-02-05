import 'package:todo/todo.dart';

class TodoController extends GetxController {
  var todos = <Todo>[].obs;
  var filteredTodos = <Todo>[].obs;
  var categories = <Category>[].obs;
  var numberOfAllTasks = 0.obs;
  var numberOfAllDoneTasks = 0.obs;
  var isLoading = false.obs;
  final ZoomDrawerController z = ZoomDrawerController();
  var isData = false.obs;

  @override
  void onInit() async {
    var cats = await getCategories();
    var tds = await getTodos();
    categories.assignAll(cats);
    tds.sort((a, b) => a.id!.compareTo(b.id!));
    todos.assignAll(tds);
    filteredTodos.assignAll(tds);
    assignNumberOfTasksToCategories();
    z.stateNotifier!.addListener(
      () {
        if (z.stateNotifier!.value == DrawerState.open ||
            z.stateNotifier!.value == DrawerState.closing) {
          isData.value = true;
        } else {
          isData.value = false;
        }
      },
    );
    super.onInit();
  }

  assignNumberOfTasksToCategories() {
    numberOfAllDoneTasks.value = 0;
    numberOfAllTasks.value = 0;
    for (var todo in todos) {
      for (var i = 0; i < categories.length; i++) {
        if (todo.category!.id == categories[i].id) {
          categories[i] = categories[i].copyWith(
            numberOfTasks: categories[i].numberOfTasks! + 1,
          );
          numberOfAllTasks.value += 1;

          if (todo.isDone != null && todo.isDone!) {
            if (categories[i].numberOfDoneTasks == null) {
              categories[i] = categories[i].copyWith(
                numberOfDoneTasks: 0,
              );
            }
            categories[i] = categories[i].copyWith(
              numberOfDoneTasks: categories[i].numberOfDoneTasks! + 1,
            );
            numberOfAllDoneTasks.value += 1;
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
    numberOfAllTasks.value += 1;
    if (i > -1) {
      categories[i] = categories[i]
          .copyWith(numberOfTasks: categories[i].numberOfTasks! + 1);
    }
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
      await insertCategory(cat);
    }
  }

  Future<void> insertDefaultTodos() async {
    var cats = await getCategories();
    List<Todo> todos = [
      Todo(
        isDone: false,
        title: 'Pay bills',
        category: cats[0],
      ),
      Todo(
        isDone: false,
        title: 'Call family member',
        category: cats[0],
      ),
      Todo(
        isDone: false,
        title: 'Organize closet',
        category: cats[0],
      ),
      Todo(
        isDone: false,
        title: 'Plan vacation',
        category: cats[0],
      ),
      Todo(
        isDone: false,
        title: 'Get a haircut',
        category: cats[0],
      ),
      Todo(
        isDone: false,
        title: 'Read a book',
        category: cats[0],
      ),
      Todo(
        isDone: false,
        title: 'Go grocery shopping',
        category: cats[0],
      ),
      Todo(
        isDone: false,
        title: 'Take the dog for a walk',
        category: cats[0],
      ),
      Todo(
        isDone: false,
        title: 'Watch a movie',
        category: cats[0],
      ),
      Todo(
        isDone: false,
        title: 'Plan to meet my darling',
        category: cats[0],
      ),
      Todo(
        isDone: false,
        title: 'Schedule a meeting',
        category: cats[1],
      ),
      Todo(
        isDone: false,
        title: 'Prepare a presentation',
        category: cats[1],
      ),
      Todo(
        isDone: false,
        title: 'Follow up with a client',
        category: cats[1],
      ),
      Todo(
        isDone: false,
        title: 'Write a report',
        category: cats[1],
      ),
      Todo(
        isDone: false,
        title: 'Research a new market',
        category: cats[1],
      ),
      Todo(
        isDone: false,
        title: 'Attend a networking event',
        category: cats[1],
      ),
      Todo(
        isDone: false,
        title: 'Update social media profiles',
        category: cats[1],
      ),
      Todo(
        isDone: false,
        title: 'Plan a team building event',
        category: cats[1],
      ),
      Todo(
        isDone: false,
        title: 'Review financials',
        category: cats[1],
      ),
      Todo(
        isDone: false,
        title: 'Schedule a performance review',
        category: cats[1],
      ),
      Todo(
        isDone: false,
        title: 'Go for a run',
        category: cats[2],
      ),
      Todo(
        isDone: false,
        title: 'Do a yoga class',
        category: cats[2],
      ),
      Todo(
        isDone: false,
        title: 'Lift weights',
        category: cats[2],
      ),
      Todo(
        isDone: false,
        title: 'Go for a swim',
        category: cats[2],
      ),
      Todo(
        isDone: false,
        title: 'Take a cycling class',
        category: cats[2],
      ),
      Todo(
        isDone: false,
        title: 'Hike a trail',
        category: cats[2],
      ),
      Todo(
        isDone: false,
        title: 'Do a bodyweight workout',
        category: cats[2],
      ),
      Todo(
        isDone: false,
        title: 'Attend a dance class',
        category: cats[2],
      ),
      Todo(
        isDone: false,
        title: 'Play a sport',
        category: cats[2],
      ),
      Todo(
        isDone: false,
        title: 'Take a martial arts class',
        category: cats[2],
      ),
    ];
    for (var todo in todos) {
      await insertTodo(todo);
    }
    assignNumberOfTasksToCategories();
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
    numberOfAllTasks.value -= 1;
    if (todo.isDone!) {
      numberOfAllDoneTasks.value -= 1;
    }
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
    if (todo.isDone!) {
      numberOfAllDoneTasks.value += 1;
    } else {
      numberOfAllDoneTasks.value -= 1;
    }
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
