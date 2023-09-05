import 'package:flutter/material.dart';

import '../constants.dart';

abstract class Transaction {
  Transaction({required this.value, required this.title, required this.type, this.category = Category.none});

  final String title;
  final double value;
  final TransactionType type;
  final Category category;
}

class InputTransaction extends Transaction {
  InputTransaction(
      {required super.title,
      required super.value,
      required this.origin,
      super.type = TransactionType.input});
  final String origin;
}

class OutputTransaction extends Transaction {
  OutputTransaction(
      {required super.category,
      required super.title,
      required super.value,
      super.type = TransactionType.output});
}

