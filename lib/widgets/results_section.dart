import 'package:flutter/material.dart';

class ResultsSection extends StatelessWidget {
  const ResultsSection({
    super.key,
    this.history = '',
    this.textToDisplay = '',
  });

  final String history, textToDisplay;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      height: MediaQuery.of(context).size.height * .4,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            history,
            style: const TextStyle(fontSize: 35, color: Colors.grey),
          ),
          Text(
            textToDisplay,
            style: const TextStyle(fontSize: 80, color: Colors.blueGrey),
          ),
        ],
      ),
    );
  }
}
