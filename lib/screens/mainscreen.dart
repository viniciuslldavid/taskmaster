import 'package:flutter/material.dart';
import 'package:tarefas/components/task.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool opacity = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        // Barra azul no topo (AppBar)
        title: const Text(
          'Tarefas',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        leading: const SizedBox(),
      ),
      body: AnimatedOpacity(
        opacity: opacity ? 1 : 0,
        duration: const Duration(milliseconds: 250),
        child: ListView(
          children: const [
            Task('assets/images/andardeskate2.jpg', 'Andar de skate', 3),
            Task('assets/images/bike.jpeg', 'Andar de bike', 3),
            Task('assets/images/flutter.png', 'Aprender Flutter', 4),
            Task('assets/images/livro.jpg', 'Ler', 1),
            Task('assets/images/meditar.jpeg', 'Meditar', 2),
            SizedBox(
              height: 80,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opacity = !opacity;
          });
        },
        backgroundColor: Colors.blue,  // Cor de fundo
        foregroundColor: Colors.white, // Cor do ícone
        shape: RoundedRectangleBorder(  // Formato do botão
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
