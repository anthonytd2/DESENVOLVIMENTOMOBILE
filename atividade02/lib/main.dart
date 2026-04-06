import 'package:flutter/material.dart';

void main() {
  runApp(const MeuAplicativo());
}

class MeuAplicativo extends StatelessWidget {
  const MeuAplicativo({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TelaCadastro(),
    );
  }
}

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({super.key});

  @override
  _TelaCadastroState createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController idadeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  String? sexoSelecionado;
  bool termosAceitos = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro de Usuário"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Preencha os campos abaixo"),
              const SizedBox(height: 20),
              TextField(
                controller: nomeController,
                decoration: const InputDecoration(labelText: "Nome"),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: idadeController,
                decoration: const InputDecoration(labelText: "Idade"),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: "Email"),
              ),
              const SizedBox(height: 20),
              DropdownButton<String>(
                hint: const Text("Selecione o Sexo"),
                value: sexoSelecionado,
                items: const [
                  DropdownMenuItem(value: "Masculino", child: Text("Masculino")),
                  DropdownMenuItem(value: "Feminino", child: Text("Feminino")),
                  DropdownMenuItem(value: "Outro", child: Text("Outro")),
                ],
                onChanged: (String? novoValor) {
                  setState(() {
                    sexoSelecionado = novoValor;
                  });
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: termosAceitos,
                    onChanged: (bool? novoValor) {
                      setState(() {
                        termosAceitos = novoValor ?? false;
                      });
                    },
                  ),
                  const Text("Aceito os termos de uso"),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Cadastrar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}