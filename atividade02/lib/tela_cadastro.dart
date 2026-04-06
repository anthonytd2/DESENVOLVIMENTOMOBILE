import 'package:flutter/material.dart';
import 'tela_confirmacao.dart';

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
  void dispose() {
    nomeController.dispose();
    idadeController.dispose();
    emailController.dispose();
    super.dispose();
  }

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
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: const Text("Cadastro de Usuário"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Preencha os campos abaixo",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: nomeController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: "Nome",
                    hintText: "Digite seu nome completo",
                    contentPadding: const EdgeInsets.all(16.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: idadeController,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: "Idade",
                    hintText: "Ex: 25",
                    contentPadding: const EdgeInsets.all(16.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    labelText: "Email",
                    hintText: "exemplo@email.com",
                    contentPadding: const EdgeInsets.all(16.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: "Sexo",
                    contentPadding: const EdgeInsets.all(16.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
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
                    const Text(
                      "Aceito os termos de uso do app",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    onPressed: _validarCampos,
                    child: const Text(
                      "Cadastrar",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}