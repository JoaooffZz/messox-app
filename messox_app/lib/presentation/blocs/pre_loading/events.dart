import '../../../data/models/system/server.dart';
import '../../../data/models/system/settings.dart';
import '../../../data/models/system/user.dart';

abstract class PreLoadingEvents {}

class PreInitSystem extends PreLoadingEvents{
  final Settings settings;
  final Server? server;
  final User? user;
  PreInitSystem({
    required this.settings,
    required this.server,
    required this.user
  }); 
}