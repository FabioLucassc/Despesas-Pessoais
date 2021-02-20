import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();

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
      final value = double.tryParse(valueController.text) ?? 0.0;

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
