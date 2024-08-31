import 'package:flutter/material.dart';

class NoteButton extends StatelessWidget {
  const NoteButton({
    required this.onPressed,
    required this.text,
    Key? key,
  }) : super(key: key);

  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.maxFinite, 45),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(fontFamily: 'Pacifico', color: Colors.white),
      ),
    );
  }
}
