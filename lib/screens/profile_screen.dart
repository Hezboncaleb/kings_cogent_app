import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PROFILE',
          style: TextStyle(
            fontWeight: FontWeight.bold, // Make the font bold
            color: Colors.black, // Set the text color to black
          ),
        ),
        backgroundColor:
            Colors.amberAccent, // Set the background color to Amber Accent
        centerTitle: true, // Center the title text horizontally
        elevation: 0, // Remove the elevation
        toolbarHeight: 60, // Increase the height of the AppBar
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: Divider(color: Colors.transparent, height: 0),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/profile_image.jpg'),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'John Doe',
                      style: TextStyle(
                        fontSize: 36, // Increase the font size
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'johndoe@example.com',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 20),
                    const Divider(),
                    _buildProfileField('City', 'Kampala'),
                    const Divider(),
                    _buildProfileField('Subcounty', 'Nakawa'),
                    const Divider(),
                    _buildProfileField('Parish', 'Ntinda'),
                    const Divider(),
                    _buildProfileField('Village', 'Ntinda Village'),
                    const Divider(),
                    _buildProfileField('Date of Birth', 'January 1, 1990'),
                    const Divider(),
                    _buildProfileField('National ID Number', '1234567890'),
                    const Divider(),
                    _buildProfileField('Telephone Number 1', '+1234567890'),
                    const Divider(),
                    _buildProfileField('Telephone Number 2', '+0987654321'),
                    const Divider(),
                    _buildProfileField('Next of Kin 1', 'Jane Doe'),
                    const Divider(),
                    _buildProfileField('Next of Kin 2', 'John Smith'),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle logout logic
                        },
                        child: const Text(
                          'Logout',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'KINGS COGENT FINANCE LTD',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Image(
                            image: AssetImage('assets/images/logo.jpg'),
                            height: 50,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Text(
          value,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
