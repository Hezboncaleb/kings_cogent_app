import 'package:flutter/material.dart';

class SavingsPage extends StatelessWidget {
  const SavingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Savings',
          style: TextStyle(
            fontWeight: FontWeight.bold, // Making the title bold
          ),
        ),
        backgroundColor:
            Colors.amberAccent, // Changing the color to Amber Accent
      ),
      body: ListView(
        children: [
          _buildMenuItem(
            context,
            'Savings Account Overview',
            const SavingsAccountOverviewScreen(),
            Icons.arrow_forward,
          ),
          const Divider(), // Divider between menu items
          _buildMenuItem(
            context,
            'Transaction History',
            const TransactionHistoryScreen(),
            Icons.arrow_forward,
          ),
          const Divider(), // Divider between menu items
          _buildMenuItem(
            context,
            'Saving Goals and Plans',
            const SavingGoalsAndPlansScreen(),
            Icons.arrow_forward,
          ),
          const Divider(), // Divider between menu items
          _buildMenuItem(
            context,
            'Interest Calculations',
            const InterestCalculationsScreen(),
            Icons.arrow_forward,
          ),
          const Divider(), // Divider between menu items
          _buildMenuItem(
            context,
            'Transfer Funds',
            const TransferFundsScreen(),
            Icons.arrow_forward,
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context,
    String title,
    Widget screen,
    IconData icon,
  ) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      trailing: Icon(icon),
    );
  }
}

class SavingsAccountOverviewScreen extends StatelessWidget {
  const SavingsAccountOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Savings Account Overview'),
      ),
      body: const Center(
        child: Text('Savings Account Overview Content'),
      ),
    );
  }
}

class TransactionHistoryScreen extends StatelessWidget {
  const TransactionHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction History'),
      ),
      body: const Center(
        child: Text('Transaction History Content'),
      ),
    );
  }
}

class SavingGoalsAndPlansScreen extends StatelessWidget {
  const SavingGoalsAndPlansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saving Goals and Plans'),
      ),
      body: const Center(
        child: Text('Saving Goals and Plans Content'),
      ),
    );
  }
}

class InterestCalculationsScreen extends StatelessWidget {
  const InterestCalculationsScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interest Calculations'),
      ),
      body: const Center(
        child: Text('Interest Calculations Content'),
      ),
    );
  }
}

class TransferFundsScreen extends StatelessWidget {
  const TransferFundsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfer Funds'),
      ),
      body: const Center(
        child: Text('Transfer Funds Content'),
      ),
    );
  }
}
