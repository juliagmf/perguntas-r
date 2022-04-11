import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': 'O que Luke Skywalker perdeu em sua luta com Darth Vader?',
      'respostas': [
        {'texto': 'A mão esquerda', 'pontuacao': 0},
        {'texto': 'O pé esquerdo', 'pontuacao': 0},
        {'texto': 'A mão direita', 'pontuacao': 10},
        {'texto': 'Perna esquerda', 'pontuacao': 0},
        
      ],
    },
    {
      'texto': 'Onde as Guerras Clônicas começaram?',
      'respostas': [
        {'texto': 'Tatooine', 'pontuacao': 0},
        {'texto': 'Geonosis', 'pontuacao': 10},
        {'texto': 'Naboo', 'pontuacao': 0},
        {'texto': 'Coruscant', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Qual é a arma de escolha de Chewbacca?',
      'respostas': [
        {'texto': 'Rifle blaster', 'pontuacao': 0},
        {'texto': 'Sabre de luz', 'pontuacao': 0},
        {'texto': 'Clube de metal', 'pontuacao': 0},
        {'texto': 'Bowcaster', 'pontuacao': 10},
      ],
    },
    {
      'texto': 'Onde as Guerras Clônicas começaram?',
      'respostas': [
        {'texto': 'Tatooine', 'pontuacao': 0},
        {'texto': 'Geonosis', 'pontuacao': 10},
        {'texto': 'Naboo', 'pontuacao': 0},
        {'texto': 'Coruscant', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Qual era o título original do filme Star Wars?',
      'respostas': [
        {'texto': 'Batalhas Estelares', 'pontuacao': 0},
        {'texto': 'Aventuras de Luke Starkiller', 'pontuacao': 10},
        {'texto': 'As Aventuras dos Jedi', 'pontuacao': 0},
        {'texto': 'Batalhas no Espaço', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Quem destrói a segunda Estrela da Morte?',
      'respostas': [
        {'texto': 'Han Solo com um X-Wing', 'pontuacao': 0},
        {'texto': 'Luke Skywalker com um Speeder', 'pontuacao': 0},
        {'texto': 'Jar Jar Binks com uma asa em Y', 'pontuacao': 0},
        {'texto': 'Lando Calrissian com o Millennium Falcon', 'pontuacao': 10},
      ],
    },
    {
      'texto': 'Quem adotou a filha de Padmé Amidala?',
      'respostas': [
        {'texto': 'Organo de fiança', 'pontuacao': 10},
        {'texto': 'Capitão Antilhas', 'pontuacao': 0},
        {'texto': 'Owen e Beru Lars', 'pontuacao': 0},
        {'texto': 'Gidean Danu', 'pontuacao': 0},
      ],
    },
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quantoResponder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
