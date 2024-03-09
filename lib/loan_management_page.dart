import 'package:flutter/material.dart';

class LoanManagementPage extends StatelessWidget {
  const LoanManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Loan Management',
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
            'Loan Summary',
            const LoanSummaryScreen(),
            Icons.arrow_forward,
          ),
          const Divider(), // Divider between menu items
          _buildMenuItem(
            context,
            'Payment History',
            const PaymentHistoryScreen(),
            Icons.arrow_forward,
          ),
          const Divider(), // Divider between menu items
          _buildMenuItem(
            context,
            'Loan Details',
            const LoanDetailsScreen(),
            Icons.arrow_forward,
          ),
          const Divider(), // Divider between menu items
          _buildMenuItem(
            context,
            'Payment Options',
            const PaymentOptionsScreen(),
            Icons.arrow_forward,
          ),
          const Divider(), // Divider between menu items
          _buildMenuItem(
            context,
            'Loan Modification',
            const LoanModificationScreen(),
            Icons.arrow_forward,
          ),
          const Divider(), // Divider between menu items
          _buildMenuItem(
            context,
            'Communication Channels',
            const CommunicationChannelsScreen(),
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

class LoanSummaryScreen extends StatelessWidget {
  const LoanSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loan Summary'),
      ),
      body: const Center(
        child: Text('Loan Summary Content'),
      ),
    );
  }
}

class PaymentHistoryScreen extends StatelessWidget {
  const PaymentHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment History'),
      ),
      body: const Center(
        child: Text('Payment History Content'),
      ),
    );
  }
}

class LoanDetailsScreen extends StatelessWidget {
  const LoanDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loan Details'),
      ),
      body: const Center(
        child: Text('Loan Details Content'),
      ),
    );
  }
}

class PaymentOptionsScreen extends StatelessWidget {
  const PaymentOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Options'),
      ),
      body: const Center(
        child: Text('Payment Options Content'),
      ),
    );
  }
}

class LoanModificationScreen extends StatelessWidget {
  const LoanModificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loan Modification'),
      ),
      body: const Center(
        child: Text('Loan Modification Content'),
      ),
    );
  }
}

class CommunicationChannelsScreen extends StatelessWidget {
  const CommunicationChannelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Communication Channels'),
      ),
      body: const Center(
        child: Text('Communication Channels Content'),
      ),
    );
  }
}
