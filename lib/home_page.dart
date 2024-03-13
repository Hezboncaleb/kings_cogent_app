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
  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: const Text(
          'KINGS COGENT',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            fontFamily: 'MadimiOne-Regular',
            color: Colors.black,
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
      drawer: const SideBar(),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          CarouselSlider(
                            carouselController: _carouselController,
                            items: [
                              Container(
                                width: 700,
                                child: Card(
                                  elevation: 4,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Image.asset(
                                    'assets/images/2.jpg',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Container(
                                width: 700,
                                child: Card(
                                  elevation: 4,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Image.asset(
                                    'assets/images/3.jpg',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Container(
                                width: 700,
                                child: Card(
                                  elevation: 4,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Image.asset(
                                    'assets/images/4.jpg',
                                    fit: BoxFit.fill,
                                  ),
                                ),
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
                              padEnds: true,
                            ),
                          ),
                          GridView.count(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            crossAxisCount: 2,
                            children: const [
                              LoanTile(
                                title: 'School Fees Loan',
                                imagePath: 'assets/images/school fees.jpg',
                              ),
                              LoanTile(
                                title: 'Salary Loan',
                                imagePath: 'assets/images/salary.jpg',
                              ),
                              LoanTile(
                                title: 'Emergency Loan',
                                imagePath: 'assets/images/emergency.jpg',
                              ),
                              LoanTile(
                                title: 'Personal Loan',
                                imagePath: 'assets/images/personal.jpg',
                              ),
                              LoanTile(
                                title: 'Agricultural Loan',
                                imagePath: 'assets/images/Agricultrue.jpg',
                              ),
                              LoanTile(
                                title: 'Business Loan',
                                imagePath: 'assets/images/business.jpg',
                              ),
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
          Positioned(
            top: 50,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildPreviousButton(_carouselController),
                _buildNextButton(_carouselController),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPreviousButton(CarouselController buttonController) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        buttonController.previousPage();
      },
    );
  }

  Widget _buildNextButton(CarouselController buttonController) {
    return IconButton(
      icon: Icon(Icons.arrow_forward_ios),
      onPressed: () {
        buttonController.nextPage();
      },
    );
  }
}

class LoanTile extends StatefulWidget {
  final String title;
  final String imagePath;

  const LoanTile({
    Key? key,
    required this.title,
    required this.imagePath,
  }) : super(key: key);

  @override
  _LoanTileState createState() => _LoanTileState();
}

class _LoanTileState extends State<LoanTile> {
  double opacityLevel = 1.0;

  void navigateToLoanScreen() {
    setState(() {
      opacityLevel = 0.5; // Set opacity to 0.5 when tapped
    });

    Future.delayed(const Duration(milliseconds: 80), () {
      setState(() {
        opacityLevel = 1.0; // Reset opacity to 1.0 after a delay
      });

      // Navigate to the appropriate loan screen based on the title
      switch (widget.title) {
        case 'School Fees Loan':
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SchoolFeesLoanScreen(),
            ),
          );
          break;
        case 'Salary Loan':
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SalaryLoanScreen(),
            ),
          );
          break;
        case 'Emergency Loan':
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const EmergencyLoanScreen(),
            ),
          );
          break;
        case 'Personal Loan':
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PersonalLoanScreen(),
            ),
          );
          break;
        case 'Agricultural Loan':
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AgriculturalLoanScreen(),
            ),
          );
          break;
        case 'Business Loan':
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const BusinessLoanScreen(),
            ),
          );
          break;
        default:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: navigateToLoanScreen,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 80),
        opacity: opacityLevel,
        child: Card(
          color: Colors.white,
          child: SizedBox(
            height: 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Fade-in effect for the image
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  opacity: opacityLevel,
                  child: Container(
                    width: double.infinity,
                    height: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), // Rounded edges
                    ),
                    child: Image.asset(
                      widget.imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                // Fade-in effect for the text
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  opacity: opacityLevel,
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft:
                            Radius.circular(10), // Rounded bottom-left corner
                        bottomRight:
                            Radius.circular(10), // Rounded bottom-right corner
                      ),
                      color: Colors.black,
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Center(
                      child: Text(
                        widget.title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.amberAccent,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
