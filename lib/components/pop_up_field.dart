import 'package:flutter/material.dart';

class PopUpField extends StatelessWidget {
  const PopUpField({
    super.key, required this.title, required this.onChanged,
  });

  final String title;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  MediaQuery.of(context).viewInsets,
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            ),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}