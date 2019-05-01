// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// MigrationGenerator
// **************************************************************************

class ItemErrorsMigration extends Migration {
  @override
  up(Schema schema) {
    schema.create('item_errors', (table) {
      table.serial('id')..primaryKey();
      table.varChar('error')..notNull();
      table.timeStamp('created_at');
      table.timeStamp('updated_at');
    });
  }

  @override
  down(Schema schema) {
    schema.drop('item_errors');
  }
}

class ItemMigration extends Migration {
  @override
  up(Schema schema) {
    schema.create('items', (table) {
      table.serial('id')..primaryKey();
      table.boolean('audio')
        ..defaultsTo(false)
        ..notNull();
      table.varChar('download_name')..notNull();
      table.integer('duration');
      table.varChar('extension')..notNull();
      table.varChar('file_name')..notNull();
      table.varChar('file_path')..notNull();
      table.boolean('full_file_available')..defaultsTo(false);
      table.integer('height');
      table.boolean('in_trash')
        ..defaultsTo(false)
        ..notNull();
      table.integer('length');
      table.varChar('mime')..notNull();
      table.varChar('perceptual_hash');
      table.varChar('source');
      table.boolean('video')
        ..defaultsTo(false)
        ..notNull();
      table.integer('width');
      table.timeStamp('created_at');
      table.timeStamp('updated_at');
      table.integer('uploader_id').references('users', 'id');
    });
  }

  @override
  down(Schema schema) {
    schema.drop('items', cascade: true);
  }
}

class ItemMetadataMigration extends Migration {
  @override
  up(Schema schema) {
    schema.create('item_metadata', (table) {
      table.serial('id')..primaryKey();
      table.varChar('name', length: 200)..notNull();
      table.varChar('value')..notNull();
      table.timeStamp('created_at');
      table.timeStamp('updated_at');
    });
  }

  @override
  down(Schema schema) {
    schema.drop('item_metadata');
  }
}

class ItemTagMigration extends Migration {
  @override
  up(Schema schema) {
    schema.create('item_tags', (table) {
      table.serial('id')..primaryKey();
      table.timeStamp('created_at');
      table.timeStamp('updated_at');
      table.integer('item_id').references('items', 'id');
      table.integer('tag_id').references('tags', 'id');
    });
  }

  @override
  down(Schema schema) {
    schema.drop('item_tags');
  }
}

class TagMigration extends Migration {
  @override
  up(Schema schema) {
    schema.create('tags', (table) {
      table.serial('id')..primaryKey();
      table.integer('count')
        ..defaultsTo(0)
        ..notNull();
      table.varChar('name', length: 200)..notNull();
      table.timeStamp('created_at');
      table.timeStamp('updated_at');
      table.integer('category_id').references('tag_categories', 'id');
      table.integer('redirect_id').references('tags', 'id');
    });
  }

  @override
  down(Schema schema) {
    schema.drop('tags');
  }
}

class TagCategoryMigration extends Migration {
  @override
  up(Schema schema) {
    schema.create('tag_categories', (table) {
      table.serial('id')..primaryKey();
      table.varChar('color', length: 10);
      table.varChar('name', length: 200)..notNull();
      table.timeStamp('created_at');
      table.timeStamp('updated_at');
    });
  }

  @override
  down(Schema schema) {
    schema.drop('tag_categories');
  }
}

class UserMigration extends Migration {
  @override
  up(Schema schema) {
    schema.create('users', (table) {
      table.serial('id')..primaryKey();
      table.varChar('username')..notNull();
      table.varChar('password')..notNull();
      table.varChar('name')..notNull();
      table.varChar('email')..notNull();
      table.timeStamp('created_at');
      table.timeStamp('updated_at');
    });
  }

  @override
  down(Schema schema) {
    schema.drop('users');
  }
}

// **************************************************************************
// OrmGenerator
// **************************************************************************

class ItemErrorsQuery extends Query<ItemErrors, ItemErrorsQueryWhere> {
  ItemErrorsQuery({Set<String> trampoline}) {
    trampoline ??= Set();
    trampoline.add(tableName);
    _where = ItemErrorsQueryWhere(this);
  }

  @override
  final ItemErrorsQueryValues values = ItemErrorsQueryValues();

  ItemErrorsQueryWhere _where;

  @override
  get casts {
    return {};
  }

  @override
  get tableName {
    return 'item_errors';
  }

  @override
  get fields {
    return const ['id', 'error', 'created_at', 'updated_at'];
  }

  @override
  ItemErrorsQueryWhere get where {
    return _where;
  }

  @override
  ItemErrorsQueryWhere newWhereClause() {
    return ItemErrorsQueryWhere(this);
  }

  static ItemErrors parseRow(List row) {
    if (row.every((x) => x == null)) return null;
    var model = ItemErrors(
        id: row[0].toString(),
        error: (row[1] as String),
        createdAt: (row[2] as DateTime),
        updatedAt: (row[3] as DateTime));
    return model;
  }

  @override
  deserialize(List row) {
    return parseRow(row);
  }
}

class ItemErrorsQueryWhere extends QueryWhere {
  ItemErrorsQueryWhere(ItemErrorsQuery query)
      : id = NumericSqlExpressionBuilder<int>(query, 'id'),
        error = StringSqlExpressionBuilder(query, 'error'),
        createdAt = DateTimeSqlExpressionBuilder(query, 'created_at'),
        updatedAt = DateTimeSqlExpressionBuilder(query, 'updated_at');

  final NumericSqlExpressionBuilder<int> id;

  final StringSqlExpressionBuilder error;

  final DateTimeSqlExpressionBuilder createdAt;

  final DateTimeSqlExpressionBuilder updatedAt;

  @override
  get expressionBuilders {
    return [id, error, createdAt, updatedAt];
  }
}

class ItemErrorsQueryValues extends MapQueryValues {
  @override
  get casts {
    return {};
  }

  String get id {
    return (values['id'] as String);
  }

  set id(String value) => values['id'] = value;
  String get error {
    return (values['error'] as String);
  }

  set error(String value) => values['error'] = value;
  DateTime get createdAt {
    return (values['created_at'] as DateTime);
  }

  set createdAt(DateTime value) => values['created_at'] = value;
  DateTime get updatedAt {
    return (values['updated_at'] as DateTime);
  }

  set updatedAt(DateTime value) => values['updated_at'] = value;
  void copyFrom(ItemErrors model) {
    error = model.error;
    createdAt = model.createdAt;
    updatedAt = model.updatedAt;
  }
}

class ItemQuery extends Query<Item, ItemQueryWhere> {
  ItemQuery({Set<String> trampoline}) {
    trampoline ??= Set();
    trampoline.add(tableName);
    _where = ItemQueryWhere(this);
    leftJoin(ItemErrorsQuery(trampoline: trampoline), 'id', 'item_id',
        additionalFields: const ['id', 'error', 'created_at', 'updated_at'],
        trampoline: trampoline);
    leftJoin(ItemMetadataQuery(trampoline: trampoline), 'id', 'item_id',
        additionalFields: const [
          'id',
          'name',
          'value',
          'created_at',
          'updated_at'
        ],
        trampoline: trampoline);
    leftJoin(ItemTagQuery(trampoline: trampoline), 'id', 'item_id',
        additionalFields: const [
          'id',
          'category_id',
          'count',
          'name',
          'redirect_id',
          'created_at',
          'updated_at'
        ],
        trampoline: trampoline);
    leftJoin('users', 'uploader_id', 'id',
        additionalFields: const [
          'id',
          'username',
          'password',
          'name',
          'email',
          'created_at',
          'updated_at'
        ],
        trampoline: trampoline);
  }

