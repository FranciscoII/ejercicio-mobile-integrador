import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integrador_mobile/features/items/domain/entities/person.dart';
import 'package:integrador_mobile/features/items/presentation/widgets/detail_page_action_button.dart';
import 'package:integrador_mobile/features/items/presentation/widgets/reservation_credits_information.dart';
import '../../domain/entities/item.dart';
import '../cubit/item_list_cubit.dart';
import '../widgets/info_label.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.item});

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.secondary,
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InfoLabel.available(),
              ReservationsAndCreditsInformation(
                  numberOfReservations: widget.item.numberOfReservations,
                  credits: widget.item.credits())
            ],
          ),
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
          InfoLabel.returnToStoreDate(
              DateTime.now().add(widget.item.numberOfDaysToReturn())),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.zero)),
                  minimumSize: const Size.fromHeight(40),
                  backgroundColor: Theme.of(context).colorScheme.secondary),
              onPressed: () {
                context
                    .read<ItemListCubit>()
                    .reserveItem(widget.item, selectedPerson);
                Navigator.pop(context);
              },
              child: Text('PRESTAR',
                  style: Theme.of(context).textTheme.labelLarge))
        ],
      ),
    );
  }
}

class ReservedItemContent extends StatelessWidget {
  final Item item;

  const ReservedItemContent({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    Scaffold.of(context).showBottomSheet((context) =>DetailPageActionButton(
      item: item,
      text: 'ext',
      onPress: () {
        item.isReserved()
            ? context.read<ItemListCubit>().returnItem(item)
            : context.read<ItemListCubit>().reserveItem(item, Person('hola'));
        Navigator.pop(context);
      },
    ));

    return Center(
      child: Column(children: [
        InfoLabel(
            text: 'Reservado por ${item.reservedBy!.name}',
            icon: Icons.calendar_month),
      ]),
    );
  }
}
