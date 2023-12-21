import 'package:flutter/material.dart';
import 'package:fyp_project_group_a/Home/bottomNavigationProvider.dart';
import 'package:fyp_project_group_a/Home/home.dart';
import 'package:fyp_project_group_a/main.dart';
import 'package:fyp_project_group_a/presentation/screens/main_profile_screen.dart';
import 'package:provider/provider.dart';

class BottomNavBarScreen extends StatefulWidget {
  @override
  _BottomNavBarScreenState createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  final List<Widget> _pages = [
    HomeScreen(),
    const Page2(),
    const Page3(),
    const Page3(),
    const MainProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final bottomNavProvider = Provider.of<BottomNavProvider>(context);

    return Stack(
      children: [
        Scaffold(
          body: _pages[bottomNavProvider.currentIndex],
          bottomNavigationBar: SizedBox(
            height: MediaQuery.of(context).size.height * 0.13,
            child: Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.13,
                  child: BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    currentIndex: bottomNavProvider.currentIndex,
                    onTap: (index) {
                      bottomNavProvider.changeIndex(index);
                    },
                    showSelectedLabels: true,
                    showUnselectedLabels: true,
                    useLegacyColorScheme: true,
                    backgroundColor: Colors.white,
                    selectedItemColor: Color(0xFFFF9900),
                    unselectedItemColor: Colors.grey[400],
                    items: const [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.checklist),
                        label: 'Cashflow',
                      ),
                      BottomNavigationBarItem(
                        icon: SizedBox.shrink(), // Hidden item to accommodate the FAB
                        label: '',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.email),
                        label: 'Message',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.person),
                        label: 'Profile',
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 16.0, // Adjust the position as needed
                  left: MediaQuery.of(context).size.width * 0.4,
                  right: MediaQuery.of(context).size.width * 0.4,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.125,
                    child: FloatingActionButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CameraApp()), // Replace NotificationScreen() with your actual notification screen widget
                          );
                        },
                        backgroundColor: Colors.blue, // Set your desired color
                        shape: CircleBorder(),
                        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                          Image.asset(
                            'assets/images/pay.png',
                            color: Colors.white,
                            width: 30,
                            height: 30,
                          ),
                          const Text(
                            'Pay',
                            style: TextStyle(color: Colors.white),
                          )
                        ])),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Cashflow Page'),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Message Page'),
    );
  }
}

class Page4 extends StatelessWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Profile Page'),
    );
  }
}
