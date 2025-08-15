import '../../../data/models/system.dart';

abstract class PreLoadingEvents {}

class PreInitSystem extends PreLoadingEvents{
  final System? system;
  PreInitSystem({required this.system}); 
}