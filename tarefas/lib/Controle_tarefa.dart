// ignore: file_names
// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:tarefas/modelo_tarefa.dart';

// ignore: camel_case_types
class Controle_tarefa extends ChangeNotifier {
  List<Modelo_tarefa> tarefas = [];
  void adicior(String titulo) {
    tarefas.add(Modelo_tarefa(titulo: titulo));
    notifyListeners();
  }

  void remover(int id) {
    tarefas.removeAt(id);
    notifyListeners();
  }

  void concluir(int id) {
    tarefas[id].completa = !tarefas[id].completa;
    notifyListeners();
  }
}
