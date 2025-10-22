import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const SassoCartaForbice());
}

class SassoCartaForbice extends StatelessWidget {
  const SassoCartaForbice({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SCF!!',
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      home: const MyHomePage(title: 'Sasso carta forbice!'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _scelta = "";
  String _sceltaPC = "";
  String _vittoria = "Chi vincerà?";

  String _sceltaAI() {
    var value = Random().nextInt(3);
    if (value == 0) return "sasso";
    if (value == 1) return "carta";
    return "forbice";
  }

  void _sassoButton() {
    setState(() {
      _scelta = "sasso";
      _sceltaPC = _sceltaAI();
      _checkWin();
    });
  }

  void _cartaButton() {
    setState(() {
      _scelta = "carta";
      _sceltaPC = _sceltaAI();
      _checkWin();
    });
  }

  void _forbiceButton() {
    setState(() {
      _scelta = "forbice";
      _sceltaPC = _sceltaAI();
      _checkWin();
    });
  }

  void _checkWin() {
    if (_scelta == _sceltaPC) {
      _vittoria = "HAI PAREGGIATO";
    } else if (
      (_scelta == "sasso" && _sceltaPC == "forbice") ||
      (_scelta == "forbice" && _sceltaPC == "carta") ||
      (_scelta == "carta" && _sceltaPC == "sasso")
    ) {
      _vittoria = "HAI VINTO";
    } else {
      _vittoria = "HAI PERSO";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 196, 23, 181),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Sasso Carta Forbice:',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            Text(
              'Tu: $_scelta\nPC: $_sceltaPC',
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              _vittoria,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: _sassoButton,
            tooltip: 'Sasso',
            backgroundColor: Colors.red,
            child: const Icon(Icons.circle),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: _cartaButton,
            tooltip: 'Carta',
            backgroundColor: Colors.blue,
            child: const Icon(Icons.description),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: _forbiceButton,
            tooltip: 'Forbice',
            backgroundColor: Colors.green,
            child: const Icon(Icons.content_cut),
          ),
        ],
      ),
    );
  }
}
