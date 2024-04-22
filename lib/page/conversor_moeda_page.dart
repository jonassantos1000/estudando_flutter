import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../controller/conversor_moeda_controller.dart';
import '../widget/moeda_dropdown.dart';

class ConversorMoeda extends StatefulWidget {
  const ConversorMoeda({super.key});

  @override
  State<ConversorMoeda> createState() => _ConversorMoedaState();
}

class _ConversorMoedaState extends State<ConversorMoeda> {
  final TextEditingController moedaBase = TextEditingController();
  final TextEditingController moedaConversao = TextEditingController();

  late ConversorController conversorController;

  _ConversorMoedaState() {
    conversorController = ConversorController(
        campoMoedaBase: moedaBase, campoMoedaConversao: moedaConversao);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Conversor de moeda", style: TextStyle(color: Colors.white38),),
          backgroundColor: Color.fromARGB(242, 46, 46, 48),
          shadowColor: Colors.white38, shape: const Border(),
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Container(
              color: const Color.fromARGB(235, 73, 73, 75),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  children: [
                    MoedaDropDown(
                        moedaSelecionada: conversorController.moedaBase,
                        controller: moedaBase,
                        items: conversorController.moedas,
                        onChanged: (model) {
                          setState(() {
                            conversorController.moedaBase = model!;
                          });
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                    MoedaDropDown(
                        moedaSelecionada: conversorController.moedaConversao,
                        controller: moedaConversao,
                        items: conversorController.moedas,
                        apenasLeitura: true,
                        onChanged: (model) {
                          setState(() {
                            conversorController.moedaConversao = model!;
                          });
                        }),
                    const SizedBox(
                      height: 40,
                    ),
                    ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.amber)),
                      onPressed: () {
                        conversorController.converter();
                      },
                      child: const Text("Converter"),
                    )
                  ],
                ),
              )),
        ));
  }
}
    // return Container(
    //   width: MediaQuery.of(context).size.width,
    //   height: MediaQuery.of(context).size.height,
    //   color: const Color.fromARGB(235, 35, 35, 36),
    //   child: DropdownButton<String>(
    //     items: const [
    //       DropdownMenuItem<String>(
    //         value: "texto 1",
    //         child: Text("texto 1"),
    //       ),
    //     ],
    //     onChanged: (value) {},
    //   ),
    // );