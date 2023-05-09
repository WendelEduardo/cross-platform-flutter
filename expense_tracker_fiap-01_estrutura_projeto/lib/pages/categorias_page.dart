import 'package:expense_tracker_fiap/models/tipo_transcao.dart';
import 'package:expense_tracker_fiap/repository/categoria_repository.dart';
import 'package:flutter/material.dart';

class CategoriasPage extends StatefulWidget {
  const CategoriasPage();

  @override
  State<CategoriasPage> createState() => _CategoriasPageState();
}

class _CategoriasPageState extends State<CategoriasPage> {
  final categorias = CategoriaRepository().obterCategorias();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categorias'),
      ),
      body: ListView.builder(
          itemCount: categorias.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                ListTile(
                  iconColor: categorias[index].cor,
                  title: Text(categorias[index].nome),
                  leading: Icon(categorias[index].icone),
                  trailing: Text(
                      categorias[index]
                          .tipoTransacao
                          .toString()
                          .replaceAll('TipoTransacao.', ''),
                      style: TextStyle(
                          color: categorias[index].tipoTransacao.name ==
                                  TipoTransacao.DESPESA
                              ? Colors.red
                              : Colors.green)),
                ),
              ],
            );
          }),
    );
  }
}
