// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'import.dart';

// **************************************************************************
// MigrationGenerator
// **************************************************************************

class ImportBatchMigration extends Migration {
  @override
  up(Schema schema) {
    schema.create('import_batches', (table) {
      table.serial('id')..primaryKey();
      table.timeStamp('timestamp')..notNull();
      table.varChar('source')..notNull();
      table.boolean('finished')
        ..defaultsTo(false)
        ..notNull();
      table.timeStamp('created_at');
      table.timeStamp('updated_at');
    });
  }

  @override
  down(Schema schema) {
    schema.drop('import_batches', cascade: true);
  }
}

class ImportBatchCountMigration extends Migration {
  @override
  up(Schema schema) {
    schema.create('import_batch_counts', (table) {
      table.serial('id')..primaryKey();
      table.varChar('result')..notNull();
      table.integer('count')..notNull();
      table.timeStamp('created_at');
      table.timeStamp('updated_at');
      table.integer('import_batch_id').references('import_batches', 'id');
    });
  }

  @override
  down(Schema schema) {
    schema.drop('import_batch_counts');
  }
}

// **************************************************************************
// OrmGenerator
// **************************************************************************

class ImportBatchQuery extends Query<ImportBatch, ImportBatchQueryWhere> {
  ImportBatchQuery({Set<String> trampoline}) {
    trampoline ??= Set();
    trampoline.add(tableName);
    _where = ImportBatchQueryWhere(this);
    leftJoin(
        ImportBatchCountQuery(trampoline: trampoline), 'id', 'import_batch_id',
        additionalFields: const [
          'id',
          'import_batch_id',
          'result',
          'count',
          'created_at',
          'updated_at'
        ],
        trampoline: trampoline);
  }

  @override
  final ImportBatchQueryValues values = ImportBatchQueryValues();

  ImportBatchQueryWhere _where;

  @override
  get casts {
    return {};
  }

  @override
  get tableName {
    return 'import_batches';
  }

  @override
  get fields {
    return const [
      'id',
      'timestamp',
      'source',
      'finished',
      'created_at',
      'updated_at'
    ];
  }

  @override
  ImportBatchQueryWhere get where {
    return _where;
  }

  @override
  ImportBatchQueryWhere newWhereClause() {
    return ImportBatchQueryWhere(this);
  }

  static ImportBatch parseRow(List row) {
    if (row.every((x) => x == null)) return null;
    var model = ImportBatch(
        id: row[0].toString(),
        timestamp: (row[1] as DateTime),
        source: (row[2] as String),
        finished: (row[3] as bool),
        createdAt: (row[4] as DateTime),
        updatedAt: (row[5] as DateTime));
    if (row.length > 6) {
      model = model.copyWith(
          counts: [ImportBatchCountQuery.parseRow(row.skip(6).take(6).toList())]
              .where((x) => x != null)
              .toList());
    }
    return model;
  }

  @override
  deserialize(List row) {
    return parseRow(row);
  }

  @override
  get(QueryExecutor executor) {
    return super.get(executor).then((result) {
      return result.fold<List<ImportBatch>>([], (out, model) {
        var idx = out.indexWhere((m) => m.id == model.id);

        if (idx == -1) {
          return out..add(model);
        } else {
          var l = out[idx];
          return out
            ..[idx] = l.copyWith(
                counts: List<_ImportBatchCount>.from(l.counts ?? [])
                  ..addAll(model.counts ?? []));
        }
      });
    });
  }

  @override
  update(QueryExecutor executor) {
    return super.update(executor).then((result) {
      return result.fold<List<ImportBatch>>([], (out, model) {
        var idx = out.indexWhere((m) => m.id == model.id);

        if (idx == -1) {
          return out..add(model);
        } else {
          var l = out[idx];
          return out
            ..[idx] = l.copyWith(
                counts: List<_ImportBatchCount>.from(l.counts ?? [])
                  ..addAll(model.counts ?? []));
        }
      });
    });
  }

  @override
  delete(QueryExecutor executor) {
    return super.delete(executor).then((result) {
      return result.fold<List<ImportBatch>>([], (out, model) {
        var idx = out.indexWhere((m) => m.id == model.id);

        if (idx == -1) {
          return out..add(model);
        } else {
          var l = out[idx];
          return out
            ..[idx] = l.copyWith(
                counts: List<_ImportBatchCount>.from(l.counts ?? [])
                  ..addAll(model.counts ?? []));
        }
      });
    });
  }
}

