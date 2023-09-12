// import 2
import 'dart:math';

import 'package:expense_tracker/repository/auth_repository.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final email = TextEditingController();
  final senha = TextEditingController();
  var esconderSenha = true;
  AuthRepository authRepository = new AuthRepository();
  var emailValidado = false;

  

  final _key = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.all(16.2),
            child: Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildBemVindo(),
                    const SizedBox(height: 20),
                    _buildEmail(),
                    const SizedBox(height: 20),
                    _buildSenha(),
                    const SizedBox(height: 10),
                    _buildButton(),
                    const SizedBox(height: 10),
                    _buildRegistrar(),
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  Text _buildBemVindo() {
    return const Text(
      "Bem Vindo!",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 26,
      ),
    );
  }

  TextFormField _buildEmail() => TextFormField(
      validator: (value){
        if(value == null || value.isEmpty){
            return "Email obrigatório";
          }

          if(validarEmail(value) == false){
            return "Email deve ser válido";
          }
        
          return null;
      },
      controller: email,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: "Digite seu e-mail",
        prefixIcon: Icon(Icons.email_outlined),
      ),
    );

  TextFormField _buildSenha() => TextFormField(
      validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Obrigatório informar a senha';
          }
          if(value.length < 5) {
            return 'A senha deve ter no mínimo 5 caracteres';
          }
          if(value.length > 12){
            return 'A senha deve ter no máximo 12 caracteres';
          }

          return null;
      },
      controller: senha,
      obscureText: esconderSenha,
      decoration: InputDecoration(
        hintText: "Digite sua senha",
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.lock_outline_rounded),
        // suffixIcon: Icon(Icons.visibility_outlined),
        suffixIcon: IconButton(
            icon: const Icon(Icons.visibility_outlined),
            onPressed: () {
              esconderSenha = !esconderSenha;
              setState(() {
              });
            },
        ),
      ),
    );
    // Icone para ocultar a senha visibility_off_outlined




  Widget _buildButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          onTapBtnSignUp();

        },
        child: const Text('Login'),
      ),
    );
  }


  Widget _buildRegistrar() {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacementNamed(context, '/registrar');
      },
      child: RichText(
          text: TextSpan(children: <InlineSpan>[
            TextSpan(
              text: "Não tem uma conta?",
              style: TextStyle(
                  color: Colors.blueGrey.shade300,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
            TextSpan(
              text: ' ',
              style: TextStyle(
                  color: Colors.indigo.shade300,
                  fontSize: 12,
                  fontWeight: FontWeight.w700),
            ),
            TextSpan(
              text: "Registrar-se",
              style: TextStyle(
                  color: Colors.lightBlue.shade300,
                  fontSize: 12,
                  fontWeight: FontWeight.w700),
            )
          ]),
          textAlign: TextAlign.center),
    );
  }

  bool validarEmail(String email) {
    const pattern = r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)';
    final regExp = RegExp(pattern);
    return regExp.hasMatch(email);
  }

  void _exibirMensagem(String mensagem) {
    final snackbar = SnackBar(content: Text(mensagem));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void onTapBtnSignUp() async {
    if (_key.currentState!.validate()) {
        print('Email: ${email.text}');
        print('Password: ${senha.text}');
    }
    
    emailValidado = await authRepository.login(email.text, senha.text);

    if(emailValidado){
      Navigator.pushReplacementNamed(context, '/home');
    }else{
         showDialog(
       context:  context,
       builder:  (BuildContext context) {
         return AlertDialog(title: Text("Erro ao logar"),);
    },
   );
    }
  }
  

}
