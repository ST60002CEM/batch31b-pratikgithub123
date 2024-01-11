// import 'package:fruit_ordering_app/config/constant/hive_table_constant.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// import 'package:uuid/uuid.dart';

// part 'auth_hive_model.g.dart';

// @HiveType(typeId: HiveTableConstant.userTableId)
// class AuthHiveModel {
//   @HiveField(0)
//   final String userId;

//   @HiveField(1)
//   final String fullname;

//   @HiveField(2)
//   final String location;

//   @HiveField(3)
//   final String phonenum;

//   @HiveField(4)
//   final String username;

//   @HiveField(5)
//   final String password;

//   // Constructor
//   AuthHiveModel({
//     String? userId,
//     required this.fullname,
//     required this.location,
//     required this.phonenum,
//     required this.username,
//     required this.password,
//   }) : userId = userId ?? const Uuid().v4();

//   // empty constructor
//   AuthHiveModel.empty()
//       : this(
//           userId: '',
//           fullname: '',
//           location: '',
//           phonenum: '',
//           username: '',
//           password: '',
//         );

//   @override
//   String toString() {
//     return 'userId: $userId, fullname: $fullname, location: $location, phonenum: $phonenum,  username: $username, password: $password';
//   }
// }
