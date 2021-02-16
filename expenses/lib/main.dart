import 'package:flutter/material.dart';

main(List<String> args) => runApp(ExpensessApp());

class ExpensessApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text('Despesas Pessoais'),
    ),
    body: Center(
      child: Text('Teste'),
    ),
    );
  }
}