  @override
  final ItemQueryValues values = ItemQueryValues();

  ItemQueryWhere _where;

  @override
  get casts {
    return {};
  }

  @override
  get tableName {
    return 'items';
  }

  @override
  get fields {
    return const [
      'id',
      'audio',
      'download_name',
      'duration',
      'extension',
      'file_name',
      'file_path',
      'full_file_available',
      'height',
      'in_trash',
      'length',
      'mime',
      'perceptual_hash',
      'source',
      'uploader_id',
      'video',
      'width',
      'created_at',
      'updated_at'
    ];
  }

  @override
  ItemQueryWhere get where {
    return _where;
  }

  @override
  ItemQueryWhere newWhereClause() {
    return ItemQueryWhere(this);
  }

  static Item parseRow(List row) {
    if (row.every((x) => x == null)) return null;
    var model = Item(
        id: row[0].toString(),
        audio: (row[1] as bool),
        downloadName: (row[2] as String),
        duration: (row[3] as int),
        extension: (row[4] as String),
        fileName: (row[5] as String),
        filePath: (row[6] as String),
        fullFileAvailable: (row[7] as bool),
        height: (row[8] as int),
        inTrash: (row[9] as bool),
        length: (row[10] as int),
        mime: (row[11] as String),
        perceptualHash: (row[12] as String),
        source: (row[13] as String),
        video: (row[15] as bool),
        width: (row[16] as int),
        createdAt: (row[17] as DateTime),
        updatedAt: (row[18] as DateTime));
    if (row.length > 19) {
      model = model.copyWith(
          errors: [ItemErrorsQuery.parseRow(row.skip(19).take(4).toList())]
              .where((x) => x != null)
              .toList());
    }
    if (row.length > 23) {
      model = model.copyWith(
          metadata: [ItemMetadataQuery.parseRow(row.skip(23).take(5).toList())]
              .where((x) => x != null)
              .toList());
    }
    if (row.length > 28) {
      model = model.copyWith(
          tags: [TagQuery.parseRow(row.skip(28).take(7).toList())]
              .where((x) => x != null)
              .toList());
    }
    if (row.length > 35) {
      model = model.copyWith(
          uploader: UserQuery.parseRow(row.skip(35).take(7).toList()));
    }
    return model;
  }

  @override
  deserialize(List row) {
    return parseRow(row);
  }

  @override
  bool canCompile(trampoline) {
    return (!(trampoline.contains('items') &&
        trampoline.contains('item_tags')));
  }

  @override
  get(QueryExecutor executor) {
    return super.get(executor).then((result) {
      return result.fold<List<Item>>([], (out, model) {
        var idx = out.indexWhere((m) => m.id == model.id);

        if (idx == -1) {
          return out..add(model);
        } else {
          var l = out[idx];
          return out
            ..[idx] = l.copyWith(
                errors: List<_ItemErrors>.from(l.errors ?? [])
                  ..addAll(model.errors ?? []),
                metadata: List<_ItemMetadata>.from(l.metadata ?? [])
                  ..addAll(model.metadata ?? []),
                tags: List<_Tag>.from(l.tags ?? [])..addAll(model.tags ?? []));
        }
      });
    });
  }

  @override
  update(QueryExecutor executor) {
    return super.update(executor).then((result) {
      return result.fold<List<Item>>([], (out, model) {
        var idx = out.indexWhere((m) => m.id == model.id);

        if (idx == -1) {
          return out..add(model);
        } else {
          var l = out[idx];
          return out
            ..[idx] = l.copyWith(
                errors: List<_ItemErrors>.from(l.errors ?? [])
                  ..addAll(model.errors ?? []),
                metadata: List<_ItemMetadata>.from(l.metadata ?? [])
                  ..addAll(model.metadata ?? []),
                tags: List<_Tag>.from(l.tags ?? [])..addAll(model.tags ?? []));
        }
      });
    });
  }

  @override
  delete(QueryExecutor executor) {
    return super.delete(executor).then((result) {
      return result.fold<List<Item>>([], (out, model) {
        var idx = out.indexWhere((m) => m.id == model.id);

        if (idx == -1) {
          return out..add(model);
        } else {
          var l = out[idx];
          return out
            ..[idx] = l.copyWith(
                errors: List<_ItemErrors>.from(l.errors ?? [])
                  ..addAll(model.errors ?? []),
                metadata: List<_ItemMetadata>.from(l.metadata ?? [])
                  ..addAll(model.metadata ?? []),
                tags: List<_Tag>.from(l.tags ?? [])..addAll(model.tags ?? []));
        }
      });
    });
  }
}

class ItemQueryWhere extends QueryWhere {
  ItemQueryWhere(ItemQuery query)
      : id = NumericSqlExpressionBuilder<int>(query, 'id'),
        audio = BooleanSqlExpressionBuilder(query, 'audio'),
        downloadName = StringSqlExpressionBuilder(query, 'download_name'),
        duration = NumericSqlExpressionBuilder<int>(query, 'duration'),
        extension = StringSqlExpressionBuilder(query, 'extension'),
        fileName = StringSqlExpressionBuilder(query, 'file_name'),
        filePath = StringSqlExpressionBuilder(query, 'file_path'),
        fullFileAvailable =
            BooleanSqlExpressionBuilder(query, 'full_file_available'),
        height = NumericSqlExpressionBuilder<int>(query, 'height'),
        inTrash = BooleanSqlExpressionBuilder(query, 'in_trash'),
        length = NumericSqlExpressionBuilder<int>(query, 'length'),
        mime = StringSqlExpressionBuilder(query, 'mime'),
        perceptualHash = StringSqlExpressionBuilder(query, 'perceptual_hash'),
        source = StringSqlExpressionBuilder(query, 'source'),
        uploaderId = NumericSqlExpressionBuilder<int>(query, 'uploader_id'),
        video = BooleanSqlExpressionBuilder(query, 'video'),
        width = NumericSqlExpressionBuilder<int>(query, 'width'),
        createdAt = DateTimeSqlExpressionBuilder(query, 'created_at'),
        updatedAt = DateTimeSqlExpressionBuilder(query, 'updated_at');

  final NumericSqlExpressionBuilder<int> id;

  final BooleanSqlExpressionBuilder audio;

  final StringSqlExpressionBuilder downloadName;

  final NumericSqlExpressionBuilder<int> duration;

  final StringSqlExpressionBuilder extension;

  final StringSqlExpressionBuilder fileName;

  final StringSqlExpressionBuilder filePath;

  final BooleanSqlExpressionBuilder fullFileAvailable;

  final NumericSqlExpressionBuilder<int> height;

