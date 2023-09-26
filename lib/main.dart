import 'package:flutter/material.dart';
import 'package:ma_wallet/models/financial_data.dart';
import 'package:provider/provider.dart';
import 'screens/main_page.dart';

void main() => runApp(MaWalletApp());

class MaWalletApp extends StatelessWidget {
  const MaWalletApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FinancialData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/' : (context) => MainPage(),
        },
      ),
    );
  }
}
