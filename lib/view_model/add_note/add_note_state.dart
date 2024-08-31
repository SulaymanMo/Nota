part of 'add_note_cubit.dart';

@immutable
abstract class AddNoteState {}

class NoteInitial extends AddNoteState {}

class Error extends AddNoteState {
  final String error;

  Error(this.error);
}

class Loading extends AddNoteState {}

class Success extends AddNoteState {
  Success();
}