  final BooleanSqlExpressionBuilder inTrash;

  final NumericSqlExpressionBuilder<int> length;

  final StringSqlExpressionBuilder mime;

  final StringSqlExpressionBuilder perceptualHash;

  final StringSqlExpressionBuilder source;

  final NumericSqlExpressionBuilder<int> uploaderId;

  final BooleanSqlExpressionBuilder video;

  final NumericSqlExpressionBuilder<int> width;

  final DateTimeSqlExpressionBuilder createdAt;

  final DateTimeSqlExpressionBuilder updatedAt;

  @override
  get expressionBuilders {
    return [
      id,
      audio,
      downloadName,
      duration,
      extension,
      fileName,
      filePath,
      fullFileAvailable,
      height,
      inTrash,
      length,
      mime,
      perceptualHash,
      source,
      uploaderId,
      video,
      width,
      createdAt,
      updatedAt
    ];
  }
}

class ItemQueryValues extends MapQueryValues {
  @override
  get casts {
    return {};
  }

  String get id {
    return (values['id'] as String);
  }

  set id(String value) => values['id'] = value;
  bool get audio {
    return (values['audio'] as bool);
  }

  set audio(bool value) => values['audio'] = value;
  String get downloadName {
    return (values['download_name'] as String);
  }

  set downloadName(String value) => values['download_name'] = value;
  int get duration {
    return (values['duration'] as int);
  }

  set duration(int value) => values['duration'] = value;
  String get extension {
    return (values['extension'] as String);
  }

  set extension(String value) => values['extension'] = value;
  String get fileName {
    return (values['file_name'] as String);
  }

  set fileName(String value) => values['file_name'] = value;
  String get filePath {
    return (values['file_path'] as String);
  }

  set filePath(String value) => values['file_path'] = value;
  bool get fullFileAvailable {
    return (values['full_file_available'] as bool);
  }

  set fullFileAvailable(bool value) => values['full_file_available'] = value;
  int get height {
    return (values['height'] as int);
  }

  set height(int value) => values['height'] = value;
  bool get inTrash {
    return (values['in_trash'] as bool);
  }

  set inTrash(bool value) => values['in_trash'] = value;
  int get length {
    return (values['length'] as int);
  }

  set length(int value) => values['length'] = value;
  String get mime {
    return (values['mime'] as String);
  }

  set mime(String value) => values['mime'] = value;
  String get perceptualHash {
    return (values['perceptual_hash'] as String);
  }

  set perceptualHash(String value) => values['perceptual_hash'] = value;
  String get source {
    return (values['source'] as String);
  }

  set source(String value) => values['source'] = value;
  int get uploaderId {
    return (values['uploader_id'] as int);
  }

  set uploaderId(int value) => values['uploader_id'] = value;
  bool get video {
    return (values['video'] as bool);
  }

  set video(bool value) => values['video'] = value;
  int get width {
    return (values['width'] as int);
  }

  set width(int value) => values['width'] = value;
  DateTime get createdAt {
    return (values['created_at'] as DateTime);
  }

  set createdAt(DateTime value) => values['created_at'] = value;
  DateTime get updatedAt {
    return (values['updated_at'] as DateTime);
  }

  set updatedAt(DateTime value) => values['updated_at'] = value;
  void copyFrom(Item model) {
    audio = model.audio;
    downloadName = model.downloadName;
    duration = model.duration;
    extension = model.extension;
    fileName = model.fileName;
    filePath = model.filePath;
    fullFileAvailable = model.fullFileAvailable;
    height = model.height;
    inTrash = model.inTrash;
    length = model.length;
    mime = model.mime;
    perceptualHash = model.perceptualHash;
    source = model.source;
    video = model.video;
    width = model.width;
    createdAt = model.createdAt;
    updatedAt = model.updatedAt;
    if (model.uploader != null) {
      values['uploader_id'] = model.uploader.id;
    }
  }
}

class ItemMetadataQuery extends Query<ItemMetadata, ItemMetadataQueryWhere> {
  ItemMetadataQuery({Set<String> trampoline}) {
    trampoline ??= Set();
    trampoline.add(tableName);
    _where = ItemMetadataQueryWhere(this);
  }

  @override
  final ItemMetadataQueryValues values = ItemMetadataQueryValues();

  ItemMetadataQueryWhere _where;

  @override
  get casts {
    return {};
  }

  @override
  get tableName {
    return 'item_metadata';
  }

  @override
  get fields {
    return const ['id', 'name', 'value', 'created_at', 'updated_at'];
  }

  @override
  ItemMetadataQueryWhere get where {
    return _where;
  }

  @override
  ItemMetadataQueryWhere newWhereClause() {
    return ItemMetadataQueryWhere(this);
  }

  static ItemMetadata parseRow(List row) {
    if (row.every((x) => x == null)) return null;
    var model = ItemMetadata(
        id: row[0].toString(),
        name: (row[1] as String),
        value: (row[2] as String),
        createdAt: (row[3] as DateTime),
        updatedAt: (row[4] as DateTime));
    return model;
  }

  @override
  deserialize(List row) {
    return parseRow(row);
  }
}

class ItemMetadataQueryWhere extends QueryWhere {
  ItemMetadataQueryWhere(ItemMetadataQuery query)
      : id = NumericSqlExpressionBuilder<int>(query, 'id'),
        name = StringSqlExpressionBuilder(query, 'name'),
        value = StringSqlExpressionBuilder(query, 'value'),
        createdAt = DateTimeSqlExpressionBuilder(query, 'created_at'),
        updatedAt = DateTimeSqlExpressionBuilder(query, 'updated_at');

  final NumericSqlExpressionBuilder<int> id;

  final StringSqlExpressionBuilder name;

  final StringSqlExpressionBuilder value;

  final DateTimeSqlExpressionBuilder createdAt;

  final DateTimeSqlExpressionBuilder updatedAt;

  @override
  get expressionBuilders {
    return [id, name, value, createdAt, updatedAt];
  }
}

class ItemMetadataQueryValues extends MapQueryValues {
  @override
  get casts {
    return {};
  }

  String get id {
    return (values['id'] as String);
  }

  set id(String value) => values['id'] = value;
  String get name {
    return (values['name'] as String);
  }

  set name(String value) => values['name'] = value;
  String get value {
    return (values['value'] as String);
  }

  set value(String value) => values['value'] = value;
  DateTime get createdAt {
    return (values['created_at'] as DateTime);
  }

  set createdAt(DateTime value) => values['created_at'] = value;
  DateTime get updatedAt {
    return (values['updated_at'] as DateTime);
  }

  set updatedAt(DateTime value) => values['updated_at'] = value;
  void copyFrom(ItemMetadata model) {
    name = model.name;
    value = model.value;
    createdAt = model.createdAt;
    updatedAt = model.updatedAt;
  }
}