class ImportBatchQueryWhere extends QueryWhere {
  ImportBatchQueryWhere(ImportBatchQuery query)
      : id = NumericSqlExpressionBuilder<int>(query, 'id'),
        timestamp = DateTimeSqlExpressionBuilder(query, 'timestamp'),
        source = StringSqlExpressionBuilder(query, 'source'),
        finished = BooleanSqlExpressionBuilder(query, 'finished'),
        createdAt = DateTimeSqlExpressionBuilder(query, 'created_at'),
        updatedAt = DateTimeSqlExpressionBuilder(query, 'updated_at');

  final NumericSqlExpressionBuilder<int> id;

  final DateTimeSqlExpressionBuilder timestamp;

  final StringSqlExpressionBuilder source;

  final BooleanSqlExpressionBuilder finished;

  final DateTimeSqlExpressionBuilder createdAt;

  final DateTimeSqlExpressionBuilder updatedAt;

  @override
  get expressionBuilders {
    return [id, timestamp, source, finished, createdAt, updatedAt];
  }
}

class ImportBatchQueryValues extends MapQueryValues {
  @override
  get casts {
    return {};
  }

  String get id {
    return (values['id'] as String);
  }

  set id(String value) => values['id'] = value;
  DateTime get timestamp {
    return (values['timestamp'] as DateTime);
  }

  set timestamp(DateTime value) => values['timestamp'] = value;
  String get source {
    return (values['source'] as String);
  }

  set source(String value) => values['source'] = value;
  bool get finished {
    return (values['finished'] as bool);
  }

  set finished(bool value) => values['finished'] = value;
  DateTime get createdAt {
    return (values['created_at'] as DateTime);
  }

  set createdAt(DateTime value) => values['created_at'] = value;
  DateTime get updatedAt {
    return (values['updated_at'] as DateTime);
  }

  set updatedAt(DateTime value) => values['updated_at'] = value;
  void copyFrom(ImportBatch model) {
    timestamp = model.timestamp;
    source = model.source;
    finished = model.finished;
    createdAt = model.createdAt;
    updatedAt = model.updatedAt;
  }
}

class ImportBatchCountQuery
    extends Query<ImportBatchCount, ImportBatchCountQueryWhere> {
  ImportBatchCountQuery({Set<String> trampoline}) {
    trampoline ??= Set();
    trampoline.add(tableName);
    _where = ImportBatchCountQueryWhere(this);
    leftJoin('import_batches', 'import_batch_id', 'id',
        additionalFields: const [
          'id',
          'timestamp',
          'source',
          'finished',
          'created_at',
          'updated_at'
        ],
        trampoline: trampoline);
  }

  @override
  final ImportBatchCountQueryValues values = ImportBatchCountQueryValues();

  ImportBatchCountQueryWhere _where;

  @override
  get casts {
    return {};
  }

  @override
  get tableName {
    return 'import_batch_counts';
  }

  @override
  get fields {
    return const [
      'id',
      'import_batch_id',
      'result',
      'count',
      'created_at',
      'updated_at'
    ];
  }

  @override
  ImportBatchCountQueryWhere get where {
    return _where;
  }

  @override
  ImportBatchCountQueryWhere newWhereClause() {
    return ImportBatchCountQueryWhere(this);
  }

  static ImportBatchCount parseRow(List row) {
    if (row.every((x) => x == null)) return null;
    var model = ImportBatchCount(
        id: row[0].toString(),
        result: (row[2] as String),
        count: (row[3] as int),
        createdAt: (row[4] as DateTime),
        updatedAt: (row[5] as DateTime));
    if (row.length > 6) {
      model = model.copyWith(
          importBatch: ImportBatchQuery.parseRow(row.skip(6).take(6).toList()));
    }
    return model;
  }

  @override
  deserialize(List row) {
    return parseRow(row);
  }
}

