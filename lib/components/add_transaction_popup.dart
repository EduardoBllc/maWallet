import 'package:flutter/material.dart';
import 'package:ma_wallet/models/financial_data.dart';
import 'package:ma_wallet/models/transaction.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class AddPopUp extends StatelessWidget {
  const AddPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    String title = '';
    double value = 0;
    TextEditingController controller = TextEditingController();

    return Container(
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(35), topRight: Radius.circular(32)),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Text(
              'Título',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
          TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            ),
            onChanged: (newValue) {
              title = newValue;
            },
          ),
          Center(
            child: Text(
              'Valor',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
          TextField(
            controller: controller,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            ),
            onChanged: (newValue) {
              try {
                if(newValue.contains(',')){
                  newValue = newValue.replaceAll(',','.');
                }
                if(newValue != ""){
                  value = double.parse(newValue);
                }
              } catch (e) {
                Alert(context: context, title: 'Por favor, digite apenas números no valor').show();
                controller.text = value.toInt().toString();
              }
            },
          ),
          Consumer<FinancialData>(
            builder: (BuildContext context, financialData, Widget? child) {
              return TextButton(
                onPressed: () {

                  if(title != '' && value != 0){
                    Transaction transaction = InputTransaction(value: value, title: title, origin: 'Emprego');
                    financialData.addTransaction(transaction);
                  }else{
                    Alert(context: context, title: 'Preencha todos os campos corretamente', image: Icon(Icons.warning_amber)).show();
                  }
                },
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'ADD',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
