import 'package:flutter/material.dart';
import 'package:ma_wallet/components/add_transaction_popup.dart';
import 'package:ma_wallet/models/financial_data.dart';
import 'package:ma_wallet/screens/transactions_list.dart';
import 'package:provider/provider.dart';
import '../models/transaction.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    FinancialData financialData = FinancialData();

    return ChangeNotifierProvider<FinancialData>(
      create: (context) => financialData,
      child: Scaffold(
        appBar: AppBar(
          title: Text('maWallet'),
        ),
        body: TransactionsList(),
        // bottomNavigationBar: BottomNavigationBar(
        //   backgroundColor: Colors.lightBlue.shade100,
        //   items: [
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.wallet),
        //       label: 'Money',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.add),
        //       label: 'Add',
        //     ),
        //   ],
        // ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          height: 70,
          width: 70,
          child: FittedBox(
            child: FloatingActionButton(
              onPressed: () {
                showModalBottomSheet(
                  useSafeArea: true,
                  context: context,
                  builder: (context) => SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                      color: Color(0xFF737373),
                      child: AddPopUp(),
                    ),
                  ),
                );
              },
              child: Icon(
                Icons.add,
                size: 40,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
