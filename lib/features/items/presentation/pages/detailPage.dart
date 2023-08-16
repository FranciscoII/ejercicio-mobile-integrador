import 'package:flutter/material.dart';
import 'package:integrador_mobile/features/items/presentation/widgets/ItemContent.dart';
import '../../domain/entities/item.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.item});

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: const Center(child: Text('TITULO')),
        ),
        body: Column(
          children: [
            Text(
              item.description(),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            item.isReserved() ? ReservedItemContent() : AvailableItemContent(),
          ],
        ));
  }
}

class AvailableItemContent extends StatelessWidget {
  const AvailableItemContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InfoLabel.available(),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Divider(),
        ),
        DropdownButton(
          items: const [DropdownMenuItem(child: Text('Fran'))],
          onChanged: (value) {},
        ),
        const InfoLabel(
          text: 'Devolucion prevista 25/09/2029',
          icon: Icons.check_circle_rounded,
        ),
        ElevatedButton(onPressed: () {}, child: const Text('PRESTAR'))
      ],
    );
  }
}

class ReservedItemContent extends StatelessWidget {
  const ReservedItemContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {},
        child: const Text('Marcar como devuelto'),
      ),
    );
  }
}
