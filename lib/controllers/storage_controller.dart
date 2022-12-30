import 'package:todo/todo.dart';

class StorageController {
  final storage = const FlutterSecureStorage();

  Future<String?> getValue(String key) async => await storage.read(key: key);

  Future<Map<String, String>> getAllValues() async => await storage.readAll();

  Future<void> deleteValue(String key) async => await storage.delete(key: key);

  Future<void> deleteAllValues() async => await storage.deleteAll();

  Future<void> write(String key, String value) async =>
      await storage.write(key: key, value: value);
}
