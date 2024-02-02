// ignore_for_file: no_logic_in_create_state, prefer_const_constructors, duplicate_ignore, prefer_final_fields, no_leading_underscores_for_local_identifiers, annotate_overrides, unused_field
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Aplicativo());
}

class Aplicativo extends StatefulWidget {
  const Aplicativo({Key? key}) : super(key: key);
  @override
  State<Aplicativo> createState() => _EstadoAplicativo();
}

class _EstadoAplicativo extends State<Aplicativo> {
  int contador1 = 0;
  int contador2 = 0;
  int _tempo = 60;
  late Timer _timer;
  bool _clique = true;
  Color color1 = Colors.black;
  Color color2 = Colors.black;
  double posicao = 0.0; // Adicionado para correção

  void movimentar() {
    setState(() {
      if (contador1 > contador2) {
        posicao = 50.0;
      } else if (contador2 > contador1) {
        posicao = MediaQuery.of(context).size.width - 150.0;
      } else {
        posicao = MediaQuery.of(context).size.width / 2 - 50;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _iniciarTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void mudarCor() {
    if (contador1 > contador2) {
      color1 = Colors.red;
      color2 = const Color.fromARGB(255, 0, 0, 0);
    } else if (contador2 > contador1) {
      color1 = Colors.red;
      color2 = const Color.fromARGB(255, 0, 0, 0);
    } else {
      color1 = Color.fromARGB(255, 111, 231, 6);
      color2 = Color.fromARGB(255, 124, 4, 222);
    }
  }

  void _iniciarTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_tempo > 0) {
        setState(() {
          _tempo--;
        });
      } else {
        _timer.cancel();
        _clique = false;
      }
    });
  }

  void _reiniciar() {
    setState(() {
      contador1 = 0;
      contador2 = 0;
      _tempo = 5;
      _clique = true; // Reinicia a possibilidade de cliques
    });
    _timer.cancel();
    _iniciarTimer();
  }

  @override
  Widget build(BuildContext context) {
    mudarCor();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 191, 203, 219),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 187, 147, 209),
          title: const Text('aplicativo contador'),
        ),
        body: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'contador1: $contador1',
                    style: TextStyle(fontSize: 30, color: color1),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'contador2: $contador2',
                    style: TextStyle(fontSize: 30, color: color2),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'tempo: $_tempo',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    'Tempo restante: $_tempo segundos',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            AnimatedPositioned(
              // ignore: sort_child_properties_last
              child: Image.network(
                'https://cdn.domestika.org/c_fill,dpr_auto,f_auto,q_auto,w_820/v1610552063/content-items/006/747/362/Black_Knight_Walk_Cycle-original.gif?1610552063',
                width: 100,
                height: 100,
              ),
              duration:
                  Duration(milliseconds: 500), // Corrigido para milliseconds
              bottom: 70,
              left: posicao, // Adicionado para correção
            ),
          ],
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 50.0),
              child: FloatingActionButton(
                onPressed: () {
                  setState(() {
                    if (_clique == true) {
                      contador1++;
                      movimentar();
                    }
                  });
                },
                tooltip: 'Incrementar contador 1',
                child: Icon(Icons.add),
              ),
            ),
            FloatingActionButton(
              onPressed: _reiniciar,
              tooltip: 'Zerar contagem',
              child: Icon(Icons.refresh),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: FloatingActionButton(
                onPressed: () {
                  setState(() {
                    if (_clique == true) {
                      contador2++;
                      movimentar();
                    }
                  });
                },
                tooltip: 'Incrementar contador 2',
                child: Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
