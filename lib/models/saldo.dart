import 'package:flutter/cupertino.dart';

class Saldo extends ChangeNotifier {
  double _valor;

  Saldo(this._valor);

  void incrementValor(double valor) {
    _valor += valor;
    notifyListeners();
  }

  void decrementValue(double valor) {
    _valor -= valor;
    notifyListeners();
  }

  double get valor => _valor;

  @override
  String toString() {
    return 'R\$ ${this._valor}'.replaceAll('.', ',');
  }

}