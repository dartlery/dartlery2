import 'package:angel_migration/angel_migration.dart';
import 'package:angel_orm/angel_orm.dart';
import 'package:angel_serialize/angel_serialize.dart';

part 'import.g.dart';


@orm
@serializable
abstract class _ImportBatch extends Model {
  @Column(isNullable: false)
  DateTime get timestamp;

  @Column(isNullable: false)
  String get source;

  @HasMany()
  List<_ImportBatchCount> get counts;

  @Column(isNullable: false)
  @DefaultsTo(false)
  bool get finished ;

//  void addImportResult(String result) {
//    if (!importCounts.containsKey(result)) importCounts[result] = 0;
//
//    importCounts[result]++;
//  }

}

@orm
@serializable
abstract class _ImportBatchCount extends Model {
  @Column(isNullable: false)
  @BelongsTo()
  _ImportBatch get importBatch;

  @Column(isNullable: false)
  String get result;
  @Column(isNullable: false)
  int get count;
}