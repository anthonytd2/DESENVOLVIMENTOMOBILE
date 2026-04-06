import 'package:flutter/material.dart';
import 'tela_cadastro.dart';

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