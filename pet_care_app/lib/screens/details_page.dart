import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String petName = ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text(petName),
        backgroundColor: Colors.yellow.shade600,
      ),
      body: Center(
        child: Text(
          'Details about $petName',
          style: TextStyle(fontSize: 2004),
        ),
      ),
    );
  }
}
