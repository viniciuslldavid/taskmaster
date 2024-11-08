import 'package:flutter/material.dart';
import 'package:tarefas/components/difficulty_stars.dart';
import 'package:tarefas/components/task_boxdecoration.dart';

class Task extends StatefulWidget {
  // Widget que representa uma tarefa
  final String imagemm; // Caminho para a imagem da tarefa
  final String nameTask; // Nome da tarefa
  final int dificulty; // Dificuldade da tarefa
  const Task(this.imagemm, this.nameTask, this.dificulty, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  List<Color> colormaestria = [const Color(0xFF0000FF), const Color(0xFF00FF7F), const Color(0xFFFFA500), const Color(0xFF800080)];
  int level = 0;
  int maestria = 0;
  int contcolormaestria = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      // Espaço entre os lados do widget
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        // Stack para organizar os containers de layout
        children: [
          Container(
            width: 380,
            height: 150,
            decoration: taskBoxDecoration(colormaestria[contcolormaestria]),
          ),
          Column( // Coluna que contém a linha de progresso e o nível
            children: [
              Container(
                decoration: taskBoxDecoration(Colors.white),
                width: 380,
                height: 110,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: taskBoxDecoration(Colors.black38),
                      width: 80,
                      height: 110,
                      child: ClipRRect( // Arredonda as bordas da imagem
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          widget.imagemm,
                          fit: BoxFit.cover, // Ajusta a imagem ao container
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(  // Container que contém o nome da tarefa
                          width: 200,
                          height: 40,
                          child: Text(
                            widget.nameTask,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 25),
                          ),
                        ),
                        Row( // Linha que exibe as estrelas de dificuldade
                            children: [difficultyStars(widget.dificulty)]
                        ),
                      ],
                    ),
                    SizedBox(  // Define o tamanho do botão de upgrade
                      width: 63,
                      height: 55,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              level++;
                              if (level > widget.dificulty * 10) {
                                level = 0;
                                maestria = (maestria + 1).clamp(0, colormaestria.length - 1);  // Limita o valor da maestria
                                contcolormaestria = maestria;
                              }
                            });
                          },
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),  // Botão para aumentar o nível da tarefa
                          child: const Padding(
                            padding: EdgeInsets.all(5.5),
                            child: Column(
                              children: [
                                Icon(Icons.upgrade, color: Colors.white),
                                Text(
                                  'Up',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 240,
                      height: 4,
                      child: LinearProgressIndicator( // Barra de progresso
                        value: widget.dificulty == 0 ? 1 : (level / 10) / widget.dificulty,
                        color: Colors.white,
                        backgroundColor: Colors.black45,
                      ),
                    ),
                    Text(
                      'Nível: $level',
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}