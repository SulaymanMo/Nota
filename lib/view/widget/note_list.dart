import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/model/note_model.dart';
import 'package:nota/view_model/notes/notes_cubit.dart';
import 'note_card.dart';

class NoteList extends StatelessWidget {
  const NoteList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: BlocProvider.of<NotesCubit>(context).notes.length,
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          itemBuilder: (context, index) {
            return NoteCard(
              noteModel: BlocProvider.of<NotesCubit>(context).notes[index],
            );
          },
        );
      },
    );
  }
}
