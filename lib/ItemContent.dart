import 'package:flutter/material.dart';

class ItemContent extends StatelessWidget {
  const ItemContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    ItemTitle(title: 'La copa libertadores es mi obsesion'),
                  ],
                ),
                Text('Reservado por Julian Alvarez el 09/12/2018'),
                Text('Reservado por Pity Martinez el 09/12/2018'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.account_balance),
                    Icon(Icons.access_alarm_sharp)
                  ],
                )
              ],
            )),
        Icon(Icons.arrow_forward_ios)
      ],
    );
  }
}

class ItemTitle extends StatelessWidget {
  final String title;
  const ItemTitle({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(title, textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold),);
  }
}
