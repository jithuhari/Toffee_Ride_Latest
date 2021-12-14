import 'package:hive/hive.dart';

@HiveType(typeId: 3)
class ModuleModel extends HiveObject {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? title;
  @HiveField(2)
  String? description;
  @HiveField(3)
  String? chapter;
  @HiveField(4)
  String? pkgSequenceNo;
  @HiveField(5)
  String? sequenceNo;

  ModuleModel(
      {this.id,
      this.title,
      this.description,
      this.chapter,
      this.pkgSequenceNo,
      this.sequenceNo});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      ModuleProvider.id: id ?? '',
      ModuleProvider.title: title ?? '',
      ModuleProvider.description: description ?? '',
      ModuleProvider.chapter: chapter ?? '',
      ModuleProvider.pkgSequenceNo: pkgSequenceNo ?? '',
      ModuleProvider.sequenceNo: sequenceNo ?? ''
    };
    return map;
  }

  ModuleModel.fromMap(Map<String, dynamic> map) {
    id = map[ModuleProvider.id];
    title = map[ModuleProvider.title];
    description = map[ModuleProvider.description];
    chapter = map[ModuleProvider.chapter].toString();
    pkgSequenceNo = map[ModuleProvider.pkgSequenceNo].toString();
    sequenceNo = map[ModuleProvider.sequenceNo].toString();
  }
}

class ModuleProvider {
  static const String id = "_id";
  static const String title = "title";
  static const String description = "package_description";
  static const String chapter = "chapter";
  static const String pkgSequenceNo = "pkg_sequence";
  static const String sequenceNo = "sequenceno";
}

class AccountModelAdapter extends TypeAdapter<ModuleModel> {
  @override
  final typeId = 1;

  @override
  ModuleModel read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ModuleModel(
        id: fields[0] as String?,
        title: fields[1] as String?,
        description: fields[2] as String?,
        chapter: fields[3] as String?,
        pkgSequenceNo: fields[4] as String?,
        sequenceNo: fields[5] as String?);
  }

  @override
  void write(BinaryWriter writer, ModuleModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.chapter)
      ..writeByte(4)
      ..write(obj.pkgSequenceNo)
      ..writeByte(5)
      ..write(obj.sequenceNo);
  }
}
