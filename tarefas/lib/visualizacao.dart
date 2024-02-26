// ignore_for_file: camel_case_types

// ignore: avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarefas/Controle_tarefa.dart';
// ignore: unused_import
import 'package:tarefas/modelo_tarefa.dart';

//função principal, executa em primeiro lugar
void main() {
  runApp(Principal());
}

// ignore: use_key_in_widget_constructors
class Principal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //change notifier liga a visualização ao controle tarefa
    //quando houver alguma alteração no controle, altera a tela
    return ChangeNotifierProvider(
      create: (context) => Controle_tarefa(),
      child: MaterialApp(
        title: 'App de Tarefas',
        home: telaTarefas(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

// ignore: use_key_in_widget_constructors
class telaTarefas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //barra de navegação
      appBar: AppBar(
        title: const Text(
          'App de Tarefas',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),

      body: listaTarefas(),

      // ignore: prefer_const_constructors
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          abrirJanelaCadastro(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  // ignore: non_constant_identifier_names, avoid_types_as_parameter_names
  void abrirJanelaCadastro(BuildContext context) {
    // ignore: unused_local_variable
    TextEditingController tarefaControle = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // ignore: prefer_const_constructors
        return AlertDialog(
          // ignore: prefer_const_constructors
          title: Text('adicionar Tarefa'),
          content: TextField(
            controller: tarefaControle,
            // ignore: prefer_const_constructors
            decoration: InputDecoration(labelText: 'titulo da tarefa'),
          ),
          
          actions: <Widget>[
            TextButton(
              style: const ButtonStyle(
                   backgroundColor: MaterialStatePropertyAll<Color>(Colors.red)
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              // ignore: prefer_const_constructors
              child: Text('cancelar',style:  TextStyle(color:Colors.white ),),
            ),
            TextButton(
              onPressed: () {
                Provider.of<Controle_tarefa>(context, listen: false)
                    .adicior(tarefaControle.text);
                Navigator.pop(context);
              },
              // ignore: prefer_const_constructors
              child: Text('adicionar'),
            ),
          ],
        );
      },
    );
  }
}

// ignore: use_key_in_widget_constructors
class listaTarefas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Controle_tarefa>(
// ignore: non_constant_identifier_names
        builder: (context, controle_tarefa, child) {
      return ListView.builder(
          itemCount: controle_tarefa.tarefas.length,
          itemBuilder: (context, index) {
            // ignore: unused_local_variable, non_constant_identifier_names
            Modelo_tarefa modelo_tarefa = controle_tarefa.tarefas[index];

            return ListTile(
              title: Text(modelo_tarefa.titulo),
              subtitle: Text(index.toString()),
              leading: Checkbox(
                checkColor: Colors.white,
                activeColor: const Color.fromARGB(255, 153, 231, 155),
                hoverColor: Colors.green,
                value: modelo_tarefa.completa,
                onChanged: (value) {
                  Provider.of<Controle_tarefa>(context, listen: false)
                      .adicior('teste');
                },
              ),
              trailing: IconButton(
                // ignore: prefer_const_constructors
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                onPressed: () {
                  Provider.of<Controle_tarefa>(context, listen: false)
                      .remover(index);
                },
              ),
            );
          });
    });
  }
}
