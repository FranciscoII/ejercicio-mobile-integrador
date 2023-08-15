import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/item.dart';
import '../pages/detailPage.dart';

class ItemContent extends StatelessWidget {
  final Item item;

  const ItemContent({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: ItemTitle(title: item.description()),
            ),
            _buildContent(item),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.library_add_check),
                Icon(Icons.airplane_ticket)
              ],
            )
          ],
        )),
        GestureDetector(
            onTap: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DetailPage(title: 'Copa', item: item,))),
                },
            child: const Icon(Icons.arrow_forward_ios))
      ],
    );
  }
}

Widget _buildContent(Item item) {
  if (item.isReserved()) {
    return Column(children: [
      InfoLabel(
          text: 'Reservado por ${item.reservedBy.name}',
          icon: Icons.calendar_month),
      const SizedBox(
        height: 5.0,
      ),
      InfoLabel(
          text:
              'Devolucion prevista el ${DateFormat('dd/MM/yyyy').format(item.returnDate()!)}',
          icon: Icons.check_circle_rounded),
    ]);
  } else {
    return const InfoLabel(text: 'Disponible', icon: Icons.calendar_month);
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
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

class InfoLabel extends StatelessWidget {
  final String text;
  final IconData icon;

  const InfoLabel({super.key, required this.text, required this.icon});

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
