import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integrador_mobile/features/items/domain/entities/person.dart';
import 'package:integrador_mobile/features/items/presentation/widgets/ItemContent.dart';
import '../../domain/entities/item.dart';
import '../cubit/item_list_cubit.dart';

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 180,
              child: Placeholder(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                item.description(),
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            item.isReserved()
                ? ReservedItemContent(item: item)
                : AvailableItemContent(
                    item: item,
                  ),
          ],
        ));
  }
}

List<Person> people = [
  Person('Francisco Cortez'),
  Person('El barto'),
  Person('Mauro Bosseti')
];

class AvailableItemContent extends StatefulWidget {
  final Item item;

  const AvailableItemContent({super.key, required this.item});

  @override
  State<AvailableItemContent> createState() => _AvailableItemContentState();
}

class _AvailableItemContentState extends State<AvailableItemContent> {
  Person selectedPerson = people.first;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InfoLabel.available(),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Divider(),
        ),
        DropdownButton<Person>(
          value: selectedPerson,
          icon: const Icon(Icons.person),
          elevation: 26,
          onChanged: (Person? value) {
            setState(() {
              selectedPerson = value!;
            });
          },
          items: people.map<DropdownMenuItem<Person>>((Person value) {
            return DropdownMenuItem<Person>(
              value: value,
              child: Text(value.name),
            );
          }).toList(),
        ),
        const InfoLabel(
          text: 'Devolucion prevista 25/09/2029',
          icon: Icons.check_circle_rounded,
        ),
        ElevatedButton(
            onPressed: () {
              final elcubitardo = context.read<ItemListCubit>();
              elcubitardo.reserveItem(widget.item, selectedPerson);
              Navigator.pop(context);
            },
            child: const Text('PRESTAR'))
      ],
    );
  }
}

class ReservedItemContent extends StatelessWidget {
  final Item item;

  const ReservedItemContent({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        InfoLabel(
            text: 'Reservado por ${item.reservedBy!.name}',
            icon: Icons.calendar_month),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
          onPressed: () {
            item.returnToStore();
            Navigator.pop(context);
          },
          child: const Text('Marcar como devuelto'),
        ),
      ]),
    );
  }
}
