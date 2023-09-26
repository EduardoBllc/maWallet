import 'package:flutter/material.dart';
import 'package:ma_wallet/models/financial_data.dart';
import 'package:provider/provider.dart';
import '../models/transaction.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({
    super.key,
    required this.transaction,
    required this.index,
  });

  final Transaction transaction;
  final int index;

  @override
  Widget build(BuildContext context) {
    String formattedValue = transaction.value.toString().replaceAll('.', ',');
    return Card(
      elevation: 3,
      child: Consumer<FinancialData>(
        builder: (context, financialData, child) {
          return ListTile(
            leading: transaction.type == TransactionType.input
                ? const Icon(Icons.call_received, color: Colors.green, size: 40)
                : const Icon(Icons.call_made, color: Colors.red, size: 40),
            title: Text(transaction.title),
            subtitle: Text('R\$${formattedValue}0'),
            trailing: transaction.type == TransactionType.output
                ? Icon(
                    transaction.category.icon,
                    size: 40,
                  )
                : const Icon(
                    Icons.payments_outlined,
                    size: 40,
                  ),
            onLongPress: () {
              financialData.removeTransaction(index);
            },
          );
        },
      ),
    );
  }
}
