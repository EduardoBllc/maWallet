import 'package:flutter/material.dart';
import 'package:ma_wallet/constants.dart';
import 'package:ma_wallet/screens/transactions_list.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:ma_wallet/modals/transaction_modal_controller.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('maWallet'),
      ),
      body: TransactionsList(),
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
