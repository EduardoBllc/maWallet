import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:ma_wallet/models/transaction.dart';

import '../constants.dart';

class FinancialData extends ChangeNotifier{
  List<Transaction> _transactions = [
    InputTransaction(title: 'Salário do mês', value: 3000, origin: 'Empresa'),
    OutputTransaction(category: Category.contas, title: 'Internet', value: 110),
    OutputTransaction(category: Category.educacao, title: 'DNC', value: 500),
  ];

  List<Transaction> get transactions{
    return UnmodifiableListView(_transactions);
  }

  void addTransaction(Transaction transaction){
    _transactions.add(transaction);
    notifyListeners();
  }
}