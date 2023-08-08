import 'package:flutter/material.dart';
import 'package:integrador_mobile/pages/detailPage.dart';

class ItemContent extends StatelessWidget {
  const ItemContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
            child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: ItemTitle(title: '"La copa libertadores es mi obsesion"'),
            ),
            InfoLabel(text: 'Reservado por Julian Alvarez el 09/12/2018', icon: Icons.calendar_month),
            SizedBox(height: 5.0,),
            InfoLabel(text: 'Devolucion prevista el 09/12/2018', icon: Icons.check_circle_rounded),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.library_add_check),
                Icon(Icons.airplane_ticket)
              ],
            )
          ],
        )),
        GestureDetector(onTap: () => {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const DetailPage(title: 'Copa'))),
        }, child: const Icon(Icons.arrow_forward_ios))
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
    return Row(
      children: [
        Text(
          title,
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ],
    );
  }
}

class InfoLabel extends StatelessWidget {
  final String text;
  final IconData icon;

  const InfoLabel({
    super.key,
    required this.text,
    required this.icon
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(icon),
        const SizedBox(width: 4.0),
        Text(text, style: Theme.of(context).textTheme.labelSmall,)
      ],
    );
  }
}

