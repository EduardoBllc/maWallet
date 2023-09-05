import 'package:flutter/material.dart';


enum Category {
  none(Icons.warning_amber),
  refeicoes(Icons.restaurant),
  educacao(Icons.school),
  transporte(Icons.directions_car),
  entretenimento(Icons.sports_esports),
  petiscos(Icons.fastfood),
  saude(Icons.medical_services_outlined),
  contas(Icons.receipt_long),
  economia(Icons.savings);

  const Category(this.icon);
  final IconData icon;
}

enum TransactionType {
  none,
  input,
  output,
}
