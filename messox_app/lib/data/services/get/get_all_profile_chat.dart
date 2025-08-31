// import 'package:hive/hive.dart';

// import '../../../core/constants/name_boxes.dart';
// import '../../models/contact.dart';

// class GetAllProfileChat {
//   final String boxName = NameBoxes.boxProfilesChat;
  
//   Future<List<Contact>> getAll() async{
//     if (!Hive.isBoxOpen(boxName)) {
//       await Hive.openBox(boxName);
//     }

//     var box = await Hive.openBox(boxName);

//     final allValues = box.values.toList();
    
//     List<Contact> chats = [];

//     for (final j in allValues) {
//       if (j == null) continue;
//       final chat = Contact.fromJson(j);
//       chats.add(chat);
//     }

//     return chats;
//   }


//   Future<List<Contact>> getItemsX(int x) async {
//     if (!Hive.isBoxOpen(boxName)) {
//       await Hive.openBox(boxName);
//     }

//     var box = Hive.box(boxName);

//     final allValues = box.values.toList();

//     List<Contact> chats = [];

//     for (int i = 0; i < allValues.length && chats.length < x; i++) {
//       final item = allValues[i];
//       if (item == null) continue;

//       final chat = Contact.fromJson(Map<String, dynamic>.from(item));
//       chats.add(chat);
//     }

//     return chats;
//   }
// }