import 'package:flutter/material.dart';
import 'package:ma_wallet/models/financial_data.dart';
import 'package:provider/provider.dart';
import 'screens/main_page.dart';
import 'modals/add_transaction_popup.dart';

void main() => runApp(MaWalletApp());

class MaWalletApp extends StatelessWidget {
  const MaWalletApp({super.key});

  @override
  Widget build(BuildContext context) {

    FinancialData financialData = FinancialData();

    return ChangeNotifierProvider<FinancialData>(
      create: (BuildContext context) => financialData,
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/' : (context) => MainPage(),
          '/add' : (context) => AddPopUp(),
        },
      ),
    );
  }
}
