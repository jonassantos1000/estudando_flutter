import 'package:flutter/material.dart';

import '../model/moeda.dart';

class MoedaDropDown extends StatelessWidget {
  final List<Moeda> items;
  final Moeda moedaSelecionada;
  final TextEditingController? controller;
  bool? apenasLeitura = false;
  final void Function(Moeda? model) onChanged;

  MoedaDropDown(
      {super.key,
      required this.items,
      this.controller,
      required this.onChanged,
      required this.moedaSelecionada,
      this.apenasLeitura});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: DropdownButton<Moeda>(
                value: moedaSelecionada,
                dropdownColor: Theme.of(context).scaffoldBackgroundColor,
                focusColor: Theme.of(context).scaffoldBackgroundColor,
                padding: const EdgeInsets.only(top: 16, left: 10, right: 10),
                isExpanded: true,
                underline: Container(
                  height: 1,
                  color: Colors.amber,
                ),
                items: items
                    .map<DropdownMenuItem<Moeda>>(
                        (e) => DropdownMenuItem<Moeda>(
                              value: e,
                              child: Text(e.nome),
                            ),
                           )
                    .toList(),
                onChanged: onChanged)),
        Expanded(
          flex: 3,
          child: TextField(
              readOnly: apenasLeitura ?? false,
              controller: controller,
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber)),
              )),
        ),
      ],
    );
  }
}