class ImportBatchCountQueryWhere extends QueryWhere {
  ImportBatchCountQueryWhere(ImportBatchCountQuery query)
      : id = NumericSqlExpressionBuilder<int>(query, 'id'),
        importBatchId =
            NumericSqlExpressionBuilder<int>(query, 'import_batch_id'),
        result = StringSqlExpressionBuilder(query, 'result'),
        count = NumericSqlExpressionBuilder<int>(query, 'count'),
        createdAt = DateTimeSqlExpressionBuilder(query, 'created_at'),
        updatedAt = DateTimeSqlExpressionBuilder(query, 'updated_at');

  final NumericSqlExpressionBuilder<int> id;

  final NumericSqlExpressionBuilder<int> importBatchId;

  final StringSqlExpressionBuilder result;

  final NumericSqlExpressionBuilder<int> count;

  final DateTimeSqlExpressionBuilder createdAt;

  final DateTimeSqlExpressionBuilder updatedAt;

  @override
  get expressionBuilders {
    return [id, importBatchId, result, count, createdAt, updatedAt];
  }
}

class ImportBatchCountQueryValues extends MapQueryValues {
  @override
  get casts {
    return {};
  }

  String get id {
    return (values['id'] as String);
  }

  set id(String value) => values['id'] = value;
  int get importBatchId {
    return (values['import_batch_id'] as int);
  }

  set importBatchId(int value) => values['import_batch_id'] = value;
  String get result {
    return (values['result'] as String);
  }

  set result(String value) => values['result'] = value;
  int get count {
    return (values['count'] as int);
  }

  set count(int value) => values['count'] = value;
  DateTime get createdAt {
    return (values['created_at'] as DateTime);
  }

  set createdAt(DateTime value) => values['created_at'] = value;
  DateTime get updatedAt {
    return (values['updated_at'] as DateTime);
  }

  set updatedAt(DateTime value) => values['updated_at'] = value;
  void copyFrom(ImportBatchCount model) {
    result = model.result;
    count = model.count;
    createdAt = model.createdAt;
    updatedAt = model.updatedAt;
    if (model.importBatch != null) {
      values['import_batch_id'] = model.importBatch.id;
    }
  }
}

// **************************************************************************
// JsonModelGenerator
// **************************************************************************

@generatedSerializable
class ImportBatch extends _ImportBatch {
  ImportBatch(
      {this.id,
      this.timestamp,
      this.source,
      List<_ImportBatchCount> counts,
      this.finished = false,
      this.createdAt,
      this.updatedAt})
      : this.counts = List.unmodifiable(counts ?? []);

  @override
  final String id;

  @override
  final DateTime timestamp;

  @override
  final String source;

  @override
  final List<_ImportBatchCount> counts;

  @override
  final bool finished;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  ImportBatch copyWith(
      {String id,
      DateTime timestamp,
      String source,
      List<_ImportBatchCount> counts,
      bool finished,
      DateTime createdAt,
      DateTime updatedAt}) {
    return ImportBatch(
        id: id ?? this.id,
        timestamp: timestamp ?? this.timestamp,
        source: source ?? this.source,
        counts: counts ?? this.counts,
        finished: finished ?? this.finished,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _ImportBatch &&
        other.id == id &&
        other.timestamp == timestamp &&
        other.source == source &&
        ListEquality<_ImportBatchCount>(DefaultEquality<_ImportBatchCount>())
            .equals(other.counts, counts) &&
        other.finished == finished &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects(
        [id, timestamp, source, counts, finished, createdAt, updatedAt]);
  }

  @override
  String toString() {
    return "ImportBatch(id=$id, timestamp=$timestamp, source=$source, counts=$counts, finished=$finished, createdAt=$createdAt, updatedAt=$updatedAt)";
  }

  Map<String, dynamic> toJson() {
    return ImportBatchSerializer.toMap(this);
  }
}

@generatedSerializable
class ImportBatchCount extends _ImportBatchCount {
  ImportBatchCount(
      {this.id,
      this.importBatch,
      this.result,
      this.count,
      this.createdAt,
      this.updatedAt});

  @override
  final String id;

  @override
  final _ImportBatch importBatch;

  @override
  final String result;

