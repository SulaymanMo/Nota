import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:nota/model/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  List<NoteModel> notes = [];

  void fetchNotes() {
    var noteBox = Hive.box<NoteModel>('noteBox');
    notes = noteBox.values.toList();
    emit(NotesSuccess());
  }
}
