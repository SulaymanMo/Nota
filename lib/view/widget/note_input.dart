import 'package:flutter/material.dart';

class NoteInput extends StatelessWidget {
  const NoteInput({
    required this.hint,
    this.maxLines,
    this.onSaved,
    this.onChanged,
    Key? key,
  }) : super(key: key);

  final String hint;
  final int? maxLines;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      onChanged: onChanged,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Required.';
        }
        return null;
      },
      maxLines: maxLines,
      style: Theme.of(context).textTheme.titleSmall,
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
