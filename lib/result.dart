import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    var resultText = "Je bent klaar!";
    if (resultScore <= 10) {
      resultText = "Je bent Perfect! Goed gedaan.";
    } else if (resultScore <= 15) {
      resultText = "Nou, niet slecht. Acceptabel!";
    } else if (resultScore <= 20) {
      resultText = "Doe is je best joch!";
    } else {
      resultText = "OMG! Jij bent zo slecht...";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text("Doe de test opnieuw"),
            onPressed: resetHandler,
            textColor: Colors.red,
          )
        ],
      ),
    );
  }
}
