import 'package:flutter/material.dart';
import 'screens/main_page.dart';
import 'components/add_transaction_popup.dart';

void main() => runApp(MaWalletApp());

class MaWalletApp extends StatelessWidget {
  const MaWalletApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/' : (context) => MainPage(),
        '/add' : (context) => AddPopUp(),
      },
    );
  }
}
