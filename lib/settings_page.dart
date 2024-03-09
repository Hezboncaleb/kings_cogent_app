import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(
            fontWeight: FontWeight.bold, // Making the title bold
          ),
        ),
        backgroundColor:
            Colors.amberAccent, // Changing the color to Amber Accent
      ),
      body: ListView(
        children: [
          _buildMenuItem(context, 'Notification', const NotificationScreen(),
              Icons.arrow_forward),
          const Divider(), // Divider between menu items
          _buildMenuItem(context, 'Help and Support', const HelpScreen(),
              Icons.arrow_forward),
          const Divider(), // Divider between menu items
          _buildMenuItem(
              context, 'Share', const ShareScreen(), Icons.arrow_forward),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
      BuildContext context, String title, Widget screen, IconData icon) {
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

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification'),
      ),
      body: const Center(
        child: Text('Notification Screen Content'),
      ),
    );
  }
}

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help'),
      ),
      body: const Center(
        child: Text('Help Screen Content'),
      ),
    );
  }
}

class ShareScreen extends StatelessWidget {
  const ShareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Share'),
      ),
      body: const Center(
        child: Text('Share Screen Content'),
      ),
    );
  }
}
