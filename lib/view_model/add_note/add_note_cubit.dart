import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:nota/model/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(NoteInitial());

  Future<void> addNote(NoteModel note) async {
    emit(Loading());
    try {
      Box noteBox = Hive.box<NoteModel>('noteBox');
      await noteBox.add(note);
      emit(Success());
    } catch (e) {
      emit(Error(e.toString()));
    }
  }
}
