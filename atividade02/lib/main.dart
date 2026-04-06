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

  void _validarCampos() {
    if (nomeController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Nome não pode ser vazio")),
      );
      return;
    }

    if (idadeController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Idade não pode ser vazia")),
      );
      return;
    }

    try {
      int idade = int.parse(idadeController.text);
      if (idade < 18) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Idade deve ser maior ou igual a 18")),
        );
        return;
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Idade deve ser um número")),
      );
      return;
    }

    if (emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Email não pode ser vazio")),
      );
      return;
    }

    if (!emailController.text.contains("@") || !emailController.text.contains(".")) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Email deve conter '@' e '.'")),
      );
      return;
    }

    if (sexoSelecionado == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Sexo deve estar selecionado")),
      );
      return;
    }

    if (termosAceitos == false) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("O checkbox dos termos deve estar marcado")),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TelaConfirmacao(
          nome: nomeController.text,
          idade: idadeController.text,
          email: emailController.text,
          sexo: sexoSelecionado!,
          termosAceitos: termosAceitos,
        ),
      ),
    );
  }

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
                onPressed: _validarCampos,
                child: const Text("Cadastrar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
      appBar: AppBar(
        title: const Text("Confirmação"),
      ),
      body: const Center(
        child: Text("Tela 2: Dados recebidos com sucesso!"),
      ),
    );
  }
}