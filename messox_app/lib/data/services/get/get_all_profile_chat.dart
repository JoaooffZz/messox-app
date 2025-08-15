import 'package:hive/hive.dart';

import '../../../core/constants/name_boxes.dart';
import '../../models/profile_chat.dart';

class GetAllProfileChat {
  final String boxName = NameBoxes.boxProfilesChat;
  
  Future<List<ProfileChat>> getAll() async{
    if (!Hive.isBoxOpen(boxName)) {
      await Hive.openBox(boxName);
    }

    var box = await Hive.openBox(boxName);

    final allValues = box.values.toList();
    
    List<ProfileChat> chats = [];

    for (final j in allValues) {
      if (j == null) continue;
      final chat = ProfileChat.fromJson(j);
      chats.add(chat);
    }

    return chats;
  }


  Future<List<ProfileChat>> getItemsX(int x) async {
    if (!Hive.isBoxOpen(boxName)) {
      await Hive.openBox(boxName);
    }

    var box = Hive.box(boxName);

    final allValues = box.values.toList();

    List<ProfileChat> chats = [];

    for (int i = 0; i < allValues.length && chats.length < x; i++) {
      final item = allValues[i];
      if (item == null) continue;

      final chat = ProfileChat.fromJson(Map<String, dynamic>.from(item));
      chats.add(chat);
    }

    return chats;
  }
}