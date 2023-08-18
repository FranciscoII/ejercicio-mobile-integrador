import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integrador_mobile/features/items/presentation/cubit/item_list_cubit.dart';
import 'package:integrador_mobile/features/items/presentation/widgets/reservation_credits_information.dart';

import '../../domain/entities/item.dart';
import '../pages/detailPage.dart';
import 'info_label.dart';

class ItemContent extends StatelessWidget {
  final Item item;

  const ItemContent({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final ItemListCubit cubit = context.read<ItemListCubit>();

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
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: ReservationsAndCreditsInformation(
                  numberOfReservations: item.numberOfReservations,
                  credits: item.credits(),
                ),
              ),
            )
          ],
        )),
        GestureDetector(
            onTap: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BlocProvider.value(
                                value: cubit,
                                child: DetailPage(
                                  item: item,
                                ),
                              ))),
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
          text: 'Reservado por ${item.reservedBy!.name}',
          icon: Icons.calendar_month),
      const SizedBox(
        height: 5.0,
      ),
      InfoLabel.returnToStoreDate(item.returnDate()!),
    ]);
  } else {
    return InfoLabel.available();
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
