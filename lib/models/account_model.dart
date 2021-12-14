import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class AccountModel extends HiveObject {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? gender;
  @HiveField(3)
  String? age;
  @HiveField(4)
  String? expiryDate;
  @HiveField(5)
  String? validTill;
  @HiveField(6)
  String? paymentPlan;

  AccountModel({
    this.id,
    this.name,
    this.gender,
    this.age,
    this.expiryDate,
    this.validTill,
    this.paymentPlan,
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      AccountProvider.id: id ?? '',
      AccountProvider.name: name ?? '',
      AccountProvider.gender: gender ?? '',
      AccountProvider.age: age ?? '',
      AccountProvider.expiryDate: expiryDate ?? '',
      AccountProvider.validTill: validTill ?? '',
      AccountProvider.paymentPlan: paymentPlan ?? '',
    };
    return map;
  }

  AccountModel.fromMap(Map<String, dynamic> map) {
    id = map[AccountProvider.id];
    name = map[AccountProvider.name];
    gender = map[AccountProvider.gender];
    age = map[AccountProvider.age].toString();
    expiryDate = map[AccountProvider.expiryDate].toString();
    validTill = map[AccountProvider.validTill].toString();
    paymentPlan = map[AccountProvider.paymentPlan];
  }
}

class AccountProvider {
  static const String table = 'accounts';
  static const String id = "_id";
  static const String name = "name";
  static const String gender = "gender";
  static const String age = "email";
  static const String expiryDate = "expiry_date";
  static const String validTill = "valid_till";
  static const String paymentPlan = "payment_plan";
}


class AccountModelAdapter extends TypeAdapter<AccountModel> {
  @override
  final typeId = 1;

  @override
  AccountModel read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AccountModel(
      id: fields[0] as String?,
      name: fields[1] as String?,
      gender: fields[2] as String?,
      age: fields[3] as String?,
      expiryDate: fields[4] as String?,
      validTill: fields[5] as String?,
      paymentPlan: fields[6] as String?
    );
  }

  @override
  void write(BinaryWriter writer, AccountModel obj) {
    writer
    ..writeByte(7)
    ..writeByte(0)
    ..write(obj.id)
    ..writeByte(1)
    ..write(obj.name)
    ..writeByte(2)
    ..write(obj.gender)
    ..writeByte(3)
    ..write(obj.age)
    ..writeByte(4)
    ..write(obj.expiryDate)
    ..writeByte(5)
    ..write(obj.validTill)
    ..writeByte(6)
    ..write(obj.paymentPlan);
  }
}