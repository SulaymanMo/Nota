import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/core/utils/snackbar.dart';
import 'package:nota/model/note_model.dart';
import 'package:nota/view/edit_view.dart';
import 'package:nota/view_model/notes/notes_cubit.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({required this.noteModel, Key? key}) : super(key: key);

  final NoteModel noteModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(noteModel.color),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => EditView(noteModel: noteModel),
            ),
          );
        },
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    noteModel.title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 3),
                  Text(
                    noteModel.date,
                    style: const TextStyle(fontSize: 12),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    noteModel.content,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
            Positioned(
              right: -3,
              top: -3,
              child: GestureDetector(
                onTap: () {
                  noteModel.delete();
                  BlocProvider.of<NotesCubit>(context).fetchNotes();
                  showSnackBar(
                    context,
                    color: Colors.red,
                    title: 'Delete Done.',
                    icon: Icons.delete_sweep_rounded,
                  );
                },
                child: const CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.delete_sweep_outlined,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
