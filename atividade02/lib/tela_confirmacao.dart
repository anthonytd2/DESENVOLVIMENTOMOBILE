import 'package:flutter/material.dart';

class TelaConfirmacao extends StatelessWidget {
  final String nome;
  final String idade;
  final String email;
  final String sexo;
  final bool termosAceitos;

  const TelaConfirmacao({
    super.key,
    required this.nome,
    required this.idade,
    required this.email,
    required this.sexo,
    required this.termosAceitos,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: const Text("Confirmação"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Nome: $nome", style: const TextStyle(fontSize: 18)),
            Text("Idade: $idade", style: const TextStyle(fontSize: 18)),
            Text("Email: $email", style: const TextStyle(fontSize: 18)),
            Text("Sexo: $sexo", style: const TextStyle(fontSize: 18)),
            Text("Termos aceitos: ${termosAceitos ? "Sim" : "Não"}", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Voltar"),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Editar"),
            ),
          ],
        ),
      ),
    );
  }
}