import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pedra, Papel, Tesoura',
      debugShowCheckedModeBanner: false,
      home: const TelaJogo(),
    );
  }
}

class TelaJogo extends StatefulWidget {
  const TelaJogo({super.key});

  @override
  State<TelaJogo> createState() => _TelaJogoState();
}

class _TelaJogoState extends State<TelaJogo> {
  var imagemApp = const AssetImage("assets/images/circulo.png");

  void _jogar(String escolhaDoUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numeroSorteado = Random().nextInt(3);
    var escolhaDoApp = opcoes[numeroSorteado];

    setState(() {
      imagemApp = AssetImage("assets/images/$escolhaDoApp.png");
    });

    String resultadoDaPartida;

    if (escolhaDoUsuario == escolhaDoApp) {
      resultadoDaPartida = "Empate!";
    } else if ((escolhaDoUsuario == "pedra" && escolhaDoApp == "tesoura") ||
        (escolhaDoUsuario == "tesoura" && escolhaDoApp == "papel") ||
        (escolhaDoUsuario == "papel" && escolhaDoApp == "pedra")) {
      resultadoDaPartida = "Você Ganhou!";
    } else {
      resultadoDaPartida = "Você Perdeu!";
    }

    Future.delayed(const Duration(seconds: 1), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TelaResultado(
            resultado: resultadoDaPartida,
            imagemDoApp: escolhaDoApp,
            imagemDoUsuario: escolhaDoUsuario,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pedra, Papel, Tesoura"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "Escolha do App:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Image(image: imagemApp, height: 120),
            const Text(
              "Sua Escolha:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => _jogar("pedra"),
                  child: Image.asset("assets/images/pedra.png", height: 100),
                ),
                GestureDetector(
                  onTap: () => _jogar("papel"),
                  child: Image.asset("assets/images/papel.png", height: 100),
                ),
                GestureDetector(
                  onTap: () => _jogar("tesoura"),
                  child: Image.asset("assets/images/tesoura.png", height: 100),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class TelaResultado extends StatelessWidget {
  final String resultado;
  final String imagemDoApp;
  final String imagemDoUsuario; // Recebendo a sua escolha

  const TelaResultado({
    super.key,
    required this.resultado,
    required this.imagemDoApp,
    required this.imagemDoUsuario,
  });

  @override
  Widget build(BuildContext context) {
    String iconeResultado = "assets/images/circulo.png";
    if (resultado == "Você Ganhou!") {
      iconeResultado = "assets/images/ganhar.png";
    } else if (resultado == "Empate!") {
      iconeResultado = "assets/images/apertodemaos.png";
    } else if (resultado == "Você Perdeu!") {
      iconeResultado = "assets/images/perder.png";
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Resultado"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            Image.asset("assets/images/$imagemDoApp.png", height: 80),
            const Text(
              "Escolha do App",
              style: TextStyle(fontSize: 18),
            ),


            Image.asset("assets/images/$imagemDoUsuario.png", height: 80),
            const Text(
              "Sua Escolha",
              style: TextStyle(fontSize: 18),
            ),


            Image.asset(
              iconeResultado,
              height: 150,
              width: 150,
              fit: BoxFit.contain,
            ),


            Text(
              resultado,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),


            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: const Text("Jogar Novamente", style: TextStyle(fontSize: 18)),
            )
          ],
        ),
      ),
    );
  }
}