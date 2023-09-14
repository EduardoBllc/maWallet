import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:ma_wallet/models/financial_data.dart';
import 'package:ma_wallet/screens/transactions_list.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    FinancialData financialData = FinancialData();

    return Scaffold(
        appBar: AppBar(
          title: Text('maWallet'),
        ),
        body: TransactionsList(),
        floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.menu_close,
          spacing: 15,
          buttonSize: Size.fromRadius(40),
          childrenButtonSize: Size.fromRadius(40),
          childPadding: EdgeInsets.all(10),
          children: [
            SpeedDialChild(
              child: Icon(
                Icons.call_received,
                color: Colors.greenAccent,
                size: 40,
              ),
              label: 'Input',
            ),
            SpeedDialChild(
              child: Icon(
                Icons.call_made,
                color: Colors.redAccent.shade100,
                size: 40,
              ),
              label: 'Output',
            ),
          ],
          child: Icon(Icons.add),
        ));
  }
}

// Container(
// height: 70,
// width: 70,
// child: FittedBox(
// child: FloatingActionButton(
// onPressed: () {
// showModalBottomSheet(
// isScrollControlled: true,
// context: context,
// builder: (context) => SingleChildScrollView(
// child: Container(
// padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
// color: Color(0xFF737373),
// child: AddPopUp(),
// ),
// ),
// );
// },
// child: Icon(
// Icons.add,
// size: 40,
// ),
// ),
// ),
// ),
