import 'package:todo/todo.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
class Category with _$Category {
  const factory Category({
    String? id,
    String? title,
    int? numberOfTasks,
    int? numberOfDoneTasks,
    DateTime? created,
    DateTime? updated,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}
