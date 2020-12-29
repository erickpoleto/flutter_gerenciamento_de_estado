import 'package:bytebank/models/saldo.dart';
import 'package:bytebank/screens/dashboard/saldo_card.dart';
import 'package:bytebank/screens/deposito/formulario.dart';
import 'package:bytebank/screens/transferencia/formulario.dart';
import 'package:bytebank/screens/transferencia/lista.dart';
import 'package:bytebank/screens/transferencia/ultimas.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bytebank'),
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 10),
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: SaldoCard()
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                child: Text('Receber depósito'),
                color: Colors.green,
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => FormularioDeposito(),)),
              ),
              RaisedButton(
                child: Text('Nova tranferência'),
                color: Colors.green,
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => FormularioTransferencia(),)),
              ),

            ],
          ),
          UltimasTransferencias()
        ],
      )
    );
  }
}
