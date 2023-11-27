import 'package:app_1/apis.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Screen(),
    ));

class Screen extends StatefulWidget {
  Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  final _numberInputController = TextEditingController();

  String _resultText = 'type number and get result';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: _numberInputController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              hintText: 'note it!',
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              final _number = _numberInputController.text;
              final _result = await getNumberFact(number: _number);
              print(_result.text);
              setState(() {
                _resultText = _result.text ?? 'no text found';
              });
            },
            child: const Text('get it'),
          ),
          Text(_resultText)
        ],
      ),
    )));
  }
}
