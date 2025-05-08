// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $LikedCatsTable extends LikedCats
    with TableInfo<$LikedCatsTable, LikedCat> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LikedCatsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imageUrlMeta =
      const VerificationMeta('imageUrl');
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
      'image_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _breedMeta = const VerificationMeta('breed');
  @override
  late final GeneratedColumn<String> breed = GeneratedColumn<String>(
      'breed', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _likedAtMeta =
      const VerificationMeta('likedAt');
  @override
  late final GeneratedColumn<int> likedAt = GeneratedColumn<int>(
      'liked_at', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, imageUrl, breed, likedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'liked_cats';
  @override
  VerificationContext validateIntegrity(Insertable<LikedCat> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta));
    } else if (isInserting) {
      context.missing(_imageUrlMeta);
    }
    if (data.containsKey('breed')) {
      context.handle(
          _breedMeta, breed.isAcceptableOrUnknown(data['breed']!, _breedMeta));
    } else if (isInserting) {
      context.missing(_breedMeta);
    }
    if (data.containsKey('liked_at')) {
      context.handle(_likedAtMeta,
          likedAt.isAcceptableOrUnknown(data['liked_at']!, _likedAtMeta));
    } else if (isInserting) {
      context.missing(_likedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LikedCat map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LikedCat(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      imageUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_url'])!,
      breed: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}breed'])!,
      likedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}liked_at'])!,
    );
  }

  @override
  $LikedCatsTable createAlias(String alias) {
    return $LikedCatsTable(attachedDatabase, alias);
  }
}

