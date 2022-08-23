import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int score;
  final void Function() reiniciaQuestionario;

  Resultado(this.score, this.reiniciaQuestionario);
  String get validaResultado {
    if (score <= 2) {
      return 'Parabéns';
    } else if (score <= 3) {
      return 'Para béns';
    } else {
      return 'GOOD';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            validaResultado,
            style: TextStyle(fontSize: 28),
          ),
        ),
        TextButton(
          onPressed: reiniciaQuestionario,
          child: Text('Reiniciar'),
        )
      ],
    );
  }
}
