import 'package:flutter/material.dart';
import 'package:integrador_mobile/features/items/presentation/widgets/ItemContent.dart';
import '../../domain/entities/item.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.title, required this.item});

  final String title;
  final Item item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Center(child: Text('TITULO')),
        ),
        body: Column(
          children: [
            Text(
              item.description(),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            InfoLabel(
              text: 'Disponible',
              icon: Icons.calendar_month,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Divider(),
            ),
            DropdownButton(
              items: const [DropdownMenuItem(child: Text('Fran'))],
              onChanged: (value) {},
            ),
            InfoLabel(
              text: 'Devolucion prevista 25/09/2029',
              icon: Icons.check_circle_rounded,
            ),
            ElevatedButton(onPressed: (){}, child: Text('PRESTAR'))
          ],
        ));
  }
}
