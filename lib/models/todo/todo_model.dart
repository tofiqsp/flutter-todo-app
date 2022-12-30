import 'package:todo/todo.dart';

part 'todo_model.freezed.dart';
part 'todo_model.g.dart';

@freezed
class Todo with _$Todo {
  const factory Todo({
    String? id,
    String? title,
    String? description,
    Category? category,
    DateTime? milestone,
    DateTime? created,
    DateTime? updated,
    bool? isDone,
  }) = _Todo;

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);
}
