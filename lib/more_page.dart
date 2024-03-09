import 'package:flutter/material.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'More',
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
              context, 'About Us', const AboutUsScreen(), Icons.arrow_forward),
          const Divider(), // Divider between menu items
          _buildMenuItem(context, 'Contact Us', const ContactUsScreen(),
              Icons.arrow_forward),
          const Divider(), // Divider between menu items
          _buildMenuItem(
              context, 'Our Team', const OurTeamScreen(), Icons.arrow_forward),
          const Divider(), // Divider between menu items
          _buildMenuItem(context, 'Our Services', const OurServicesScreen(),
              Icons.arrow_forward),
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

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: const Center(
        child: Text('About Us Content'),
      ),
    );
  }
}

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
      ),
      body: const Center(
        child: Text('Contact Us Content'),
      ),
    );
  }
}

class OurTeamScreen extends StatelessWidget {
  const OurTeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Our Team'),
      ),
      body: const Center(
        child: Text('Our Team Content'),
      ),
    );
  }
}

class OurServicesScreen extends StatelessWidget {
  const OurServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Our Services'),
      ),
      body: const Center(
        child: Text('Our Services Content'),
      ),
    );
  }
}
