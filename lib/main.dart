import 'package:flutter/material.dart';

import 'ItemContent.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RESERVAS',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white24),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'RESERVAS'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Center(child: Text(widget.title)),
      ),
      body: Center(
        child: ListView.separated(
          separatorBuilder: (_,__) => const Divider(thickness: 2.0,),
          itemBuilder: _buildItems,
          itemCount: 10,
        ),
      ),
    );
  }

  Widget? _buildItems(BuildContext context, int index) {
    return const ItemContent();
  }
}
