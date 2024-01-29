// ignore_for_file: no_logic_in_create_state, prefer_const_constructors, duplicate_ignore, prefer_final_fields
import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const Aplicativo());
}

// ignore: camel_case_types
class Aplicativo extends StatefulWidget {
  const Aplicativo({Key? key}) : super(key: key);
  @override
  State<Aplicativo> createState() => _EstadoAplicativo();
}

class _EstadoAplicativo extends State<Aplicativo> {
  int contador1 = 0;
  int contador2 = 0;
  int tempo = 60;
  // ignore: unused_field
  late Timer _timer;
  // ignore: unused_field
  bool _clique = true;
  @override
  Widget build(BuildContext contex) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      // ignore: prefer_const_constructors
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: const Text('aplicatio contador'),
        ),
        body: Center(
          // ignore: prefer_const_constructors
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Text(
                'contador1: $contador1',
                style: TextStyle(fontSize: 30),
              ),
            ],
          ),
        ),
        floatingActionButton: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
       // ignore: prefer_const_literals_to_create_immutables
       children:<Widget>[
       Padding(
        padding: const EdgeInsets.only( left: 50.0),
        child: FloatingActionButton(
          //onPressed: _clique?(){setState(() {contador1++;}); } null, tooltip: 'Incrementar contador 1',
          onPressed:(){
            setState(() {
          contador1++;
          });},
          child: Icon(Icons.add),
        ),
       ),

       ],
     


        ),
      ),
    );
  }
}
