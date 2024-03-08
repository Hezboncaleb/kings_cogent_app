import 'package:flutter/material.dart';

class LoanManagementPage extends StatelessWidget {
  const LoanManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loan Management Page'),
      ),
      body: const Center(
        child: Text('Loan Management Page Content'),
      ),
    );
  }
}
