import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class UserModel extends HiveObject {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? email;
  @HiveField(3)
  String? countryCode;
  @HiveField(4)
  String? mobileNumber;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.countryCode,
    this.mobileNumber,
  });

Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      //UserProvider.userId: id,
      UserProvider.userName: name ?? '',
      UserProvider.userEmail: email ?? '',
      UserProvider.userCountryCode: countryCode ?? '',
      UserProvider.userMobile: mobileNumber ?? ''
    };
    if (id != null) {
      map[UserProvider.userId] = id;
    }
    return map;
  }

  UserModel.fromMap(Map<String, dynamic> map) {
    id = map[UserProvider.userId];
    name = map[UserProvider.userName];
    email = map[UserProvider.userEmail];
    countryCode = map[UserProvider.userCountryCode];
    mobileNumber = map[UserProvider.userMobile].toString();
  }
}

class UserProvider { 
  static const String table = 'user';
  static const String userId = "_id";
  static const String userName = "name";
  static const String userEmail = "email";
  static const String userCountryCode = "mobile_code";
  static const String userMobile = "mobile";
}


class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final typeId = 0;

  @override
  UserModel read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel(
      id: fields[0] as String?,
      name: fields[1] as String?,
      email: fields[2] as String?,
      countryCode: fields[3] as String?,
      mobileNumber: fields[4] as String?
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
    ..writeByte(5)
    ..writeByte(0)
    ..write(obj.id)
    ..writeByte(1)
    ..write(obj.name)
    ..writeByte(2)
    ..write(obj.email)
    ..writeByte(3)
    ..write(obj.countryCode)
    ..writeByte(4)
    ..write(obj.mobileNumber);
  }
}