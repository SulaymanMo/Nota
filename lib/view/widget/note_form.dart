import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:nota/view/widget/note_button.dart';
import 'package:nota/view/widget/note_input.dart';
import 'package:nota/view_model/add_note/add_note_cubit.dart';

import '../../model/note_model.dart';

class NoteForm extends StatefulWidget {
  const NoteForm({Key? key}) : super(key: key);

  @override
  State<NoteForm> createState() => _NoteFormState();
}

class _NoteFormState extends State<NoteForm> {
  String? title, content;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidate = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: autoValidate,
      child: Padding(
        padding: EdgeInsets.only(
          top: 15,
          left: 15,
          right: 15,
          bottom: MediaQuery
              .of(context)
              .viewInsets
              .bottom,
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'New Note',
                textAlign: TextAlign.center,
                style: Theme
                    .of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontFamily: 'Pacifico', color: Colors.green),
              ),
              const SizedBox(height: 15),
              NoteInput(
                hint: 'Title ...',
                onSaved: (value) {
                  title = value;
                },
              ),
              const SizedBox(height: 10),
              NoteInput(
                onSaved: (value) {
                  content = value;
                },
                maxLines: 5,
                hint: 'Content ...',
              ),
              const SizedBox(height: 15),
              BlocBuilder<AddNoteCubit, AddNoteState>(
                builder: (context, state) {
                  return NoteButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        BlocProvider.of<AddNoteCubit>(context).addNote(
                          NoteModel(
                            title: title!,
                            content: content!,
                            date:
                            DateFormat('dd-MM-yyyy').format(DateTime.now()),
                            color: Colors.green.shade100.value,
                          ),
                        );
                      }
                      autoValidate = AutovalidateMode.always;
                    },
                    text: 'Done',
                  );
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
