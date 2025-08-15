import 'package:hive/hive.dart';

import '../../../core/constants/name_boxes.dart';
import '../../../core/constants/name_tables.dart';
import '../../models/system.dart';

class PostSystem {
  final System system;

  PostSystem({
    required this.system
  });

  Future<bool> post() async{
    try {
      if (!Hive.isBoxOpen(NameBoxes.boxSystem)) {
        await Hive.openBox(NameBoxes.boxSystem);
      }
      var box = Hive.box(NameBoxes.boxSystem);
      await box.put(NameTables.system, system.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }
}