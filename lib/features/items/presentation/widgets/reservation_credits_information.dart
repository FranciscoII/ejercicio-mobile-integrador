import 'package:flutter/material.dart';

import 'number_info.dart';

class ReservationsAndCreditsInformation extends StatelessWidget {
  final int numberOfReservations;
  final int credits;

  const ReservationsAndCreditsInformation(
      {super.key, required this.numberOfReservations, required this.credits});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        NumberInfo(
          iconData: Icons.library_add_check,
          number: numberOfReservations,
        ),
        const SizedBox(
          width: 10.0,
        ),
        NumberInfo(
          iconData: Icons.credit_card,
          number: credits,
          color: credits > 500 ? Colors.red : Colors.black,
        ),
      ],
    );
  }
}
