import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:list_de_tarefas_firebase/controller/login_controller.dart';
import '../model/tarefa.dart';
import '../view/util.dart';

class TarefaController {
  //
  // ADICIONAR uma nova Tarefa na Coleção
  //
  void adicionar(context, Tarefa t) {
    FirebaseFirestore.instance
        .collection('tarefas')
        .add(t.toJson())
        .then((value) => sucesso(context, 'Tarefa adicionada com sucesso'))
        .catchError((e) => erro(context, 'ERRO: ${e.code.toString()}'))
        .whenComplete(() => Navigator.pop(context));
  }

  void atualizar(context, id, Tarefa t) {}

  listar() {
    FirebaseFirestore.instance
        .collection('tarefas')
        .where('uid', isEqualTo: LoginController().idUsuario());
  }

  void excluir(context, id) {}
}
