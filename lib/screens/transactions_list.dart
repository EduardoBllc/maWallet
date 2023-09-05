import 'package:flutter/material.dart';
import 'package:ma_wallet/components/transaction_card.dart';
import 'package:ma_wallet/models/financial_data.dart';
import 'package:provider/provider.dart';

import '../models/transaction.dart';

class TransactionsList extends StatelessWidget {
  const TransactionsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FinancialData>(
      builder: (BuildContext context, financialData, Widget? child) {
        return ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: financialData.transactions.length,
          itemBuilder: (context, index){
            return TransactionCard(transaction: financialData.transactions[index]);
          },
        );
      },
    );
  }
}


