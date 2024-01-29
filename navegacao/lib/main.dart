// ignore: unused_import
// ignore_for_file: use_key_in_widget_constructors, duplicate_ignore, avoid_web_libraries_in_flutter, prefer_const_constructors

// ignore: unused_import
import 'dart:js';

import 'package:flutter/material.dart';

void main() {
  runApp(Aplicativo());
}

// ignore: use_key_in_widget_constructors
class Aplicativo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Pagina1(),
    );
  }
}

// ignore: camel_case_types
class Pagina1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página 1'),
        backgroundColor: const Color.fromARGB(255, 17, 246, 116),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://miro.medium.com/v2/resize:fit:578/1*szmA2b5DQS_U5wAGgHiPQg.png',
              width: 400,
              height: 400,
            ),
            const Text(
              'Bem vindo à tela inicial',
              style: TextStyle(fontSize: 30),
            ),
            const Text(
              'Flutter é uma ferramenta multiplataforma para Android e iOS com um único código',
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Pagina2()),
                );
              },
              child: const Text('Ir para página 2'),
            ),
          ],
        ),
      ),
    );
  }
}

class Pagina2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página 2', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://miro.medium.com/v2/resize:fit:1400/0*Il8SPHMhrKkwoYjI',
              width: 300,
              height: 300,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Pagina3()),
                );
              },
              child: const Text('Ir para página 3'),
            ),
            const Text('Linguagem Dart', style: TextStyle(fontSize: 30)),
            const Text(
                'É uma linguagem versátil que combina eficiência e desempenho'),
          ],
        ),
      ),
    );
  }
}

class Pagina3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página 3', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        actions: [
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return [
                // ignore: prefer_const_constructors
                PopupMenuItem(
                  // ignore: prefer_const_constructors, sort_child_properties_last
                  child: Text('opção 1'),
                  value: 'opcao1',
                ),

                PopupMenuItem(
                  // ignore: prefer_const_constructors, sort_child_properties_last
                  child: Text('opção 2'),
                  value: 'opcao2',
                ),
              ];
            },
            onSelected: (value) {},
          ),
        ],
      ),

      // ignore: prefer_const_constructors
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'data:image/png;base64,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',
              width: 300,
              height: 300,
            ),
            Text(
              'a historia do senac',
              style: TextStyle(fontSize: 30),
            ),
            Text(
                'o senac foi criado no ano de **** , com o propozito de educar proficionalmente'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder:(context)=>Pagina1()),

                );
              },
              child: Text('voltar para pagina inicial'),
            ),
          ],
        ),
      ),
    );
  }
}
