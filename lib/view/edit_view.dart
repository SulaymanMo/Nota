import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/core/utils/snackbar.dart';
import 'package:nota/model/note_model.dart';
import 'package:nota/view/widget/note_button.dart';
import 'package:nota/view/widget/note_input.dart';
import 'package:nota/view_model/notes/notes_cubit.dart';

class EditView extends StatefulWidget {
  const EditView({required this.noteModel, Key? key}) : super(key: key);

  final NoteModel noteModel;

  @override
  State<EditView> createState() => _EditViewState();
}

class _EditViewState extends State<EditView> {
  String? title, content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 8,
        title: const Text('Edit Note'),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.keyboard_double_arrow_left_outlined),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              NoteInput(
                onChanged: (value) {
                  title = value;
                },
                hint: widget.noteModel.title,
              ),
              const SizedBox(height: 10),
              NoteInput(
                onChanged: (value) {
                  content = value;
                },
                maxLines: 5,
                hint: widget.noteModel.content,
              ),
              const SizedBox(height: 15),
              NoteButton(
                onPressed: () {
                  widget.noteModel.title = title ?? widget.noteModel.title;
                  widget.noteModel.content =
                      content ?? widget.noteModel.content;
                  widget.noteModel.save();
                  BlocProvider.of<NotesCubit>(context).fetchNotes();
                  Navigator.pop(context);
                  showSnackBar(
                    context,
                    color: Colors.green,
                    title: 'Edit Done.',
                    icon: Icons.check_circle,
                  );
                },
                text: 'Done',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
