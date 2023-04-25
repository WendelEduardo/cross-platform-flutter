import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Checkpoint 02',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ContactsPage(),
    );
  }
}

class ContactsPage extends StatefulWidget {
  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  final contatos = [
    Contato(
        name: "John Doe",
        email: 'john_doeoe@gmail.com',
        favoritado: false,
        imagem:
            'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
    Contato(
        name: "Alice O. Austin",
        email: 'AliceOAustin@rhyta.com',
        favoritado: false,
        imagem:
            'https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&w=600'),
    Contato(
        name: "Douglas R. Broadway",
        email: 'DouglasRBroadway@dayrep.com',
        favoritado: false,
        imagem:
            'https://images.pexels.com/photos/1222271/pexels-photo-1222271.jpeg?auto=compress&cs=tinysrgb&w=600'),
    Contato(
        name: "Alice O. Austin",
        email: 'AliceOAustin@rhyta.com',
        favoritado: false,
        imagem:
            'https://images.pexels.com/photos/733872/pexels-photo-733872.jpeg?auto=compress&cs=tinysrgb&w=600'),
    Contato(
        name: "Douglas R. Broadway",
        email: 'DouglasRBroadway@dayrep.com',
        favoritado: false,
        imagem:
            'https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&w=600'),
  ];

  IconData iconeCoracaoVazio = Icons.favorite_border;
  IconData iconeCoracaoCheio = Icons.person;

  IconData iconeDaTela = Icons.favorite_border;

  int contador = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contatos Favoritos: $contador'),
      ),
      body: ListView.builder(
        itemCount: contatos.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
                backgroundImage: NetworkImage(contatos[index].imagem)),
            title: Text(contatos[index].name),
            subtitle: Text(contatos[index].email),
            trailing: IconButton(
              icon: Icon(
                contatos[index].favoritado ? Icons.favorite : Icons.favorite_border,
                color: contatos[index].favoritado ? Colors.red : null,
              ),
              onPressed: () {
                setState(() {
                  if (contatos[index].favoritado == false) {
                    iconeDaTela = iconeCoracaoCheio;
                    contatos[index].favoritado = true;
                    contador++;
                  }else {
                    contatos[index].favoritado = false;
                    contador--;
                  }
                });
              },
            ),
          );
        },
      ),
    );
  }
}

class Contato {
  String name;
  String email;
  bool favoritado;
  String imagem;

  Contato(
      {required this.name,
      required this.email,
      required this.favoritado,
      required this.imagem});
}


// Text(contatos[index].favoritado.toString())