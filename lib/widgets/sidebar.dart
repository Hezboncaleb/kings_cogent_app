import 'package:flutter/material.dart';
import 'package:kings_cogent_app/loans_page.dart';
import 'package:kings_cogent_app/more_page.dart';
import 'package:kings_cogent_app/settings_page.dart';
import 'package:kings_cogent_app/savings_page.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.6, // Increase the width
      child: ListView(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
        children: <Widget>[
          Container(
            height: 60,
            decoration: const BoxDecoration(
              color: Colors.amberAccent,
            ),
            child: const Center(
              child: Text(
                'MENU',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          const Divider(),
          _buildListTileWithIcon(
            title: 'Savings',
            icon: Icons.account_balance,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SavingsPage()),
              );
            },
          ),
          const Divider(),
          _buildListTileWithIcon(
            title: 'Loans',
            icon: Icons.business,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoansPage()),
              );
            },
          ),
          const Divider(),
          _buildListTileWithIcon(
            title: 'Settings',
            icon: Icons.settings,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
          ),
          const Divider(),
          _buildListTileWithIcon(
            title: 'More',
            icon: Icons.more_horiz,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MorePage()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildListTileWithIcon(
      {required String title,
      required IconData icon,
      required Function onTap}) {
    return ListTile(
      leading: Icon(icon), // Icon on the left side
      title: Text(title),
      onTap: () => onTap(),
      trailing: const Icon(Icons.arrow_forward), // Arrow icon on the right side
    );
  }
}
