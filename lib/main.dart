import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integrador_mobile/features/items/data/repositories/item_repository_impl.dart';
import 'package:integrador_mobile/features/items/domain/repositories/item_repository.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'features/items/presentation/pages/homepage.dart';

void main() {
  initializeDateFormatting();
  runApp(MyApp(itemRepository: ItemRepositoryImpl(),));
}

class MyApp extends StatelessWidget {
  final ItemRepository itemRepository;
  const MyApp({required this.itemRepository, super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RESERVAS',
      theme: ThemeData(
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white24),
        useMaterial3: true,
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
          titleSmall: TextStyle(
            fontSize: 14,
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
          ),
          bodySmall: TextStyle(
            fontSize: 12,
            fontStyle: FontStyle.italic,
          ),
          labelLarge: TextStyle(
            fontSize: 20,
          ),
          labelMedium: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          labelSmall: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      home: RepositoryProvider.value(value: itemRepository, child: HomePage(title: 'RESERVAS')),
    );
  }
}
