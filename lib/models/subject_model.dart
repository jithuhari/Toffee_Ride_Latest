import 'package:hive/hive.dart';

@HiveType(typeId: 2)
class SubjectModel extends HiveObject {
  @HiveField(0)
  String? name;
  @HiveField(1)
  int? score;
  @HiveField(2)
  String? progress;

  SubjectModel({
    this.name,
    this.score,
    this.progress,
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      SubjectProvider.name: name ?? '',
      SubjectProvider.score: score ?? 0,
      SubjectProvider.progress: progress ?? ''
    };
    return map;
  }

  SubjectModel.fromMap(Map<String, dynamic> map) {
    name = map[SubjectProvider.name];
    score = map[SubjectProvider.score];
    progress = map[SubjectProvider.progress];
  }

  double get progressValue {
    return 0.7;
    //final progressValue = progress?.replaceAll('%', '') ?? '';
    //return double.parse(progressValue);
  }
}

class SubjectProvider {
  static const String name = "subject";
  static const String score = "score";
  static const String progress = "progress";
}

class SubjectModelAdapter extends TypeAdapter<SubjectModel> {
  @override
  final typeId = 2;

  @override
  SubjectModel read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SubjectModel(
        name: fields[0] as String?,
        score: fields[1] as int?,
        progress: fields[2] as String?);
  }

  @override
  void write(BinaryWriter writer, SubjectModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.score)
      ..writeByte(2)
      ..write(obj.progress);
  }
}

/*
{success: true, data: [{subject: Grammar, score: 0, progress: 0%}, {subject: Maths, score: 0, progress: 0%}, {subject: EVS, score: 0, progress: 0%}, {subject: Social Studies, score: -1, progress: -1%}, {subject: Hindi, score: 0, progress: 0%}, {subject: Malayalam, score: 80, progress: 12.5%}, {subject: Vocabulary, score: 0, progress: 0%}, {subject: Hindi Vocabulary, score: -1, progress: -1%}, {subject: Malayalam Vocabulary, score: -1, progress: -1%}, {subject: Math Practice, score: 0, progress: 0%}, {subject: GK, score: 0, progress: 0%}, {subject: Activities, score: 0, progress: 0%}, {subject: Stories, score: -1, progress: 0%}, {subject: Rhymes, score: -1, progress: -1%}]}*/
