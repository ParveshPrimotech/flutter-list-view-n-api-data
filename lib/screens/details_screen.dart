import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget{
  const DetailsScreen({super.key});

  @override
  State<StatefulWidget> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
      ),
      body: Container(
        padding: const EdgeInsets.all(0),
      ),
    );
  }
}