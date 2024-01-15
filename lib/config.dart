import 'package:flutter/material.dart';

class PanelConfiguracion extends StatelessWidget {
  const PanelConfiguracion({super.key, required this.cambiarIncremento});

  final void Function(String) cambiarIncremento;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(),
            labelText: 'Cambiar Factor del contador',
          ),
          onChanged: (value) {
            cambiarIncremento(value);
          },
        ),
      ],
    );
  }
}
