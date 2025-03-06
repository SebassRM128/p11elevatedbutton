import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final List<Map<String, dynamic>> buttons = [
    {'text': '+', 'size': 30.0, 'color': Colors.blue},
    {'text': '+ Create', 'color': Colors.green},
    {'text': '+', 'size': 25.0, 'color': Colors.orange},
    {'text': '+', 'size': 25.0, 'color': Colors.red},
    {
      'icon': Icons.home,
      'label': 'Icono 1',
      'size': 18.0,
      'color': Colors.purple
    },
    {
      'icon': Icons.search,
      'label': 'Icono 2',
      'size': 16.0,
      'color': Colors.cyan
    },
    {
      'icon': Icons.settings,
      'label': 'Icono 3',
      'size': 14.0,
      'color': Colors.teal
    },
    {
      'icon': Icons.person,
      'label': 'Icono 4',
      'size': 16.0,
      'color': Colors.amber
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: const Text('Gael Sebastian Rojas Mata'),
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child:
                  Text('Mat: 22308051281303', style: TextStyle(fontSize: 16)),
            ),
            Expanded(
              child: Center(
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: buttons.map((buttonData) {
                    return buttonData.containsKey('icon')
                        ? _buildIconButton(
                            buttonData['label'], buttonData['icon'], context,
                            fontSize: buttonData['size'],
                            backgroundColor: buttonData['color'])
                        : _buildButton(buttonData['text'], context,
                            fontSize: buttonData['size'],
                            backgroundColor: buttonData['color']);
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String text, BuildContext context,
      {double? fontSize, required Color backgroundColor}) {
    return _buildButtonOrIcon(
        ElevatedButton(
            onPressed: () => print('Botón "$text" presionado'),
            child: Text(text, style: TextStyle(fontSize: fontSize ?? 16)),
            style: _buttonStyle(backgroundColor)),
        context);
  }

  Widget _buildIconButton(String text, IconData icon, BuildContext context,
      {double? fontSize, required Color backgroundColor}) {
    return _buildButtonOrIcon(
        ElevatedButton.icon(
            onPressed: () => print('Botón "$text" presionado'),
            icon: Icon(icon),
            label: Text(text, style: TextStyle(fontSize: fontSize ?? 16)),
            style: _buttonStyle(backgroundColor)),
        context);
  }

  Widget _buildButtonOrIcon(Widget button, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 9,
              offset: const Offset(0, 3)),
        ],
      ),
      child: button,
    );
  }

  ButtonStyle _buttonStyle(Color backgroundColor) {
    return ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    );
  }
}
