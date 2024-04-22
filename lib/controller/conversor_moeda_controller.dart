import 'package:flutter/material.dart';
import 'package:lista_tarefas/model/moeda.dart';

class ConversorController{
  late List<Moeda> moedas;
  late TextEditingController campoMoedaBase;
  late TextEditingController campoMoedaConversao;
  late Moeda moedaBase;
  late Moeda moedaConversao;

  ConversorController({required this.campoMoedaBase, required this.campoMoedaConversao}){
    moedas = Moeda.getMoedas();
    moedaBase = moedas.first;
    moedaConversao = moedas[1];
  }

  void converter(){
    double fatorConversao = double.tryParse(campoMoedaBase.text) ?? 1.0;
    double valorConvertido = 0.0;

    if (moedaConversao.nome == 'Real'){
      valorConvertido = fatorConversao * moedaBase.real;
    } else if (moedaConversao.nome == 'Dolar') {
      valorConvertido = fatorConversao * moedaBase.dolar;
    } else if (moedaConversao.nome == 'Euro') {
      valorConvertido = fatorConversao * moedaBase.euro;
    }
    campoMoedaConversao.text = valorConvertido.toStringAsFixed(2);
  }
}