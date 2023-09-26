import 'package:flutter/material.dart';
import 'package:ma_wallet/models/financial_data.dart';
import 'package:ma_wallet/screens/transactions_list.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:ma_wallet/modals/new_transaction.dart';
import 'package:provider/provider.dart';

import '../models/transaction.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0,
        elevation: 0.009,
        backgroundColor: Colors.blueAccent,
        title: const Text('maWallet'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Consumer<FinancialData>(
            builder: (BuildContext context, FinancialData financialData,
                Widget? child) {
              financialData.refreshTotal();
              return Container(
                padding: EdgeInsets.all(15),
                color: Colors.blueAccent,
                child: Center(
                  child: Text(
                    'Saldo atual: R\$${financialData.total}',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
              );
            },
          ),
          const Expanded(child: TransactionsList()),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SpeedDial(
        overlayOpacity: 0,
        buttonSize: const Size.fromRadius(35),
        childrenButtonSize: const Size.fromRadius(30),
        spacing: 10,
        children: [
          SpeedDialChild(
            label: 'Entrada',
            child:
                Icon(Icons.call_received, color: Colors.greenAccent.shade100),
            onTap: () => modalShow(context, TransactionType.input),
          ),
          SpeedDialChild(
            label: 'Saída',
            child: Icon(Icons.call_made, color: Colors.redAccent.shade100),
            onTap: () => modalShow(context, TransactionType.output),
          ),
        ],
        child: const Icon(Icons.add),
      ),
    );
  }
}