  @override
  final int count;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  ImportBatchCount copyWith(
      {String id,
      _ImportBatch importBatch,
      String result,
      int count,
      DateTime createdAt,
      DateTime updatedAt}) {
    return ImportBatchCount(
        id: id ?? this.id,
        importBatch: importBatch ?? this.importBatch,
        result: result ?? this.result,
        count: count ?? this.count,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _ImportBatchCount &&
        other.id == id &&
        other.importBatch == importBatch &&
        other.result == result &&
        other.count == count &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([id, importBatch, result, count, createdAt, updatedAt]);
  }

  @override
  String toString() {
    return "ImportBatchCount(id=$id, importBatch=$importBatch, result=$result, count=$count, createdAt=$createdAt, updatedAt=$updatedAt)";
  }

  Map<String, dynamic> toJson() {
    return ImportBatchCountSerializer.toMap(this);
  }
}

// **************************************************************************
// SerializerGenerator
// **************************************************************************

const ImportBatchSerializer importBatchSerializer = ImportBatchSerializer();

class ImportBatchEncoder extends Converter<ImportBatch, Map> {
  const ImportBatchEncoder();

  @override
  Map convert(ImportBatch model) => ImportBatchSerializer.toMap(model);
}

class ImportBatchDecoder extends Converter<Map, ImportBatch> {
  const ImportBatchDecoder();

  @override
  ImportBatch convert(Map map) => ImportBatchSerializer.fromMap(map);
}

class ImportBatchSerializer extends Codec<ImportBatch, Map> {
  const ImportBatchSerializer();

  @override
  get encoder => const ImportBatchEncoder();
  @override
  get decoder => const ImportBatchDecoder();
  static ImportBatch fromMap(Map map) {
    return ImportBatch(
        id: map['id'] as String,
        timestamp: map['timestamp'] != null
            ? (map['timestamp'] is DateTime
                ? (map['timestamp'] as DateTime)
                : DateTime.parse(map['timestamp'].toString()))
            : null,
        source: map['source'] as String,
        counts: map['counts'] is Iterable
            ? List.unmodifiable(
                ((map['counts'] as Iterable).where((x) => x is Map))
                    .cast<Map>()
                    .map(ImportBatchCountSerializer.fromMap))
            : null,
        finished: map['finished'] as bool ?? false,
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

  static Map<String, dynamic> toMap(_ImportBatch model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'timestamp': model.timestamp?.toIso8601String(),
      'source': model.source,
      'counts': model.counts
          ?.map((m) => ImportBatchCountSerializer.toMap(m))
          ?.toList(),
      'finished': model.finished,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class ImportBatchFields {
  static const List<String> allFields = <String>[
    id,
    timestamp,
    source,
    counts,
    finished,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String timestamp = 'timestamp';

  static const String source = 'source';

  static const String counts = 'counts';

  static const String finished = 'finished';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

const ImportBatchCountSerializer importBatchCountSerializer =
    ImportBatchCountSerializer();

class ImportBatchCountEncoder extends Converter<ImportBatchCount, Map> {
  const ImportBatchCountEncoder();

  @override
  Map convert(ImportBatchCount model) =>
      ImportBatchCountSerializer.toMap(model);
}

class ImportBatchCountDecoder extends Converter<Map, ImportBatchCount> {
  const ImportBatchCountDecoder();

  @override
  ImportBatchCount convert(Map map) => ImportBatchCountSerializer.fromMap(map);
}

class ImportBatchCountSerializer extends Codec<ImportBatchCount, Map> {
  const ImportBatchCountSerializer();

  @override
  get encoder => const ImportBatchCountEncoder();
  @override
  get decoder => const ImportBatchCountDecoder();
  static ImportBatchCount fromMap(Map map) {
    return ImportBatchCount(
        id: map['id'] as String,
        importBatch: map['import_batch'] != null
            ? ImportBatchSerializer.fromMap(map['import_batch'] as Map)
            : null,
        result: map['result'] as String,
        count: map['count'] as int,
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

  static Map<String, dynamic> toMap(_ImportBatchCount model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'import_batch': ImportBatchSerializer.toMap(model.importBatch),
      'result': model.result,
      'count': model.count,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class ImportBatchCountFields {
  static const List<String> allFields = <String>[
    id,
    importBatch,
    result,
    count,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String importBatch = 'import_batch';

  static const String result = 'result';

  static const String count = 'count';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}
