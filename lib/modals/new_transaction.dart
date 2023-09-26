import 'package:flutter/material.dart';
import 'package:ma_wallet/constants.dart';
import 'package:ma_wallet/models/financial_data.dart';
import 'package:ma_wallet/models/transaction.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../components/modal_add_button.dart';

modalShow(BuildContext context, TransactionType type) {
  Widget modalWidget;
  type == TransactionType.input
      ? modalWidget = const InputModalWidget()
      : modalWidget = const OutputModalWidget();

  showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: const Color(0xFF7f7f7f),
    context: context,
    builder: (context) => SingleChildScrollView(
      child: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(35)),
          color: Colors.white,
        ),
        child: Container(
          padding: const EdgeInsets.all(30),
          child: modalWidget,
        ),
      ),
    ),
  );
}

class InputModalWidget extends StatelessWidget {
  const InputModalWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String titulo = '';
    double valor = 0;
    TextEditingController controllerValue = TextEditingController();

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextField(
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.text_fields_outlined),
            labelText: 'Título',
            hintText: 'Salário do mês',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onChanged: (newValue) {
            titulo = newValue;
          },
        ),
        const SizedBox(height: 10),
        TextField(
          controller: controllerValue,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.payments_outlined),
            labelText: 'Valor',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onChanged: (newValue) {
            String parseValue;
            newValue.contains(',')
                ? parseValue = newValue.replaceAll(',', '.')
                : parseValue = newValue;
            if (newValue != '') {
              try {
                valor = double.parse(parseValue);
              } catch (e) {
                Alert(
                        context: context,
                        title: 'Digite apenas números neste campo')
                    .show();
                controllerValue.clear();
              }
            }
          },
        ),
        const SizedBox(height: 10),
        InputDatePickerFormField(
          firstDate: DateTime(2018),
          lastDate: DateTime.now(),
          initialDate: DateTime.now(),
        ),
        const SizedBox(height: 10),
        Consumer<FinancialData>(
          builder: (BuildContext context, FinancialData financialData,
              Widget? child) {
            return AddButton(
              type: TransactionType.input,
              onPressed: () {
                if (titulo != '' && valor != 0) {
                  financialData.addTransaction(
                      InputTransaction(value: valor, title: titulo, date: d));
                  Navigator.pop(context);
                } else {
                  Alert(
                          context: context,
                          title: 'Preencha todos os campos corretamente')
                      .show();
                }
              },
            );
          },
        ),
      ],
    );
  }
}

class OutputModalWidget extends StatelessWidget {
  const OutputModalWidget({super.key});

  InputDecoration setInputDecoration(Icon icon, String labelText) {
    return InputDecoration(
      prefixIcon: icon,
      labelText: labelText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String titulo = '';
    double valor = 0;
    Category categoria = Category.none;
    TextEditingController controllerValue = TextEditingController();

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextField(
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.text_fields_outlined),
            labelText: 'Título',
            hintText: 'Conta de luz',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onChanged: (newValue) {
            titulo = newValue;
          },
        ),
        const SizedBox(height: 10),
        TextField(
          controller: controllerValue,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.payments_outlined),
            labelText: 'Valor',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onChanged: (newValue) {
            String parseValue;
            newValue.contains(',')
                ? parseValue = newValue.replaceAll(',', '.')
                : parseValue = newValue;
            if (newValue != '') {
              try {
                valor = double.parse(parseValue);
              } catch (e) {
                Alert(
                        context: context,
                        title: 'Digite apenas números neste campo')
                    .show();
                controllerValue.clear();
              }
            }
          },
        ),
        const SizedBox(height: 10),
        DropdownButtonFormField(
          decoration: setInputDecoration(
              const Icon(Icons.category_outlined), 'Categoria'),
          onChanged: (newValue) {
            categoria = newValue!;
          },
          items: Category.values.map((val) {
            return DropdownMenuItem(
              value: val,
              child: Row(
                children: [
                  Icon(val.icon),
                  const SizedBox(width: 30),
                  Text(val.texto.toString()),
                ],
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 10),
        Consumer<FinancialData>(
          builder: (BuildContext context, FinancialData financialData,
              Widget? child) {
            return AddButton(
              type: TransactionType.output,
              onPressed: () {
                if (titulo != '' ||
                    valor != 0 ||
                    categoria.runtimeType == Category) {
                  financialData.addTransaction(
                    OutputTransaction(
                      value: valor,
                      title: titulo,
                      category: categoria,
                    ),
                  );
                  Navigator.pop(context);
                } else {
                  Alert(
                    context: context,
                    title: 'Preencha todos os campos corretamente',
                  ).show();
                }
              },
            );
          },
        ),
      ],
    );
  }
}