class ItemTagQuery extends Query<ItemTag, ItemTagQueryWhere> {
  ItemTagQuery({Set<String> trampoline}) {
    trampoline ??= Set();
    trampoline.add(tableName);
    _where = ItemTagQueryWhere(this);
    leftJoin('items', 'item_id', 'id',
        additionalFields: const [
          'id',
          'audio',
          'download_name',
          'duration',
          'extension',
          'file_name',
          'file_path',
          'full_file_available',
          'height',
          'in_trash',
          'length',
          'mime',
          'perceptual_hash',
          'source',
          'uploader_id',
          'video',
          'width',
          'created_at',
          'updated_at'
        ],
        trampoline: trampoline);
    leftJoin('tags', 'tag_id', 'id',
        additionalFields: const [
          'id',
          'category_id',
          'count',
          'name',
          'redirect_id',
          'created_at',
          'updated_at'
        ],
        trampoline: trampoline);
  }

  @override
  final ItemTagQueryValues values = ItemTagQueryValues();

  ItemTagQueryWhere _where;

  @override
  get casts {
    return {};
  }

  @override
  get tableName {
    return 'item_tags';
  }

  @override
  get fields {
    return const ['id', 'item_id', 'tag_id', 'created_at', 'updated_at'];
  }

  @override
  ItemTagQueryWhere get where {
    return _where;
  }

  @override
  ItemTagQueryWhere newWhereClause() {
    return ItemTagQueryWhere(this);
  }

  static ItemTag parseRow(List row) {
    if (row.every((x) => x == null)) return null;
    var model = ItemTag(
        id: row[0].toString(),
        createdAt: (row[3] as DateTime),
        updatedAt: (row[4] as DateTime));
    if (row.length > 5) {
      model = model.copyWith(
          item: ItemQuery.parseRow(row.skip(5).take(19).toList()));
    }
    if (row.length > 24) {
      model =
          model.copyWith(tag: TagQuery.parseRow(row.skip(24).take(7).toList()));
    }
    return model;
  }

  @override
  deserialize(List row) {
    return parseRow(row);
  }
}

class ItemTagQueryWhere extends QueryWhere {
  ItemTagQueryWhere(ItemTagQuery query)
      : id = NumericSqlExpressionBuilder<int>(query, 'id'),
        itemId = NumericSqlExpressionBuilder<int>(query, 'item_id'),
        tagId = NumericSqlExpressionBuilder<int>(query, 'tag_id'),
        createdAt = DateTimeSqlExpressionBuilder(query, 'created_at'),
        updatedAt = DateTimeSqlExpressionBuilder(query, 'updated_at');

  final NumericSqlExpressionBuilder<int> id;

  final NumericSqlExpressionBuilder<int> itemId;

  final NumericSqlExpressionBuilder<int> tagId;

  final DateTimeSqlExpressionBuilder createdAt;

  final DateTimeSqlExpressionBuilder updatedAt;

  @override
  get expressionBuilders {
    return [id, itemId, tagId, createdAt, updatedAt];
  }
}

class ItemTagQueryValues extends MapQueryValues {
  @override
  get casts {
    return {};
  }

  String get id {
    return (values['id'] as String);
  }

  set id(String value) => values['id'] = value;
  int get itemId {
    return (values['item_id'] as int);
  }

  set itemId(int value) => values['item_id'] = value;
  int get tagId {
    return (values['tag_id'] as int);
  }

  set tagId(int value) => values['tag_id'] = value;
  DateTime get createdAt {
    return (values['created_at'] as DateTime);
  }

  set createdAt(DateTime value) => values['created_at'] = value;
  DateTime get updatedAt {
    return (values['updated_at'] as DateTime);
  }

  set updatedAt(DateTime value) => values['updated_at'] = value;
  void copyFrom(ItemTag model) {
    createdAt = model.createdAt;
    updatedAt = model.updatedAt;
    if (model.item != null) {
      values['item_id'] = model.item.id;
    }
    if (model.tag != null) {
      values['tag_id'] = model.tag.id;
    }
  }
}

class TagQuery extends Query<Tag, TagQueryWhere> {
  TagQuery({Set<String> trampoline}) {
    trampoline ??= Set();
    trampoline.add(tableName);
    _where = TagQueryWhere(this);
    leftJoin('tag_categories', 'category_id', 'id',
        additionalFields: const [
          'id',
          'color',
          'name',
          'created_at',
          'updated_at'
        ],
        trampoline: trampoline);
    leftJoin('tags', 'redirect_id', 'id',
        additionalFields: const [
          'id',
          'category_id',
          'count',
          'name',
          'redirect_id',
          'created_at',
          'updated_at'
        ],
        trampoline: trampoline);
  }

  @override
  final TagQueryValues values = TagQueryValues();

  TagQueryWhere _where;

  @override
  get casts {
    return {};
  }

  @override
  get tableName {
    return 'tags';
  }

  @override
  get fields {
    return const [
      'id',
      'category_id',
      'count',
      'name',
      'redirect_id',
      'created_at',
      'updated_at'
    ];
  }

  @override
  TagQueryWhere get where {
    return _where;
  }

  @override
  TagQueryWhere newWhereClause() {
    return TagQueryWhere(this);
  }

  static Tag parseRow(List row) {
    if (row.every((x) => x == null)) return null;
    var model = Tag(
        id: row[0].toString(),
        count: (row[2] as int),
        name: (row[3] as String),
        createdAt: (row[5] as DateTime),
        updatedAt: (row[6] as DateTime));
    if (row.length > 7) {
      model = model.copyWith(
          category: TagCategoryQuery.parseRow(row.skip(7).take(5).toList()));
    }
    if (row.length > 12) {
      model = model.copyWith(
          redirect: TagQuery.parseRow(row.skip(12).take(7).toList()));
    }
    return model;
  }

  @override
  deserialize(List row) {
    return parseRow(row);
  }
}

class TagQueryWhere extends QueryWhere {
  TagQueryWhere(TagQuery query)
      : id = NumericSqlExpressionBuilder<int>(query, 'id'),
        categoryId = NumericSqlExpressionBuilder<int>(query, 'category_id'),
        count = NumericSqlExpressionBuilder<int>(query, 'count'),
        name = StringSqlExpressionBuilder(query, 'name'),
        redirectId = NumericSqlExpressionBuilder<int>(query, 'redirect_id'),
        createdAt = DateTimeSqlExpressionBuilder(query, 'created_at'),
        updatedAt = DateTimeSqlExpressionBuilder(query, 'updated_at');

  final NumericSqlExpressionBuilder<int> id;

  final NumericSqlExpressionBuilder<int> categoryId;

  final NumericSqlExpressionBuilder<int> count;

  final StringSqlExpressionBuilder name;

  final NumericSqlExpressionBuilder<int> redirectId;

  final DateTimeSqlExpressionBuilder createdAt;

  final DateTimeSqlExpressionBuilder updatedAt;

  @override
  get expressionBuilders {
    return [id, categoryId, count, name, redirectId, createdAt, updatedAt];
  }
}

class TagQueryValues extends MapQueryValues {
  @override
  get casts {
    return {};
  }

  String get id {
    return (values['id'] as String);
  }

  set id(String value) => values['id'] = value;
  int get categoryId {
    return (values['category_id'] as int);
  }

  set categoryId(int value) => values['category_id'] = value;
  int get count {
    return (values['count'] as int);
  }

