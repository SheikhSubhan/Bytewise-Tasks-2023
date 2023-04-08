import 'package:hive/hive.dart';
import 'package:task8/models/notes_model.dart';

class boxes{
  static Box<NotesModel> getData ()=> Hive.box("notes");
}