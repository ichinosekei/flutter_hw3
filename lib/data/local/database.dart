import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import '../../domain/entities/liked_cat_entity.dart';
import '../models/cat_model.dart';
import 'dart:convert';
part 'database.g.dart';

class LikedCats extends Table {
  TextColumn get id => text()();
  TextColumn get imageUrl => text()();
  TextColumn get breed => text()();
  IntColumn get likedAt => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

class CachedCats extends Table {
  TextColumn get id => text()();
  TextColumn get imageUrl => text()();
  TextColumn get breed => text().nullable()();
  IntColumn get cachedAt => integer()();

  @override
  Set<Column> get primaryKey => {};
}

@DriftDatabase(tables: [LikedCats, CachedCats])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<LikedCatEntity>> getAllLiked() =>
      (select(likedCats)..orderBy([(c) => OrderingTerm.desc(c.likedAt)]))
          .map(_toEntity)
          .get();

  Future<void> likeCat(LikedCatEntity cat) => into(likedCats)
      .insert(_fromEntity(cat), mode: InsertMode.insertOrReplace);

  Future<void> dislikeCat(String id) =>
      (delete(likedCats)..where((tbl) => tbl.id.equals(id))).go();

  Future<void> cacheCat(Cat cat) => into(cachedCats).insert(
        CachedCatsCompanion.insert(
          id: cat.id,
          imageUrl: cat.url,
          breed: Value(
            cat.breed == null ? null : jsonEncode(cat.breed!.toJson()),
          ),
          cachedAt: DateTime.now().millisecondsSinceEpoch,
        ),
        mode: InsertMode.insertOrReplace,
      );

  Future<List<Cat>> getCachedCats() =>
      select(cachedCats).get().then((rows) => rows.map(_toCat).toList());

  LikedCatEntity _toEntity(LikedCat row) => LikedCatEntity(
        id: row.id,
        imageUrl: row.imageUrl,
        breed: row.breed,
        likedAt: DateTime.fromMillisecondsSinceEpoch(row.likedAt),
      );

  LikedCatsCompanion _fromEntity(LikedCatEntity e) => LikedCatsCompanion.insert(
      id: e.id,
      imageUrl: e.imageUrl,
      breed: e.breed,
      likedAt: DateTime.now().millisecondsSinceEpoch);

  Cat _toCat(CachedCat row) => Cat(
        id: row.id,
        url: row.imageUrl,
        breed:
            row.breed == null ? null : Breed.fromJson(jsonDecode(row.breed!)),
      );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'cats.db'));
    return NativeDatabase.createInBackground(file);
  });
}