  set count(int value) => values['count'] = value;
  String get name {
    return (values['name'] as String);
  }

  set name(String value) => values['name'] = value;
  int get redirectId {
    return (values['redirect_id'] as int);
  }

  set redirectId(int value) => values['redirect_id'] = value;
  DateTime get createdAt {
    return (values['created_at'] as DateTime);
  }

  set createdAt(DateTime value) => values['created_at'] = value;
  DateTime get updatedAt {
    return (values['updated_at'] as DateTime);
  }

  set updatedAt(DateTime value) => values['updated_at'] = value;
  void copyFrom(Tag model) {
    count = model.count;
    name = model.name;
    createdAt = model.createdAt;
    updatedAt = model.updatedAt;
    if (model.category != null) {
      values['category_id'] = model.category.id;
    }
    if (model.redirect != null) {
      values['redirect_id'] = model.redirect.id;
    }
  }
}

class TagCategoryQuery extends Query<TagCategory, TagCategoryQueryWhere> {
  TagCategoryQuery({Set<String> trampoline}) {
    trampoline ??= Set();
    trampoline.add(tableName);
    _where = TagCategoryQueryWhere(this);
  }

  @override
  final TagCategoryQueryValues values = TagCategoryQueryValues();

  TagCategoryQueryWhere _where;

  @override
  get casts {
    return {};
  }

  @override
  get tableName {
    return 'tag_categories';
  }

  @override
  get fields {
    return const ['id', 'color', 'name', 'created_at', 'updated_at'];
  }

  @override
  TagCategoryQueryWhere get where {
    return _where;
  }

  @override
  TagCategoryQueryWhere newWhereClause() {
    return TagCategoryQueryWhere(this);
  }

  static TagCategory parseRow(List row) {
    if (row.every((x) => x == null)) return null;
    var model = TagCategory(
        id: row[0].toString(),
        color: (row[1] as String),
        name: (row[2] as String),
        createdAt: (row[3] as DateTime),
        updatedAt: (row[4] as DateTime));
    return model;
  }

  @override
  deserialize(List row) {
    return parseRow(row);
  }
}

class TagCategoryQueryWhere extends QueryWhere {
  TagCategoryQueryWhere(TagCategoryQuery query)
      : id = NumericSqlExpressionBuilder<int>(query, 'id'),
        color = StringSqlExpressionBuilder(query, 'color'),
        name = StringSqlExpressionBuilder(query, 'name'),
        createdAt = DateTimeSqlExpressionBuilder(query, 'created_at'),
        updatedAt = DateTimeSqlExpressionBuilder(query, 'updated_at');

  final NumericSqlExpressionBuilder<int> id;

  final StringSqlExpressionBuilder color;

  final StringSqlExpressionBuilder name;

  final DateTimeSqlExpressionBuilder createdAt;

  final DateTimeSqlExpressionBuilder updatedAt;

  @override
  get expressionBuilders {
    return [id, color, name, createdAt, updatedAt];
  }
}

class TagCategoryQueryValues extends MapQueryValues {
  @override
  get casts {
    return {};
  }

  String get id {
    return (values['id'] as String);
  }

  set id(String value) => values['id'] = value;
  String get color {
    return (values['color'] as String);
  }

  set color(String value) => values['color'] = value;
  String get name {
    return (values['name'] as String);
  }

  set name(String value) => values['name'] = value;
  DateTime get createdAt {
    return (values['created_at'] as DateTime);
  }

  set createdAt(DateTime value) => values['created_at'] = value;
  DateTime get updatedAt {
    return (values['updated_at'] as DateTime);
  }

  set updatedAt(DateTime value) => values['updated_at'] = value;
  void copyFrom(TagCategory model) {
    color = model.color;
    name = model.name;
    createdAt = model.createdAt;
    updatedAt = model.updatedAt;
  }
}

class UserQuery extends Query<User, UserQueryWhere> {
  UserQuery({Set<String> trampoline}) {
    trampoline ??= Set();
    trampoline.add(tableName);
    _where = UserQueryWhere(this);
  }

  @override
  final UserQueryValues values = UserQueryValues();

  UserQueryWhere _where;

  @override
  get casts {
    return {};
  }

  @override
  get tableName {
    return 'users';
  }

  @override
  get fields {
    return const [
      'id',
      'username',
      'password',
      'name',
      'email',
      'created_at',
      'updated_at'
    ];
  }

  @override
  UserQueryWhere get where {
    return _where;
  }

  @override
  UserQueryWhere newWhereClause() {
    return UserQueryWhere(this);
  }

  static User parseRow(List row) {
    if (row.every((x) => x == null)) return null;
    var model = User(
        id: row[0].toString(),
        username: (row[1] as String),
        password: (row[2] as String),
        name: (row[3] as String),
        email: (row[4] as String),
        createdAt: (row[5] as DateTime),
        updatedAt: (row[6] as DateTime));
    return model;
  }

  @override
  deserialize(List row) {
    return parseRow(row);
  }
}

class UserQueryWhere extends QueryWhere {
  UserQueryWhere(UserQuery query)
      : id = NumericSqlExpressionBuilder<int>(query, 'id'),
        username = StringSqlExpressionBuilder(query, 'username'),
        password = StringSqlExpressionBuilder(query, 'password'),
        name = StringSqlExpressionBuilder(query, 'name'),
        email = StringSqlExpressionBuilder(query, 'email'),
        createdAt = DateTimeSqlExpressionBuilder(query, 'created_at'),
        updatedAt = DateTimeSqlExpressionBuilder(query, 'updated_at');

  final NumericSqlExpressionBuilder<int> id;

  final StringSqlExpressionBuilder username;

  final StringSqlExpressionBuilder password;

  final StringSqlExpressionBuilder name;

  final StringSqlExpressionBuilder email;

  final DateTimeSqlExpressionBuilder createdAt;

  final DateTimeSqlExpressionBuilder updatedAt;

  @override
  get expressionBuilders {
    return [id, username, password, name, email, createdAt, updatedAt];
  }
}

class UserQueryValues extends MapQueryValues {
  @override
  get casts {
    return {};
  }

  String get id {
    return (values['id'] as String);
  }

  set id(String value) => values['id'] = value;
  String get username {
    return (values['username'] as String);
  }

  set username(String value) => values['username'] = value;
  String get password {
    return (values['password'] as String);
  }

  set password(String value) => values['password'] = value;
  String get name {
    return (values['name'] as String);
  }

  set name(String value) => values['name'] = value;
  String get email {
    return (values['email'] as String);
  }

  set email(String value) => values['email'] = value;
  DateTime get createdAt {
    return (values['created_at'] as DateTime);
  }

  set createdAt(DateTime value) => values['created_at'] = value;
  DateTime get updatedAt {
    return (values['updated_at'] as DateTime);
  }

  set updatedAt(DateTime value) => values['updated_at'] = value;
  void copyFrom(User model) {
    username = model.username;
    password = model.password;
    name = model.name;
    email = model.email;
    createdAt = model.createdAt;
    updatedAt = model.updatedAt;
  }
}

// **************************************************************************
// JsonModelGenerator
// **************************************************************************

