
import 'dart:io';

import 'package:moor/moor.dart';
import 'package:path_provider/path_provider.dart';
import 'package:moor_ffi/moor_ffi.dart';
import 'package:path/path.dart' as p;

part 'my_database.g.dart';


class Todos extends Table{

  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 6, max: 32)();
  TextColumn get content => text().named('body')();
  IntColumn get category => integer().nullable()();

}

@DataClassName("Category")
class Categories extends Table {

  IntColumn get id => integer().autoIncrement()();
  TextColumn get description => text()();

}
@UseDao(tables: [Todos])
class TodosDao extends DatabaseAccessor<MyDatabase>  with _$TodosDaoMixin{

  TodosDao(MyDatabase db) : super(db);

  Future<int> addTodo(Todo todo) => into(todos).insert(todo);
  Future<List<Todo>> get allTodos => select(todos).get();
  Stream<List<Todo>> get watchAllTodos => select(todos).watch();
  Stream<List<Todo>> watchAllTodosOfCategory(Category category) => (select(todos)..where( (t) => t.category.equals(category.id))).watch();

}



LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}


@UseMoor(tables: [Todos,Categories],daos: [TodosDao])
class MyDatabase extends _$MyDatabase{

  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  /*Future<List<Todo>> get allTodos => select(todos).get();

  Stream<List<Todo>> watchAllTotosOfCategort(Category category) => (select(todos)..where( (t) => t.category.equals(category.id))).watch();
*/


}
