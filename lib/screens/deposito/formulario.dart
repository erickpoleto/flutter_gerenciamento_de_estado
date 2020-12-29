import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/saldo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormularioDeposito extends StatelessWidget {
  final TextEditingController _controladorCampoValor = TextEditingController(text: '');

  _criaDeposito(context) {
    final double valor = double.tryParse(_controladorCampoValor.text);
    final depositoValido = _validaDeposito(valor);

    if(depositoValido) {
      _atualizaEstado(context, valor);
      Navigator.pop(context);
    }
  }

  _validaDeposito(valor) {
    final _campoPreenchido = valor != null;

    return _campoPreenchido;
  }
  
  _atualizaEstado(context, valor) {
    Provider.of<Saldo>(context, listen: false).incrementValor(valor);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Receber depósito'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Editor(
                dica: '0.00',
                controlador: _controladorCampoValor,
                rotulo:  'valor',
                icone: Icons.monetization_on,
              ),
              Container(
                height: 50,
                width: double.infinity,
                child: RaisedButton(
                  child: Text('Confirmar'),
                  onPressed: () => _criaDeposito(context),
                  color: Colors.green,
                ),
              ),
            ],
          ),
        )
      ),
    );
  }

}
