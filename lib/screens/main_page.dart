import 'package:flutter/material.dart';
import 'package:ma_wallet/constants.dart';
import 'package:ma_wallet/models/financial_data.dart';
import 'package:ma_wallet/screens/transactions_list.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:ma_wallet/modals/new_transaction.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

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
          Container(color: Colors.blueAccent, height: 30),
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
            child: Icon(Icons.input),
            onTap: () => modalShow(context, TransactionType.input),
          ),
          SpeedDialChild(
            child: Icon(Icons.output),
            onTap: () => modalShow(context, TransactionType.output),
          ),
        ],
        child: const Icon(Icons.add),
      ),
    );
  }
}
