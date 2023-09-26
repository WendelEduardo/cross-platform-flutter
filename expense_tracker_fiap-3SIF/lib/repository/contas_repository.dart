import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/conta.dart';

class ContasRepository {
  Future<List<Conta>> listarContas() async {
    final supaBase = Supabase.instance;
    final data = await supaBase.client
        .from("contas")
        .select<List<Map<String, dynamic>>>();

    final lista = data
        .map((map) => Conta(
            id: map['id'].toString(),
            descricao: map['descricao'],
            tipoConta: TipoConta.values[map['tipo_conta']],
            bancoId: map['banco']))
        .toList();

    return lista;
  }
}
