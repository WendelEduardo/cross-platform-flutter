import 'package:expense_tracker/models/conta.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../models/categoria.dart';
import '../models/tipo_transacao.dart';
import '../models/transacao.dart';

class TransacoesReepository {
  Future<List<Transacao>> listarTransacoes(
      {TipoTransacao? tipoTransacao}) async {
    await Future.delayed(const Duration(seconds: 5));
    return [];
  }
}
