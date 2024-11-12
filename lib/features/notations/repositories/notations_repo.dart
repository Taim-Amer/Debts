import 'package:taha_debts/features/notations/models/notes_model.dart';

abstract class NotationsRepository{
  Future<NotesModel> getNotes();
}