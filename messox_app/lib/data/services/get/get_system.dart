import 'package:hive/hive.dart';

import '../../../core/constants/name_boxes.dart';
import '../../../core/constants/name_tables.dart';
import '../../models/system.dart';

class GetSystem {   
  static Future<System?> get() async{

    late Box<dynamic> box;

    if (!Hive.isBoxOpen(NameBoxes.boxSystem)) {
      box = await Hive.openBox(NameBoxes.boxSystem);
    }else {
      box = Hive.box(NameBoxes.boxSystem);
    }

    var json = box.get(NameTables.system);

    System? system;
    if (json != null) {
      system = System.fromJson(Map<String, dynamic>.from(json));
    }
    return system;
  }
}