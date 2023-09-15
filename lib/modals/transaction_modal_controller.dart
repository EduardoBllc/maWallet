import 'package:flutter/material.dart';
import 'package:ma_wallet/components/pop_up_field.dart';
import 'package:ma_wallet/constants.dart';
import 'package:ma_wallet/models/financial_data.dart';
import 'package:ma_wallet/models/transaction.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../components/modal_add_button.dart';

modalShow(BuildContext context, TransactionType type) {
  Widget modalWidget;
  type == TransactionType.input
      ? modalWidget = InputModalWidget()
      : modalWidget = OutputModalWidget();

  showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: const Color(0xFF7f7f7f),
    context: context,
    builder: (context) {
      return Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(35)),
          color: Colors.white,
        ),
        child: modalWidget,
      );
    },
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

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        PopUpField(
            title: 'Título',
            onChanged: (newValue) {
              titulo = newValue;
            }),
        PopUpField(
            title: 'Valor',
            onChanged: (newValue) {
              String parseValue;
              if (newValue.contains(',')) {
                parseValue = newValue.replaceAll(',', '.');
              } else {
                parseValue = newValue;
              }
              try {
                valor = double.parse(parseValue);
              } catch (e) {
                Alert(context: context, title: 'Digite apenas números').show();
              }
            }),
        Consumer<FinancialData>(builder:
            (BuildContext context, FinancialData financialData, Widget? child) {
          return AddButton(
            onPressed: () {
              financialData.addTransaction(InputTransaction(title: titulo, value: valor));
            },
          );
        }),
      ],
    );
  }
}

class OutputModalWidget extends StatelessWidget {
  const OutputModalWidget({super.key});

  @override
  Widget build(BuildContext context) {

    String titulo = '';
    double valor = 0;
    Category categoria = Category.none;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        PopUpField(title: 'Título', onChanged: (newValue) {
          titulo = newValue;
        }),
        //TODO modify this field to be an dropdown or something like this
        PopUpField(title: 'Categoria', onChanged: (newValue) {

        }),
        PopUpField(title: 'Valor', onChanged: (newValue) {
          String parseValue;
          if (newValue.contains(',')) {
            parseValue = newValue.replaceAll(',', '.');
          } else {
            parseValue = newValue;
          }
          try {
            valor = double.parse(parseValue);
          } catch (e) {
            Alert(context: context, title: 'Digite apenas números').show();
          }
        }),
        Consumer<FinancialData>(builder: (BuildContext context, FinancialData financialData, Widget? child) {
          return AddButton(onPressed: (){
            financialData.addTransaction(InputTransaction(title: titulo, value: valor));
          });
        },),
      ],
    );
  }
}
