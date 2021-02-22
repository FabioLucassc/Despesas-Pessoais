import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class TransactionForm extends StatefulWidget {
  final Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final valueController = MoneyMaskedTextController(decimalSeparator: '.', thousandSeparator: ',');

  @override
  Widget build(BuildContext context) {
    _submitForm() {
      final title = titleController.text;
      final value =
          double.tryParse(valueController.text.replaceAll(',', '')) ?? 0.0;
      print(valueController.text);

      if (title.isEmpty) {
        return showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Ops... Falta Algo!"),
                content: Text("Descrição Vazia!"),
                actions: <Widget>[
                  new FlatButton(
                    child: Text("OK"),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              );
            });
      } else if (value <= 0) {
        return showDialog(
            context: ((context)),
            builder: (_) {
              return AlertDialog(
                title: Text("Ops... Falta Algo!"),
                content: Text("Erro ao inserir o valor!"),
                actions: <Widget>[
                  new FlatButton(
                    child: Text("OK"),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              );
            });
      } else {
        widget.onSubmit(title, value);
      }
    }

    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              controller: titleController,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: 'Titulo',
              ),
            ),
            TextField(
              controller: valueController,
              onSubmitted: (_) => _submitForm(),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Valor R\$',
              ),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
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