@generatedSerializable
class ItemErrors extends _ItemErrors {
  ItemErrors({this.id, this.error, this.createdAt, this.updatedAt});

  @override
  final String id;

  @override
  final String error;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  ItemErrors copyWith(
      {String id, String error, DateTime createdAt, DateTime updatedAt}) {
    return ItemErrors(
        id: id ?? this.id,
        error: error ?? this.error,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _ItemErrors &&
        other.id == id &&
        other.error == error &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([id, error, createdAt, updatedAt]);
  }

  @override
  String toString() {
    return "ItemErrors(id=$id, error=$error, createdAt=$createdAt, updatedAt=$updatedAt)";
  }

  Map<String, dynamic> toJson() {
    return ItemErrorsSerializer.toMap(this);
  }
}

@generatedSerializable
class Item extends _Item {
  Item(
      {this.id,
      this.audio = false,
      this.downloadName,
      this.duration,
      List<_ItemErrors> errors,
      this.extension,
      this.fileName,
      this.filePath,
      this.fullFileAvailable = false,
      this.height,
      this.inTrash = false,
      this.length,
      List<_ItemMetadata> metadata,
      this.mime,
      this.perceptualHash,
      this.source,
      List<_Tag> tags,
      this.uploader,
      this.video = false,
      this.width,
      this.createdAt,
      this.updatedAt})
      : this.errors = List.unmodifiable(errors ?? []),
        this.metadata = List.unmodifiable(metadata ?? []),
        this.tags = List.unmodifiable(tags ?? []);

  @override
  final String id;

  @override
  final bool audio;

  @override
  final String downloadName;

  @override
  final int duration;

  @override
  final List<_ItemErrors> errors;

  @override
  final String extension;

  @override
  final String fileName;

  @override
  final String filePath;

  @override
  final bool fullFileAvailable;

  @override
  final int height;

  @override
  final bool inTrash;

  @override
  final int length;

  @override
  final List<_ItemMetadata> metadata;

  @override
  final String mime;

  @override
  final String perceptualHash;

  @override
  final String source;

  @override
  final List<_Tag> tags;

  @override
  final _User uploader;

  @override
  final bool video;

  @override
  final int width;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  Item copyWith(
      {String id,
      bool audio,
      String downloadName,
      int duration,
      List<_ItemErrors> errors,
      String extension,
      String fileName,
      String filePath,
      bool fullFileAvailable,
      int height,
      bool inTrash,
      int length,
      List<_ItemMetadata> metadata,
      String mime,
      String perceptualHash,
      String source,
      List<_Tag> tags,
      _User uploader,
      bool video,
      int width,
      DateTime createdAt,
      DateTime updatedAt}) {
    return Item(
        id: id ?? this.id,
        audio: audio ?? this.audio,
        downloadName: downloadName ?? this.downloadName,
        duration: duration ?? this.duration,
        errors: errors ?? this.errors,
        extension: extension ?? this.extension,
        fileName: fileName ?? this.fileName,
        filePath: filePath ?? this.filePath,
        fullFileAvailable: fullFileAvailable ?? this.fullFileAvailable,
        height: height ?? this.height,
        inTrash: inTrash ?? this.inTrash,
        length: length ?? this.length,
        metadata: metadata ?? this.metadata,
        mime: mime ?? this.mime,
        perceptualHash: perceptualHash ?? this.perceptualHash,
        source: source ?? this.source,
        tags: tags ?? this.tags,
        uploader: uploader ?? this.uploader,
        video: video ?? this.video,
        width: width ?? this.width,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _Item &&
        other.id == id &&
        other.audio == audio &&
        other.downloadName == downloadName &&
        other.duration == duration &&
        ListEquality<_ItemErrors>(DefaultEquality<_ItemErrors>())
            .equals(other.errors, errors) &&
        other.extension == extension &&
        other.fileName == fileName &&
        other.filePath == filePath &&
        other.fullFileAvailable == fullFileAvailable &&
        other.height == height &&
        other.inTrash == inTrash &&
        other.length == length &&
        ListEquality<_ItemMetadata>(DefaultEquality<_ItemMetadata>())
            .equals(other.metadata, metadata) &&
        other.mime == mime &&
        other.perceptualHash == perceptualHash &&
        other.source == source &&
        ListEquality<_Tag>(DefaultEquality<_Tag>()).equals(other.tags, tags) &&
        other.uploader == uploader &&
        other.video == video &&
        other.width == width &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([
      id,
      audio,
      downloadName,
      duration,
      errors,
      extension,
      fileName,
      filePath,
      fullFileAvailable,
      height,
      inTrash,
      length,
      metadata,
      mime,
      perceptualHash,
      source,
      tags,
      uploader,
      video,
      width,
      createdAt,
      updatedAt
    ]);
  }

  @override
  String toString() {
    return "Item(id=$id, audio=$audio, downloadName=$downloadName, duration=$duration, errors=$errors, extension=$extension, fileName=$fileName, filePath=$filePath, fullFileAvailable=$fullFileAvailable, height=$height, inTrash=$inTrash, length=$length, metadata=$metadata, mime=$mime, perceptualHash=$perceptualHash, source=$source, tags=$tags, uploader=$uploader, video=$video, width=$width, createdAt=$createdAt, updatedAt=$updatedAt)";
  }

  Map<String, dynamic> toJson() {
    return ItemSerializer.toMap(this);
  }
}

@generatedSerializable
class ItemMetadata extends _ItemMetadata {
  ItemMetadata(
      {this.id, this.name, this.value, this.createdAt, this.updatedAt});

  @override
  final String id;

  @override
  final String name;

  @override
  final String value;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  ItemMetadata copyWith(
      {String id,
      String name,
      String value,
      DateTime createdAt,
      DateTime updatedAt}) {
    return ItemMetadata(
        id: id ?? this.id,
        name: name ?? this.name,
        value: value ?? this.value,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _ItemMetadata &&
        other.id == id &&
        other.name == name &&
        other.value == value &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([id, name, value, createdAt, updatedAt]);
  }

  @override
  String toString() {
    return "ItemMetadata(id=$id, name=$name, value=$value, createdAt=$createdAt, updatedAt=$updatedAt)";
  }

  Map<String, dynamic> toJson() {
    return ItemMetadataSerializer.toMap(this);
  }
}

@generatedSerializable
class ItemTag extends _ItemTag {
  ItemTag({this.id, this.item, this.tag, this.createdAt, this.updatedAt});

  @override
  final String id;

  @override
  final _Item item;

  @override
  final _Tag tag;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  ItemTag copyWith(
      {String id,
      _Item item,
      _Tag tag,
      DateTime createdAt,
      DateTime updatedAt}) {
    return ItemTag(
        id: id ?? this.id,
        item: item ?? this.item,
        tag: tag ?? this.tag,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _ItemTag &&
        other.id == id &&
        other.item == item &&
        other.tag == tag &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([id, item, tag, createdAt, updatedAt]);
  }

  @override
  String toString() {
    return "ItemTag(id=$id, item=$item, tag=$tag, createdAt=$createdAt, updatedAt=$updatedAt)";
  }

  Map<String, dynamic> toJson() {
    return ItemTagSerializer.toMap(this);
  }
}

@generatedSerializable
class Tag extends _Tag {
  Tag(
      {this.id,
      this.category,
      this.count = 0,
      this.name,
      this.redirect,
      this.createdAt,
      this.updatedAt});

