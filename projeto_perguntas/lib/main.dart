import 'package:flutter/material.dart';
import 'package:projeto_perguntas/resposta.dart';
import './questao.dart';
import './resposta.dart';
import './resultado.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  final _perguntas = const [
    {
      'texto': 'Qual sua cor favorita? ',
      'respostas': ['Branco', 'Preto', 'Verde', 'Azul']
    },
    {
      'texto': 'Qual seu animal favorito? ',
      'respostas': ['Gato', 'Coruja', 'Pinguim', 'Leão']
    },
  ];

  void _responder() {
    if (estaSelecionado) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
    print(_perguntaSelecionada);
  }

  bool get estaSelecionado {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    //abordagem declarativa
    List<String> respostas = estaSelecionado
        ? _perguntas[_perguntaSelecionada].cast()['respostas']
        : [];
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
            ? Column(
                children: <Widget>[
                  Questao(_perguntas[_perguntaSelecionada]['texto'].toString()),
                  ...respostas.map((t) => Resposta(t, _responder)).toList(),
                ],
              )
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
