import 'package:flutter/material.dart';
import 'package:ma_wallet/components/pop_up_field.dart';
import 'package:ma_wallet/models/financial_data.dart';
import 'package:ma_wallet/models/transaction.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../constants.dart';

class AddPopUp extends StatelessWidget {
  const AddPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    String title = '';
    double value = 0;
    TransactionType type = TransactionType.none;
    // TextEditingController controller = TextEditingController();

    return Column(
      mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          PopUpField(
            title: 'Título',
            onChanged: (newValue) {},
          ),
          const SizedBox(height: 30),
          PopUpField(
            title: 'Valor',
            onChanged: (newValue) {
              try {
                value = double.parse(newValue);
              } catch (e) {
                Alert(context: context, title: 'Por favor, digite apenas números no valor').show();
              }
            },
          ),
          Card(
            color: Colors.blue,
            child: Consumer<FinancialData>(
              builder: (BuildContext context, financialData, child) {
                return TextButton(
                  onPressed: () {
                    Transaction transaction;
                    type == TransactionType.input
                        ? transaction = InputTransaction(
                            title: title,
                            value: value,
                          )
                        : transaction = OutputTransaction(
                            category: Category.none,
                            title: title,
                            value: value);
                    financialData.addTransaction(transaction);
                  },
                  child: const Text(
                    'Add',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              },
            ),
          ),
        ],
      );
  }
}