class LikedCat extends DataClass implements Insertable<LikedCat> {
  final String id;
  final String imageUrl;
  final String breed;
  final int likedAt;
  const LikedCat(
      {required this.id,
      required this.imageUrl,
      required this.breed,
      required this.likedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['image_url'] = Variable<String>(imageUrl);
    map['breed'] = Variable<String>(breed);
    map['liked_at'] = Variable<int>(likedAt);
    return map;
  }

  LikedCatsCompanion toCompanion(bool nullToAbsent) {
    return LikedCatsCompanion(
      id: Value(id),
      imageUrl: Value(imageUrl),
      breed: Value(breed),
      likedAt: Value(likedAt),
    );
  }

  factory LikedCat.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LikedCat(
      id: serializer.fromJson<String>(json['id']),
      imageUrl: serializer.fromJson<String>(json['imageUrl']),
      breed: serializer.fromJson<String>(json['breed']),
      likedAt: serializer.fromJson<int>(json['likedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'imageUrl': serializer.toJson<String>(imageUrl),
      'breed': serializer.toJson<String>(breed),
      'likedAt': serializer.toJson<int>(likedAt),
    };
  }

  LikedCat copyWith(
          {String? id, String? imageUrl, String? breed, int? likedAt}) =>
      LikedCat(
        id: id ?? this.id,
        imageUrl: imageUrl ?? this.imageUrl,
        breed: breed ?? this.breed,
        likedAt: likedAt ?? this.likedAt,
      );
  LikedCat copyWithCompanion(LikedCatsCompanion data) {
    return LikedCat(
      id: data.id.present ? data.id.value : this.id,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      breed: data.breed.present ? data.breed.value : this.breed,
      likedAt: data.likedAt.present ? data.likedAt.value : this.likedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LikedCat(')
          ..write('id: $id, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('breed: $breed, ')
          ..write('likedAt: $likedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, imageUrl, breed, likedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LikedCat &&
          other.id == this.id &&
          other.imageUrl == this.imageUrl &&
          other.breed == this.breed &&
          other.likedAt == this.likedAt);
}

class LikedCatsCompanion extends UpdateCompanion<LikedCat> {
  final Value<String> id;
  final Value<String> imageUrl;
  final Value<String> breed;
  final Value<int> likedAt;
  final Value<int> rowid;
  const LikedCatsCompanion({
    this.id = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.breed = const Value.absent(),
    this.likedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LikedCatsCompanion.insert({
    required String id,
    required String imageUrl,
    required String breed,
    required int likedAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        imageUrl = Value(imageUrl),
        breed = Value(breed),
        likedAt = Value(likedAt);
  static Insertable<LikedCat> custom({
    Expression<String>? id,
    Expression<String>? imageUrl,
    Expression<String>? breed,
    Expression<int>? likedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (imageUrl != null) 'image_url': imageUrl,
      if (breed != null) 'breed': breed,
      if (likedAt != null) 'liked_at': likedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LikedCatsCompanion copyWith(
      {Value<String>? id,
      Value<String>? imageUrl,
      Value<String>? breed,
      Value<int>? likedAt,
      Value<int>? rowid}) {
    return LikedCatsCompanion(
      id: id ?? this.id,
      imageUrl: imageUrl ?? this.imageUrl,
      breed: breed ?? this.breed,
      likedAt: likedAt ?? this.likedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (breed.present) {
      map['breed'] = Variable<String>(breed.value);
    }
    if (likedAt.present) {
      map['liked_at'] = Variable<int>(likedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LikedCatsCompanion(')
          ..write('id: $id, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('breed: $breed, ')
          ..write('likedAt: $likedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CachedCatsTable extends CachedCats
    with TableInfo<$CachedCatsTable, CachedCat> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedCatsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imageUrlMeta =
      const VerificationMeta('imageUrl');
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
      'image_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _breedMeta = const VerificationMeta('breed');
  @override
  late final GeneratedColumn<String> breed = GeneratedColumn<String>(
      'breed', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _cachedAtMeta =
      const VerificationMeta('cachedAt');
  @override
  late final GeneratedColumn<int> cachedAt = GeneratedColumn<int>(
      'cached_at', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, imageUrl, breed, cachedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_cats';
  @override
  VerificationContext validateIntegrity(Insertable<CachedCat> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta));
    } else if (isInserting) {
      context.missing(_imageUrlMeta);
    }
    if (data.containsKey('breed')) {
      context.handle(
          _breedMeta, breed.isAcceptableOrUnknown(data['breed']!, _breedMeta));
    }
    if (data.containsKey('cached_at')) {
      context.handle(_cachedAtMeta,
          cachedAt.isAcceptableOrUnknown(data['cached_at']!, _cachedAtMeta));
    } else if (isInserting) {
      context.missing(_cachedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  CachedCat map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedCat(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      imageUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_url'])!,
      breed: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}breed']),
      cachedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}cached_at'])!,
    );
  }

  @override
  $CachedCatsTable createAlias(String alias) {
    return $CachedCatsTable(attachedDatabase, alias);
  }
}

class CachedCat extends DataClass implements Insertable<CachedCat> {
  final String id;
  final String imageUrl;
  final String? breed;
  final int cachedAt;
  const CachedCat(
      {required this.id,
      required this.imageUrl,
      this.breed,
      required this.cachedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['image_url'] = Variable<String>(imageUrl);
    if (!nullToAbsent || breed != null) {
      map['breed'] = Variable<String>(breed);
    }
    map['cached_at'] = Variable<int>(cachedAt);
    return map;
  }

  CachedCatsCompanion toCompanion(bool nullToAbsent) {
    return CachedCatsCompanion(
      id: Value(id),
      imageUrl: Value(imageUrl),
      breed:
          breed == null && nullToAbsent ? const Value.absent() : Value(breed),
      cachedAt: Value(cachedAt),
    );
  }

  factory CachedCat.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedCat(
      id: serializer.fromJson<String>(json['id']),
      imageUrl: serializer.fromJson<String>(json['imageUrl']),
      breed: serializer.fromJson<String?>(json['breed']),
      cachedAt: serializer.fromJson<int>(json['cachedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'imageUrl': serializer.toJson<String>(imageUrl),
      'breed': serializer.toJson<String?>(breed),
      'cachedAt': serializer.toJson<int>(cachedAt),
    };
  }

  CachedCat copyWith(
          {String? id,
          String? imageUrl,
          Value<String?> breed = const Value.absent(),
          int? cachedAt}) =>
      CachedCat(
        id: id ?? this.id,
        imageUrl: imageUrl ?? this.imageUrl,
        breed: breed.present ? breed.value : this.breed,
        cachedAt: cachedAt ?? this.cachedAt,
      );
  CachedCat copyWithCompanion(CachedCatsCompanion data) {
    return CachedCat(
      id: data.id.present ? data.id.value : this.id,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      breed: data.breed.present ? data.breed.value : this.breed,
      cachedAt: data.cachedAt.present ? data.cachedAt.value : this.cachedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedCat(')
          ..write('id: $id, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('breed: $breed, ')
          ..write('cachedAt: $cachedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, imageUrl, breed, cachedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedCat &&
          other.id == this.id &&
          other.imageUrl == this.imageUrl &&
          other.breed == this.breed &&
          other.cachedAt == this.cachedAt);
}

class CachedCatsCompanion extends UpdateCompanion<CachedCat> {
  final Value<String> id;
  final Value<String> imageUrl;
  final Value<String?> breed;
  final Value<int> cachedAt;
  final Value<int> rowid;
  const CachedCatsCompanion({
    this.id = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.breed = const Value.absent(),
    this.cachedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedCatsCompanion.insert({
    required String id,
    required String imageUrl,
    this.breed = const Value.absent(),
    required int cachedAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        imageUrl = Value(imageUrl),
        cachedAt = Value(cachedAt);
  static Insertable<CachedCat> custom({
    Expression<String>? id,
    Expression<String>? imageUrl,
    Expression<String>? breed,
    Expression<int>? cachedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (imageUrl != null) 'image_url': imageUrl,
      if (breed != null) 'breed': breed,
      if (cachedAt != null) 'cached_at': cachedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedCatsCompanion copyWith(
      {Value<String>? id,
      Value<String>? imageUrl,
      Value<String?>? breed,
      Value<int>? cachedAt,
      Value<int>? rowid}) {
    return CachedCatsCompanion(
      id: id ?? this.id,
      imageUrl: imageUrl ?? this.imageUrl,
      breed: breed ?? this.breed,
      cachedAt: cachedAt ?? this.cachedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (breed.present) {
      map['breed'] = Variable<String>(breed.value);
    }
    if (cachedAt.present) {
      map['cached_at'] = Variable<int>(cachedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedCatsCompanion(')
          ..write('id: $id, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('breed: $breed, ')
          ..write('cachedAt: $cachedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $LikedCatsTable likedCats = $LikedCatsTable(this);
  late final $CachedCatsTable cachedCats = $CachedCatsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [likedCats, cachedCats];
}

typedef $$LikedCatsTableCreateCompanionBuilder = LikedCatsCompanion Function({
  required String id,
  required String imageUrl,
  required String breed,
  required int likedAt,
  Value<int> rowid,
});
typedef $$LikedCatsTableUpdateCompanionBuilder = LikedCatsCompanion Function({
  Value<String> id,
  Value<String> imageUrl,
  Value<String> breed,
  Value<int> likedAt,
  Value<int> rowid,
});

class $$LikedCatsTableFilterComposer
    extends Composer<_$AppDatabase, $LikedCatsTable> {
  $$LikedCatsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get breed => $composableBuilder(
      column: $table.breed, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get likedAt => $composableBuilder(
      column: $table.likedAt, builder: (column) => ColumnFilters(column));
}

class $$LikedCatsTableOrderingComposer
    extends Composer<_$AppDatabase, $LikedCatsTable> {
  $$LikedCatsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get breed => $composableBuilder(
      column: $table.breed, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get likedAt => $composableBuilder(
      column: $table.likedAt, builder: (column) => ColumnOrderings(column));
}

class $$LikedCatsTableAnnotationComposer
    extends Composer<_$AppDatabase, $LikedCatsTable> {
  $$LikedCatsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<String> get breed =>
      $composableBuilder(column: $table.breed, builder: (column) => column);

  GeneratedColumn<int> get likedAt =>
      $composableBuilder(column: $table.likedAt, builder: (column) => column);
}

class $$LikedCatsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $LikedCatsTable,
    LikedCat,
    $$LikedCatsTableFilterComposer,
    $$LikedCatsTableOrderingComposer,
    $$LikedCatsTableAnnotationComposer,
    $$LikedCatsTableCreateCompanionBuilder,
    $$LikedCatsTableUpdateCompanionBuilder,
    (LikedCat, BaseReferences<_$AppDatabase, $LikedCatsTable, LikedCat>),
    LikedCat,
    PrefetchHooks Function()> {
  $$LikedCatsTableTableManager(_$AppDatabase db, $LikedCatsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LikedCatsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LikedCatsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LikedCatsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> imageUrl = const Value.absent(),
            Value<String> breed = const Value.absent(),
            Value<int> likedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              LikedCatsCompanion(
            id: id,
            imageUrl: imageUrl,
            breed: breed,
            likedAt: likedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String imageUrl,
            required String breed,
            required int likedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              LikedCatsCompanion.insert(
            id: id,
            imageUrl: imageUrl,
            breed: breed,
            likedAt: likedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$LikedCatsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $LikedCatsTable,
    LikedCat,
    $$LikedCatsTableFilterComposer,
    $$LikedCatsTableOrderingComposer,
    $$LikedCatsTableAnnotationComposer,
    $$LikedCatsTableCreateCompanionBuilder,
    $$LikedCatsTableUpdateCompanionBuilder,
    (LikedCat, BaseReferences<_$AppDatabase, $LikedCatsTable, LikedCat>),
    LikedCat,
    PrefetchHooks Function()>;
typedef $$CachedCatsTableCreateCompanionBuilder = CachedCatsCompanion Function({
  required String id,
  required String imageUrl,
  Value<String?> breed,
  required int cachedAt,
  Value<int> rowid,
});
typedef $$CachedCatsTableUpdateCompanionBuilder = CachedCatsCompanion Function({
  Value<String> id,
  Value<String> imageUrl,
  Value<String?> breed,
  Value<int> cachedAt,
  Value<int> rowid,
});

class $$CachedCatsTableFilterComposer
    extends Composer<_$AppDatabase, $CachedCatsTable> {
  $$CachedCatsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get breed => $composableBuilder(
      column: $table.breed, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get cachedAt => $composableBuilder(
      column: $table.cachedAt, builder: (column) => ColumnFilters(column));
}

class $$CachedCatsTableOrderingComposer
    extends Composer<_$AppDatabase, $CachedCatsTable> {
  $$CachedCatsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get breed => $composableBuilder(
      column: $table.breed, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get cachedAt => $composableBuilder(
      column: $table.cachedAt, builder: (column) => ColumnOrderings(column));
}

class $$CachedCatsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CachedCatsTable> {
  $$CachedCatsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<String> get breed =>
      $composableBuilder(column: $table.breed, builder: (column) => column);

  GeneratedColumn<int> get cachedAt =>
      $composableBuilder(column: $table.cachedAt, builder: (column) => column);
}

class $$CachedCatsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CachedCatsTable,
    CachedCat,
    $$CachedCatsTableFilterComposer,
    $$CachedCatsTableOrderingComposer,
    $$CachedCatsTableAnnotationComposer,
    $$CachedCatsTableCreateCompanionBuilder,
    $$CachedCatsTableUpdateCompanionBuilder,
    (CachedCat, BaseReferences<_$AppDatabase, $CachedCatsTable, CachedCat>),
    CachedCat,
    PrefetchHooks Function()> {
  $$CachedCatsTableTableManager(_$AppDatabase db, $CachedCatsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedCatsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedCatsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CachedCatsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> imageUrl = const Value.absent(),
            Value<String?> breed = const Value.absent(),
            Value<int> cachedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CachedCatsCompanion(
            id: id,
            imageUrl: imageUrl,
            breed: breed,
            cachedAt: cachedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String imageUrl,
            Value<String?> breed = const Value.absent(),
            required int cachedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              CachedCatsCompanion.insert(
            id: id,
            imageUrl: imageUrl,
            breed: breed,
            cachedAt: cachedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CachedCatsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CachedCatsTable,
    CachedCat,
    $$CachedCatsTableFilterComposer,
    $$CachedCatsTableOrderingComposer,
    $$CachedCatsTableAnnotationComposer,
    $$CachedCatsTableCreateCompanionBuilder,
    $$CachedCatsTableUpdateCompanionBuilder,
    (CachedCat, BaseReferences<_$AppDatabase, $CachedCatsTable, CachedCat>),
    CachedCat,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$LikedCatsTableTableManager get likedCats =>
      $$LikedCatsTableTableManager(_db, _db.likedCats);
  $$CachedCatsTableTableManager get cachedCats =>
      $$CachedCatsTableTableManager(_db, _db.cachedCats);
}
