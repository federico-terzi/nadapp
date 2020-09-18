import 'package:flutter/material.dart';

class MyDoctorsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diario alimentare'),
      ),
      body: Center(child: Text('You have pressed')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Aggiungi pasto',
        child: const Icon(Icons.add),
      ),
    );
  }

}