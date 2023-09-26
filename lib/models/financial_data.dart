import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:ma_wallet/models/transaction.dart';

import '../constants.dart';

class FinancialData extends ChangeNotifier {
  double _total = 0;

  List<Transaction> _transactions = [
    InputTransaction(
        title: 'Salário do mês', value: 3000, date: DateTime.now()),
    OutputTransaction(
        category: Category.contas,
        title: 'Internet',
        value: 110,
        date: DateTime.now()),
    OutputTransaction(
        category: Category.educacao,
        title: 'DNC',
        value: 500,
        date: DateTime.now()),
  ];

  List<Transaction> get transactions {
    return UnmodifiableListView(_transactions);
  }

  double get total {
    return _total;
  }

  void addTransaction(Transaction transaction) {
    _transactions.add(transaction);
    refreshTotal();
    notifyListeners();
  }

  void removeTransaction(int index) {
    _transactions.removeAt(index);
    refreshTotal();
    notifyListeners();
  }

  void refreshTotal() {
    _total = 0;
    for (Transaction transaction in _transactions) {
      transaction.type == TransactionType.input
          ? _total += transaction.value
          : _total -= transaction.value;
    }
  }
}
