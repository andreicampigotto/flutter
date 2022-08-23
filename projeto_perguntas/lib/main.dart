import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _total = 0;
  final _perguntas = const [
    {
      'texto': 'Qual sua cor favorita? ',
      'respostas': [
        {'texto': 'Branco', 'score': 1},
        {'texto': 'Preto', 'score': 2},
        {'texto': 'Verde', 'score': 3},
        {'texto': 'Azul', 'score': 4},
      ],
    },
    {
      'texto': 'Qual seu animal favorito? ',
      'respostas': [
        {'texto': 'Gato', 'score': 4},
        {'texto': 'Coruja', 'score': 3},
        {'texto': 'Pinguim', 'score': 2},
        {'texto': 'Leão', 'score': 1},
      ],
    },
  ];

  void _responder(int score) {
    if (estaSelecionado) {
      setState(() {
        _perguntaSelecionada++;
        _total += score;
      });
    }
    print(_perguntaSelecionada);
  }

  bool get estaSelecionado {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    //List<Widget> widgets =
    //respostas.map((t) => Resposta(t, _responder)).toList();

    //abordagem imperativa
    // for (String textoResp in respostas) {
    //   widgets.add(Resposta(textoResp, _responder));
    // }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: estaSelecionado
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _responder)
            : Resultado(),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
