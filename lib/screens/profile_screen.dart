import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PROFILE',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.amberAccent,
        centerTitle: true,
        elevation: 0,
        toolbarHeight: 60,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: Divider(color: Colors.transparent, height: 0),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCategoryCard(
              'Personal Information',
              [
                _buildProfileField('First Name', 'John'),
                const Divider(),
                _buildProfileField('Last Name', 'Doe'),
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
              ],
            ),
            const SizedBox(height: 10), // Reduced padding here
            _buildCategoryCard(
              'Working Information',
              [
                _buildProfileField('Company', 'KINGS COGENT FINANCE LTD'),
                const Divider(),
                _buildProfileField('Position', 'Software Engineer'),
              ],
            ),
            const SizedBox(height: 10), // Reduced padding here
            _buildCategoryCard(
              'Family Information',
              [
                _buildProfileField('Next of Kin 1', 'Jane Doe'),
                const Divider(),
                _buildProfileField('Next of Kin 2', 'John Smith'),
              ],
            ),
            const SizedBox(height: 10), // Reduced padding here
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
    );
  }

  Widget _buildCategoryCard(String title, List<Widget> children) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 5), // Reduced margin here
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
            const Divider(),
            Column(
              children: children,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileField(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
