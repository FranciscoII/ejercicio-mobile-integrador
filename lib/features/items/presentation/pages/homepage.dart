import 'package:flutter/material.dart';

import '../widgets/ItemContent.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Center(child: Text(widget.title, style: Theme.of(context).textTheme.titleLarge,)),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 3.0, top: 5.0),
          child: ListView.separated(
            separatorBuilder: (_,__) => const Divider(thickness: 1.0,),
            itemBuilder: _buildItems,
            itemCount: 9,
          ),
        ),
      ),
    );
  }

  Widget? _buildItems(BuildContext context, int index) {
    return const ItemContent();
  }
}
