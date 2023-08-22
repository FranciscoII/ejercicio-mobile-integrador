import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/item.dart';
import '../cubit/item_list_cubit.dart';

class DetailPageActionButton extends StatelessWidget {
  final Item item;
  final String text;
  final Function onPress;

  const DetailPageActionButton(
      {super.key,
      required this.item,
      required this.text,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.zero)),
          minimumSize: const Size.fromHeight(50),
          backgroundColor: Theme.of(context).colorScheme.secondary),
      onPressed: () {
        context.read<ItemListCubit>().returnItem(item);
        Navigator.pop(context);
      },
      child: Text(text,
        style: Theme.of(context).textTheme.labelMedium,
      ),
    );
  }
}
