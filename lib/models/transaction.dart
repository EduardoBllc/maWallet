import '../constants.dart';

abstract class Transaction {
  Transaction({
    required this.value,
    required this.title,
    required this.type,
    this.category = Category.none,
    required this.date,
  });

  final String title;
  final double value;
  final TransactionType type;
  final Category category;
  final DateTime date;
}

class InputTransaction extends Transaction {
  InputTransaction({
    required super.title,
    required super.value,
    super.type = TransactionType.input,
    required super.date,
  });
}

class OutputTransaction extends Transaction {
  OutputTransaction({
    required super.category,
    required super.title,
    required super.value,
    super.type = TransactionType.output,
    required super.date,
  });
}

enum TransactionType {
  none,
  input,
  output,
}
