import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/saldo.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:bytebank/models/transferencias.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const _tituloAppBar = 'Criando Transferência';

const _rotuloCampoValor = 'Valor';
const _dicaCampoValor = '0.00';

const _rotuloCampoNumeroConta = 'Número da conta';
const _dicaCampoNumeroConta = '0000';

const _textoBotaoConfirmar = 'Confirmar';

class FormularioTransferencia extends StatelessWidget{
  final TextEditingController _controladorCampoNumeroConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_tituloAppBar),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Editor(
                  controlador: _controladorCampoNumeroConta,
                  dica: _dicaCampoNumeroConta,
                  rotulo: _rotuloCampoNumeroConta,
                  icone: Icons.account_balance,
                ),
                Editor(
                  dica: _dicaCampoValor,
                  controlador: _controladorCampoValor,
                  rotulo: _rotuloCampoValor,
                  icone: Icons.monetization_on,
                ),
                Container(
                  height: 50,
                  width: double.infinity,
                  child: RaisedButton(
                    child: Text(_textoBotaoConfirmar),
                    onPressed: () => _criaTransferencia(context),
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void _criaTransferencia(BuildContext context) {
    final int numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double valor = double.tryParse(_controladorCampoValor.text);
    final transferenciaValida = _isTransferenciaValida(context, numeroConta, valor);

    if (transferenciaValida) {
      final novaTransferencia = Transferencia(valor, numeroConta);
      _atualizaEstado(context, novaTransferencia, valor);
      Navigator.pop(context);
    }
  }

  bool _isTransferenciaValida(context, numConta, valor) {
    final _camposPreenchidos = numConta != null && valor != null;
    final _saldoInsuficiente = valor <= Provider.of<Saldo>(context, listen: false).valor;
    return _camposPreenchidos && _saldoInsuficiente;
  }

  _atualizaEstado(context, novaTransferencia, valor){
    Provider.of<Transferencias>(context, listen: false).addTransferencia(novaTransferencia);
    Provider.of<Saldo>(context, listen: false).decrementValue(valor);
  }
}
