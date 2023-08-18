import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InfoLabel extends StatelessWidget {
  final String text;
  final IconData icon;

  const InfoLabel({super.key, required this.text, required this.icon});

  factory InfoLabel.available() {
    return const InfoLabel(
      text: 'Disponible',
      icon: Icons.calendar_month,
    );
  }
  factory InfoLabel.returnToStoreDate(DateTime returnDate){
    return InfoLabel(
      text: 'Devolucion prevista: ${DateFormat('dd/MM/yyyy').format(returnDate)}',
      icon: Icons.check_circle_rounded,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(icon),
        const SizedBox(width: 4.0),
        Text(
          text,
          style: Theme.of(context).textTheme.labelSmall,
        )
      ],
    );
  }
}
