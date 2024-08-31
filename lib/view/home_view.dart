import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/core/utils/snackbar.dart';
import 'package:nota/view/about_view.dart';
import 'package:nota/view/widget/note_form.dart';
import 'package:nota/view/widget/note_list.dart';
import 'package:nota/view_model/add_note/add_note_cubit.dart';
import 'package:nota/view_model/notes/notes_cubit.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AboutView(),
                ),
              );
            },
            icon: const Icon(
              (Icons.info),
            ),
          ),
        ],
      ),
      body: const NoteList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showBottomSheet(context);
        },
        child: Icon(
          Icons.edit,
          color: Theme.of(context).iconTheme.color,
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      context: context,
      builder: (context) {
        return BlocProvider<AddNoteCubit>(
          create: (context) => AddNoteCubit(),
          child: BlocListener<AddNoteCubit, AddNoteState>(
            listener: (context, state) {
              if (state is Success) {
                BlocProvider.of<NotesCubit>(context).fetchNotes();
                Navigator.pop(context);
                showSnackBar(
                  context,
                  color: Colors.green,
                  title: 'Success.',
                  icon: Icons.check_circle,
                );
              }
              if (state is Error) {
                debugPrint(state.error);
              }
            },
            child: const NoteForm(),
          ),
        );
      },
    );
  }
}