  @override
  final String id;

  @override
  final _TagCategory category;

  @override
  final int count;

  @override
  final String name;

  @override
  final _Tag redirect;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  Tag copyWith(
      {String id,
      _TagCategory category,
      int count,
      String name,
      _Tag redirect,
      DateTime createdAt,
      DateTime updatedAt}) {
    return Tag(
        id: id ?? this.id,
        category: category ?? this.category,
        count: count ?? this.count,
        name: name ?? this.name,
        redirect: redirect ?? this.redirect,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _Tag &&
        other.id == id &&
        other.category == category &&
        other.count == count &&
        other.name == name &&
        other.redirect == redirect &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects(
        [id, category, count, name, redirect, createdAt, updatedAt]);
  }

  @override
  String toString() {
    return "Tag(id=$id, category=$category, count=$count, name=$name, redirect=$redirect, createdAt=$createdAt, updatedAt=$updatedAt)";
  }

  Map<String, dynamic> toJson() {
    return TagSerializer.toMap(this);
  }
}

@generatedSerializable
class TagCategory extends _TagCategory {
  TagCategory({this.id, this.color, this.name, this.createdAt, this.updatedAt});

  @override
  final String id;

  @override
  final String color;

  @override
  final String name;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  TagCategory copyWith(
      {String id,
      String color,
      String name,
      DateTime createdAt,
      DateTime updatedAt}) {
    return TagCategory(
        id: id ?? this.id,
        color: color ?? this.color,
        name: name ?? this.name,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _TagCategory &&
        other.id == id &&
        other.color == color &&
        other.name == name &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([id, color, name, createdAt, updatedAt]);
  }

  @override
  String toString() {
    return "TagCategory(id=$id, color=$color, name=$name, createdAt=$createdAt, updatedAt=$updatedAt)";
  }

  Map<String, dynamic> toJson() {
    return TagCategorySerializer.toMap(this);
  }
}

@generatedSerializable
class User extends _User {
  User(
      {this.id,
      this.username,
      this.password,
      this.name,
      this.email,
      this.createdAt,
      this.updatedAt});

  @override
  final String id;

  @override
  final String username;

  @override
  final String password;

  @override
  final String name;

  @override
  final String email;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  User copyWith(
      {String id,
      String username,
      String password,
      String name,
      String email,
      DateTime createdAt,
      DateTime updatedAt}) {
    return User(
        id: id ?? this.id,
        username: username ?? this.username,
        password: password ?? this.password,
        name: name ?? this.name,
        email: email ?? this.email,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _User &&
        other.id == id &&
        other.username == username &&
        other.password == password &&
        other.name == name &&
        other.email == email &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects(
        [id, username, password, name, email, createdAt, updatedAt]);
  }

  @override
  String toString() {
    return "User(id=$id, username=$username, password=$password, name=$name, email=$email, createdAt=$createdAt, updatedAt=$updatedAt)";
  }

  Map<String, dynamic> toJson() {
    return UserSerializer.toMap(this);
  }
}

// **************************************************************************
// SerializerGenerator
// **************************************************************************

const ItemErrorsSerializer itemErrorsSerializer = ItemErrorsSerializer();

class ItemErrorsEncoder extends Converter<ItemErrors, Map> {
  const ItemErrorsEncoder();

  @override
  Map convert(ItemErrors model) => ItemErrorsSerializer.toMap(model);
}

class ItemErrorsDecoder extends Converter<Map, ItemErrors> {
  const ItemErrorsDecoder();

  @override
  ItemErrors convert(Map map) => ItemErrorsSerializer.fromMap(map);
}

class ItemErrorsSerializer extends Codec<ItemErrors, Map> {
  const ItemErrorsSerializer();

