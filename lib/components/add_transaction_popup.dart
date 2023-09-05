import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class AddPopUp extends StatelessWidget {
  const AddPopUp({super.key});

  @override
  Widget build(BuildContext context) {

    String title = '';
    double? value;


    return Container(
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35), topRight: Radius.circular(32)),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Título',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          SizedBox(height: 10),
          TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25))),
            ),
            onChanged: (newValue) {
              title = newValue;
              print(title);
            },
          ),
          SizedBox(height: 30),
          Text(
            'Valor',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          SizedBox(height: 10),
          TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25))),
            ),
            onSubmitted: (newValue) {
              try{
                value = double.parse(newValue);
              }catch(e){
                Alert(context: context, title: 'Por favor, digite apenas números no valor').show();
              }
            },
          ),
        ],
      ),
    );
  }
}
