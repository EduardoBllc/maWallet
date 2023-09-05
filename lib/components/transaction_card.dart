import 'package:flutter/material.dart';
import '../constants.dart';
import '../models/transaction.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({
    super.key,
    required this.transaction,
  });

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    String formattedValue = transaction.value.toString().replaceAll('.', ',');
    return Card(
      elevation: 3,
      child: ListTile(
        leading: transaction.type == TransactionType.input
            ? Icon(Icons.call_received, color: Colors.green, size: 40)
            : Icon(Icons.call_made, color: Colors.red, size: 40),
        title: Text(transaction.title),
        subtitle: Text('R\$${formattedValue}0'),
        trailing: transaction.type == TransactionType.output
            ? Icon(
                transaction.category.icon,
                size: 40,
              )
            : null,
      ),
    );
  }
}
