import 'package:flutter/material.dart';


enum Category {
  none(Icons.warning_amber_outlined, 'Nenhum'),
  refeicoes(Icons.restaurant_outlined, 'Refeições'),
  educacao(Icons.school_outlined, 'Educação'),
  transporte(Icons.directions_car_outlined, 'Transporte'),
  entretenimento(Icons.sports_esports_outlined, 'Entretenimento'),
  petiscos(Icons.fastfood_outlined, 'Petiscos'),
  saude(Icons.medical_services_outlined, 'Saúde'),
  contas(Icons.receipt_long_outlined, 'Contas'),
  economia(Icons.savings_outlined, 'Economia');

  const Category(this.icon, this.texto);
  final IconData icon;
  final String texto;
}