  @override
  get encoder => const ItemErrorsEncoder();
  @override
  get decoder => const ItemErrorsDecoder();
  static ItemErrors fromMap(Map map) {
    return ItemErrors(
        id: map['id'] as String,
        error: map['error'] as String,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_ItemErrors model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'error': model.error,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class ItemErrorsFields {
  static const List<String> allFields = <String>[
    id,
    error,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String error = 'error';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

const ItemSerializer itemSerializer = ItemSerializer();

class ItemEncoder extends Converter<Item, Map> {
  const ItemEncoder();

  @override
  Map convert(Item model) => ItemSerializer.toMap(model);
}

class ItemDecoder extends Converter<Map, Item> {
  const ItemDecoder();

  @override
  Item convert(Map map) => ItemSerializer.fromMap(map);
}

class ItemSerializer extends Codec<Item, Map> {
  const ItemSerializer();

  @override
  get encoder => const ItemEncoder();
  @override
  get decoder => const ItemDecoder();
  static Item fromMap(Map map) {
    return Item(
        id: map['id'] as String,
        audio: map['audio'] as bool ?? false,
        downloadName: map['download_name'] as String,
        duration: map['duration'] as int,
        errors: map['errors'] is Iterable
            ? List.unmodifiable(((map['errors'] as Iterable).where((x) => x is Map))
                .cast<Map>()
                .map(ItemErrorsSerializer.fromMap))
            : null,
        extension: map['extension'] as String,
        fileName: map['file_name'] as String,
        filePath: map['file_path'] as String,
        fullFileAvailable: map['full_file_available'] as bool ?? false,
        height: map['height'] as int,
        inTrash: map['in_trash'] as bool ?? false,
        length: map['length'] as int,
        metadata: map['metadata'] is Iterable
            ? List.unmodifiable(((map['metadata'] as Iterable).where((x) => x is Map))
                .cast<Map>()
                .map(ItemMetadataSerializer.fromMap))
            : null,
        mime: map['mime'] as String,
        perceptualHash: map['perceptual_hash'] as String,
        source: map['source'] as String,
        tags: map['tags'] is Iterable
            ? List.unmodifiable(((map['tags'] as Iterable).where((x) => x is Map))
                .cast<Map>()
                .map(TagSerializer.fromMap))
            : null,
        uploader: map['uploader'] != null
            ? UserSerializer.fromMap(map['uploader'] as Map)
            : null,
        video: map['video'] as bool ?? false,
        width: map['width'] as int,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null ? (map['updated_at'] is DateTime ? (map['updated_at'] as DateTime) : DateTime.parse(map['updated_at'].toString())) : null);
  }

  static Map<String, dynamic> toMap(_Item model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'audio': model.audio,
      'download_name': model.downloadName,
      'duration': model.duration,
      'errors':
          model.errors?.map((m) => ItemErrorsSerializer.toMap(m))?.toList(),
      'extension': model.extension,
      'file_name': model.fileName,
      'file_path': model.filePath,
      'full_file_available': model.fullFileAvailable,
      'height': model.height,
      'in_trash': model.inTrash,
      'length': model.length,
      'metadata':
          model.metadata?.map((m) => ItemMetadataSerializer.toMap(m))?.toList(),
      'mime': model.mime,
      'perceptual_hash': model.perceptualHash,
      'source': model.source,
      'tags': model.tags?.map((m) => TagSerializer.toMap(m))?.toList(),
      'uploader': UserSerializer.toMap(model.uploader),
      'video': model.video,
      'width': model.width,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class ItemFields {
  static const List<String> allFields = <String>[
    id,
    audio,
    downloadName,
    duration,
    errors,
    extension,
    fileName,
    filePath,
    fullFileAvailable,
    height,
    inTrash,
    length,
    metadata,
    mime,
    perceptualHash,
    source,
    tags,
    uploader,
    video,
    width,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String audio = 'audio';

  static const String downloadName = 'download_name';

  static const String duration = 'duration';

  static const String errors = 'errors';

  static const String extension = 'extension';

  static const String fileName = 'file_name';

  static const String filePath = 'file_path';

  static const String fullFileAvailable = 'full_file_available';

  static const String height = 'height';

  static const String inTrash = 'in_trash';

  static const String length = 'length';

  static const String metadata = 'metadata';

  static const String mime = 'mime';

  static const String perceptualHash = 'perceptual_hash';

  static const String source = 'source';

  static const String tags = 'tags';

  static const String uploader = 'uploader';

  static const String video = 'video';

  static const String width = 'width';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

const ItemMetadataSerializer itemMetadataSerializer = ItemMetadataSerializer();

class ItemMetadataEncoder extends Converter<ItemMetadata, Map> {
  const ItemMetadataEncoder();

  @override
  Map convert(ItemMetadata model) => ItemMetadataSerializer.toMap(model);
}

class ItemMetadataDecoder extends Converter<Map, ItemMetadata> {
  const ItemMetadataDecoder();

  @override
  ItemMetadata convert(Map map) => ItemMetadataSerializer.fromMap(map);
}

class ItemMetadataSerializer extends Codec<ItemMetadata, Map> {
  const ItemMetadataSerializer();

  @override
  get encoder => const ItemMetadataEncoder();
  @override
  get decoder => const ItemMetadataDecoder();
  static ItemMetadata fromMap(Map map) {
    return ItemMetadata(
        id: map['id'] as String,
        name: map['name'] as String,
        value: map['value'] as String,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_ItemMetadata model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'name': model.name,
      'value': model.value,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class ItemMetadataFields {
  static const List<String> allFields = <String>[
    id,
    name,
    value,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String name = 'name';

  static const String value = 'value';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

const ItemTagSerializer itemTagSerializer = ItemTagSerializer();

class ItemTagEncoder extends Converter<ItemTag, Map> {
  const ItemTagEncoder();

  @override
  Map convert(ItemTag model) => ItemTagSerializer.toMap(model);
}

class ItemTagDecoder extends Converter<Map, ItemTag> {
  const ItemTagDecoder();

  @override
  ItemTag convert(Map map) => ItemTagSerializer.fromMap(map);
}

class ItemTagSerializer extends Codec<ItemTag, Map> {
  const ItemTagSerializer();

  @override
  get encoder => const ItemTagEncoder();
  @override
  get decoder => const ItemTagDecoder();
  static ItemTag fromMap(Map map) {
    return ItemTag(
        id: map['id'] as String,
        item: map['item'] != null
            ? ItemSerializer.fromMap(map['item'] as Map)
            : null,
        tag: map['tag'] != null
            ? TagSerializer.fromMap(map['tag'] as Map)
            : null,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_ItemTag model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'item': ItemSerializer.toMap(model.item),
      'tag': TagSerializer.toMap(model.tag),
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class ItemTagFields {
  static const List<String> allFields = <String>[
    id,
    item,
    tag,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String item = 'item';

  static const String tag = 'tag';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

const TagSerializer tagSerializer = TagSerializer();

class TagEncoder extends Converter<Tag, Map> {
  const TagEncoder();

  @override
  Map convert(Tag model) => TagSerializer.toMap(model);
}

class TagDecoder extends Converter<Map, Tag> {
  const TagDecoder();

  @override
  Tag convert(Map map) => TagSerializer.fromMap(map);
}

class TagSerializer extends Codec<Tag, Map> {
  const TagSerializer();

  @override
  get encoder => const TagEncoder();
  @override
  get decoder => const TagDecoder();
  static Tag fromMap(Map map) {
    return Tag(
        id: map['id'] as String,
        category: map['category'] != null
            ? TagCategorySerializer.fromMap(map['category'] as Map)
            : null,
        count: map['count'] as int ?? 0,
        name: map['name'] as String,
        redirect: map['redirect'] != null
            ? TagSerializer.fromMap(map['redirect'] as Map)
            : null,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_Tag model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'category': TagCategorySerializer.toMap(model.category),
      'count': model.count,
      'name': model.name,
      'redirect': TagSerializer.toMap(model.redirect),
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class TagFields {
  static const List<String> allFields = <String>[
    id,
    category,
    count,
    name,
    redirect,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String category = 'category';

  static const String count = 'count';

  static const String name = 'name';

  static const String redirect = 'redirect';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

const TagCategorySerializer tagCategorySerializer = TagCategorySerializer();

class TagCategoryEncoder extends Converter<TagCategory, Map> {
  const TagCategoryEncoder();

  @override
  Map convert(TagCategory model) => TagCategorySerializer.toMap(model);
}

class TagCategoryDecoder extends Converter<Map, TagCategory> {
  const TagCategoryDecoder();

  @override
  TagCategory convert(Map map) => TagCategorySerializer.fromMap(map);
}

class TagCategorySerializer extends Codec<TagCategory, Map> {
  const TagCategorySerializer();

  @override
  get encoder => const TagCategoryEncoder();
  @override
  get decoder => const TagCategoryDecoder();
  static TagCategory fromMap(Map map) {
    return TagCategory(
        id: map['id'] as String,
        color: map['color'] as String,
        name: map['name'] as String,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_TagCategory model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'color': model.color,
      'name': model.name,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class TagCategoryFields {
  static const List<String> allFields = <String>[
    id,
    color,
    name,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String color = 'color';

  static const String name = 'name';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

const UserSerializer userSerializer = UserSerializer();

class UserEncoder extends Converter<User, Map> {
  const UserEncoder();

  @override
  Map convert(User model) => UserSerializer.toMap(model);
}

class UserDecoder extends Converter<Map, User> {
  const UserDecoder();

  @override
  User convert(Map map) => UserSerializer.fromMap(map);
}

class UserSerializer extends Codec<User, Map> {
  const UserSerializer();

  @override
  get encoder => const UserEncoder();
  @override
  get decoder => const UserDecoder();
  static User fromMap(Map map) {
    return User(
        id: map['id'] as String,
        username: map['username'] as String,
        password: map['password'] as String,
        name: map['name'] as String,
        email: map['email'] as String,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_User model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'username': model.username,
      'password': model.password,
      'name': model.name,
      'email': model.email,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class UserFields {
  static const List<String> allFields = <String>[
    id,
    username,
    password,
    name,
    email,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String username = 'username';

  static const String password = 'password';

  static const String name = 'name';

  static const String email = 'email';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}
