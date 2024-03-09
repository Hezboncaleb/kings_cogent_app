import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:kings_cogent_app/screens/agricultural_loan_screen.dart';
import 'package:kings_cogent_app/screens/business_loan_screen.dart';
import 'package:kings_cogent_app/screens/emergency_loan_screen.dart';
import 'package:kings_cogent_app/screens/personal_loan_screen.dart';
import 'package:kings_cogent_app/screens/profile_screen.dart';
import 'package:kings_cogent_app/screens/salary_loan_screen.dart';
import 'package:kings_cogent_app/screens/school_fees_loan_screen.dart';
import 'package:kings_cogent_app/widgets/sidebar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          title: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.amberAccent, // Button background color
              borderRadius: BorderRadius.circular(10.0), // Button border radius
            ),
            child: const Text(
              'KINGS COGENT',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                fontFamily: 'MadimiOne-Regular', // Example of a good font
                color: Colors.white, // Text color
              ),
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ),
                );
              },
              iconSize: 30,
            ),
          ],
        ),
      ),
      drawer: const SideBar(),
      body: Column(
        children: [
          const Divider(
            height: 1,
            thickness: 1,
            color: Colors.black87,
          ),
          Expanded(
            child: CustomScrollView(
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      CarouselSlider(
                        items: [
                          Image.asset(
                            'assets/images/2.jpg',
                            fit: BoxFit.fill,
                          ),
                          Image.asset(
                            'assets/images/3.jpg',
                            fit: BoxFit.fill,
                          ),
                          Image.asset(
                            'assets/images/4.jpg',
                            fit: BoxFit.fill,
                          ),
                        ],
                        options: CarouselOptions(
                          height: 200,
                          viewportFraction: 1.0,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 800),
                          enableInfiniteScroll: true,
                          pauseAutoPlayOnTouch: true,
                          reverse: false,
                          scrollDirection: Axis.horizontal,
                          enlargeCenterPage: true,
                          aspectRatio: 2.0,
                          onPageChanged: (index, reason) {},
                          scrollPhysics: const BouncingScrollPhysics(),
                        ),
                      ),
                      GridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        children: const [
                          LoanTile(
                              title: 'School Fees Loan',
                              imagePath: 'assets/images/school fees.jpg'),
                          LoanTile(
                              title: 'Salary Loan',
                              imagePath: 'assets/images/salary.jpg'),
                          LoanTile(
                              title: 'Emergency Loan',
                              imagePath: 'assets/images/emergency.jpg'),
                          LoanTile(
                              title: 'Personal Loan',
                              imagePath: 'assets/images/personal.jpg'),
                          LoanTile(
                              title: 'Agricultural Loan',
                              imagePath: 'assets/images/Agricultrue.jpg'),
                          LoanTile(
                              title: 'Business Loan',
                              imagePath: 'assets/images/business.jpg'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LoanTile extends StatelessWidget {
  final String title;
  final String imagePath;

  const LoanTile({Key? key, required this.title, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    void navigateToLoanScreen() {
      switch (title) {
        case 'School Fees Loan':
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const SchoolFeesLoanScreen()),
          );
          break;
        case 'Salary Loan':
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SalaryLoanScreen()),
          );
          break;
        case 'Emergency Loan':
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const EmergencyLoanScreen()),
          );
          break;
        case 'Personal Loan':
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PersonalLoanScreen()),
          );
          break;
        case 'Agricultural Loan':
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const AgriculturalLoanScreen()),
          );
          break;
        case 'Business Loan':
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const BusinessLoanScreen()),
          );
          break;
        default:
          break;
      }
    }

    return GestureDetector(
      onTap: navigateToLoanScreen,
      child: Card(
        color: const Color.fromARGB(255, 212, 210, 210),
        child: SizedBox(
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 200,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.zero,
                ),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 4),
              Container(
                color: Colors.black,
                padding: const EdgeInsets.all(8),
                child: Center(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.amberAccent,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
