import 'package:flutter/material.dart';
import 'package:kings_cogent_app/borrowers_page.dart';
import 'package:kings_cogent_app/loan_management_page.dart';
import 'package:kings_cogent_app/more_page.dart';
import 'package:kings_cogent_app/settings_page.dart';
import 'package:kings_cogent_app/savings_page.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.4,
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
          _buildListTileWithArrow(
            title: 'Savings',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SavingsPage()),
              );
            },
          ),
          const Divider(),
          _buildListTileWithArrow(
            title: 'Borrowers',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BorrowersPage()),
              );
            },
          ),
          const Divider(),
          _buildListTileWithArrow(
            title: 'Loan Management',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const LoanManagementPage()),
              );
            },
          ),
          const Divider(),
          _buildListTileWithArrow(
            title: 'Settings',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
          ),
          const Divider(),
          _buildListTileWithArrow(
            title: 'More',
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

  Widget _buildListTileWithArrow(
      {required String title, required Function onTap}) {
    return ListTile(
      title: Text(title),
      onTap: () => onTap(),
      trailing: const Icon(Icons.arrow_forward), // Arrow icon on the right side
    );
  }
}
