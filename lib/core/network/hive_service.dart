// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:fruit_ordering_app/config/constant/hive_table_constant.dart';
// import 'package:fruit_ordering_app/features/auth/data/model/auth_hive_model.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:path_provider/path_provider.dart';

// final hiveServiceProvider = Provider<HiveService>((ref) => HiveService());

// class HiveService {
//   Future<void> init() async {
//     var directory = await getApplicationDocumentsDirectory();
//     Hive.init(directory.path);

//     // Register Adapters
//     // Hive.registerAdapter(AuthHiveModelAdapter());

//     // ======================== Auth Queries ========================

//     Future<void> addAuth(AuthHiveModel auth) async {
//       var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
//       await box.put(auth.userId, auth);
//     }

//     Future<List<AuthHiveModel>> getAllAuth() async {
//       var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
//       var auths = box.values.toList();
//       return auths;
//     }

//     Future<void> deleteAuth(String userId) async {
//       var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
//       await box.delete(userId);
//     }

//     // Delete hive
//     Future<void> deleteHive() async {
//       await Hive.deleteBoxFromDisk(HiveTableConstant.userBox);
//     }
//   }
// }
