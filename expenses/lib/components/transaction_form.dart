import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';


class TransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  // final valueController = TextEditingController();
  final valueController = MoneyMaskedTextController(decimalSeparator: '.', thousandSeparator: ',');

  final Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

  // _submitForm() {
  //   final title = titleController.text;
  //   final value = double.tryParse(valueController.text) ?? 0.0;

  //   if (title.isEmpty || value <= 0) {
  //     return;
  //   } else {
  //     onSubmit(title, value);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    _submitForm() {
      final title = titleController.text;
      // final String valueText = valueController.text;
      // final valueini = valueController.text.re;
      final value = double.tryParse(valueController.text) ?? 0.0;
      print(valueController.text);

      if (title.isEmpty || value <= 0) {
        return showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Ops... Falta Algo!"),
                content: Text("Existem Campos Vazios!"),
                actions: <Widget>[
                  new FlatButton(
                    child: Text("OK"),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              );
            });
      } else {
        onSubmit(title, value);
      }
    }

    // void showVoidField() {
    //   showDialog(
    //       context: context,
    //       builder: (BuildContext context) {
    //         return AlertDialog(
    //           title: Text("My title"),
    //           content: Text("This is my message."),
    //           actions: <Widget>[
    //             new FlatButton(
    //               child: Text("OK"),
    //               onPressed: () {return;},
    //             ),
    //           ],
    //         );
    //       });
    // }

    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Titulo',
              ),
            ),
            TextField(
              controller: valueController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Valor R\$',
              ),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                // RealInputFormatter(centavos: true),
              ],
            ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlatButton(
                  child: Text('Nova Transação'),
                  textColor: Colors.purple,
                  onPressed: _submitForm,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
