import 'package:angel_migration/angel_migration.dart';
import 'package:angel_orm/angel_orm.dart';
import 'package:angel_serialize/angel_serialize.dart';

part 'model.g.dart';

const int maxNameLength = 200;

@orm
@serializable
abstract class _ItemErrors extends Model {
  @Column(isNullable: false)
  String error;
}

@orm
@serializable
abstract class _Item extends Model {
  @Column(isNullable: false)
  @DefaultsTo(false)
  bool get audio;

  @Column(isNullable: false)
  String get downloadName;

  int get duration;

  @HasMany()
  List<_ItemErrors> get errors;

  @Column(isNullable: false)
  String get extension;

  @Column(isNullable: false)
  String get fileName;

  @Column(isNullable: false)
  String get filePath;

  @DefaultsTo(false)
  bool get fullFileAvailable;

  int get height;

  @Column(isNullable: false)
  @DefaultsTo(false)
  bool get inTrash;

  int get length;

  @hasMany
  List<_ItemMetadata> get metadata;

  @Column(isNullable: false)
  String get mime;

  String get perceptualHash;

  String get source;

  @ManyToMany(_ItemTag)
  List<_Tag> get tags;

  @BelongsTo()
  _User get uploader;

  @Column(isNullable: false)
  @DefaultsTo(false)
  bool get video;

  int get width;
}

@orm
@serializable
abstract class _ItemMetadata extends Model {
  @Column(
      isNullable: false,
      indexType: IndexType.standardIndex,
      length: maxNameLength)
  String get name;

  @Column(isNullable: false)
  String get value;
}

@orm
@serializable
abstract class _ItemTag extends Model {
  @BelongsTo()
  _Item get item;

  @BelongsTo()
  _Tag get tag;
}

@orm
@serializable
abstract class _Tag extends Model {
  static const String categoryDeliminator = ";";

  @BelongsTo()
  _TagCategory get category;

  @DefaultsTo(0)
  @Column(isNullable: false)
  int get count;

  String get fullName => formatTag(this);

  bool get hasCategory => this.category != null;

  @Column(
      isNullable: false,
      indexType: IndexType.standardIndex,
      length: maxNameLength)
  String get name;

  @BelongsTo()
  _Tag get redirect;

  @override
  bool operator ==(dynamic other) => equals(other as _Tag);

  bool equals(_Tag other) {
    if (name?.toLowerCase() == other.name?.toLowerCase()) {
      if ((!this.hasCategory && !other.hasCategory) ||
          category?.name?.toLowerCase() == other.category?.name?.toLowerCase())
        return true;
    }
    return false;
  }

  @override
  String toString() => fullName;

  static String formatTag(_Tag tag) {
    if (tag.hasCategory) {
      return "$tag.category$categoryDeliminator $tag.name";
    } else {
      return tag.name;
    }
  }
}

@orm
@serializable
abstract class _TagCategory extends Model {
  @Column(length: 10)
  String get color;
  @Column(isNullable: false, indexType: IndexType.unique, length: maxNameLength)
  String get name;
}

@orm
@serializable
abstract class _User extends Model {
  @Column(isNullable: false, indexType: IndexType.unique)
  String username;
  @Column(isNullable: false)
  String password;
  @Column(isNullable: false)
  String name;
  @Column(isNullable: false, indexType: IndexType.unique)
  String email;
}
