import 'package:flutter/material.dart';

class BorrowersPage extends StatelessWidget {
  const BorrowersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Borrowers Page'),
      ),
      body: const Center(
        child: Text('Borrowers Page Content'),
      ),
    );
  }
}
