import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:nota/core/observer.dart';
import 'package:nota/model/note_model.dart';
import 'package:nota/view/home_view.dart';
import 'package:nota/view_model/notes/notes_cubit.dart';

void main() async {
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = Observer();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>('noteBox');
  runApp(
    BlocProvider<NotesCubit>(
      create: (context) => NotesCubit()..fetchNotes(),
      child: const Nota(),
    ),
  );
}

class Nota extends StatelessWidget {
  const Nota({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nota',
      theme: ThemeData(
        // scaffoldBackgroundColor: Colors.green.shade50,
        // bottomSheetTheme: BottomSheetThemeData(
        //   backgroundColor: Colors.green.shade50,
        // ),
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.green,
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          titleTextStyle: TextStyle(
            fontSize: 24,
            letterSpacing: 0.5,
            color: Colors.green,
            fontFamily: 'Pacifico',
            fontWeight: FontWeight.bold,
          ),
        ),
        primarySwatch: Colors.green,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.green,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(
            fontSize: 16,
            letterSpacing: 0.3,
            fontWeight: FontWeight.bold,
          ),
        ),
        textTheme: const TextTheme(
          titleSmall: TextStyle(
            fontSize: 15,
            letterSpacing: 0.3,
            fontWeight: FontWeight.bold,
          ),
          titleMedium: TextStyle(
            fontSize: 20,
            letterSpacing: 0.5,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const HomeView(),
    );
  }
}
