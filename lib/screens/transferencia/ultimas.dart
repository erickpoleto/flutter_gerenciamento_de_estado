import 'package:bytebank/models/transferencias.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'lista.dart';

class UltimasTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Text('Últimas transferencias',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Consumer<Transferencias>(
          builder: (context, transferencias, child) {
            final _ultimasTransferencias = transferencias.transferencias.reversed.toList();
            final _quantidade = transferencias.transferencias.length;
            int _tamanho = 2;
            if(_quantidade < 2) {
              _tamanho = _quantidade;
            }
            if(_quantidade == 0) {
              return SemTransferenciaCadastrada();
            }
            return ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: _tamanho,
              shrinkWrap: true,
              itemBuilder: (context, indice) {
                return ItemTransferencia(_ultimasTransferencias[indice]);
              },
            );
          }
        ),
        RaisedButton(
          child: Text('Ver todas transferências'),
          color: Colors.green,
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ListaTransferencias(),)),
        ),
      ]
    );
  }
}

class SemTransferenciaCadastrada extends StatelessWidget {
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(40),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          "Você não pussui transferências cadastradas",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}