import 'package:flutter/material.dart';
import '../models/transaction.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    super.key,
    required this.onPressed,
    required this.type,
  });

  final void Function() onPressed;
  final TransactionType type;

  @override
  Widget build(BuildContext context) {
    String buttonText;
    type == TransactionType.input
        ? buttonText = 'Entrada'
        : buttonText = 'Saída';

    return Container(
      padding: const EdgeInsets.only(right: 7),
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(20)),
      child: TextButton(
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.add,
              color: Colors.white,
              size: 30,
            ),
            const SizedBox(width: 10),
            Text(
              'Adicionar $buttonText',
              style: const TextStyle(color: Colors.white, fontSize: 17),
            )
          ],
        ),
      ),
    );
  }
}
