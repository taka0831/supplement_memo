import 'dart:io';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:drift/drift.dart';
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

class Memos extends Table {
  TextColumn get supplementName => text()();

  TextColumn get quantity => text()();

  TextColumn get bestBefore => text()();

  @override
  // TODO: implement primaryKey
  Set<Column>? get primaryKey => {supplementName};
}

@DriftDatabase(tables: [Memos])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  // TODO: implement schemaVersion
  int get schemaVersion => 1;

  Future addMemo(Memo memo) => into(memos).insert(memo);

  Future<List<Memo>> get allMemos => select(memos).get();

  Future updateMemo(Memo memo) => update(memos).replace(memo);

  Future deleteMemo(Memo memo) => (delete(memos)
        ..where((tbl) => tbl.supplementName.equals(memo.supplementName)))
      .go();
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'memos.db'));
    return NativeDatabase(file);
  });
}
