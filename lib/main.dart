import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Operaciones Aritméticas',
      home: CalculatorHome(),
    );
  }
}

class CalculatorHome extends StatefulWidget {
  @override
  _CalculatorHomeState createState() => _CalculatorHomeState();
}

class _CalculatorHomeState extends State<CalculatorHome> {
  final TextEditingController _firstNumberController = TextEditingController();
  final TextEditingController _secondNumberController = TextEditingController();
  String _selectedOperation = '+';
  double _result = 0.0;

  void _calculateResult() {
    double num1 = double.tryParse(_firstNumberController.text) ?? 0.0;
    double num2 = double.tryParse(_secondNumberController.text) ?? 0.0;

    switch (_selectedOperation) {
      case '+':
        _result = num1 + num2;
        break;
      case '-':
        _result = num1 - num2;
        break;
      case '*':
        _result = num1 * num2;
        break;
      case '/':
        _result = num2 != 0 ? num1 / num2 : 0.0; // Evitar división por cero
        break;
      default:
        _result = 0.0;
    }
    setState(() {}); // Actualizar la UI con el nuevo resultado
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Operaciones Aritméticas"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _firstNumberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Ingrese el primer número",
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _secondNumberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Ingrese el segundo número",
              ),
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              value: _selectedOperation,
              items: ['+', '-', '*', '/'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedOperation = newValue!;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateResult,
              child: Text("Calcular"),
            ),
            SizedBox(height: 20),
            Text(
              "Resultado: $_result",
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
