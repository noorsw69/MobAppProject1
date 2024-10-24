import 'package:flutter/material.dart';
import 'package:flutter_project1/HomeScreen.dart';
import 'package:flutter_project1/ProfileScreen.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int _selectedIndex = 0;

  late List<Widget> _pages = [
    WelcomeContent(),
    HomeScreen(onNavigate: _onItemTapped),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Education App'),
        backgroundColor: Color(0xFF512DA8),
        foregroundColor: Colors.white,
      ),
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Welcome',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

class WelcomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFFE6E6FA),
      body: Padding(
        padding: EdgeInsets.all(screenWidth > 600 ? 32.0 : 16.0), // Adjust padding for larger screens
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Banner Image or Illustration
            Expanded(
              child: Image.asset(
                'asset/images/educationImage.jpg',
                fit: BoxFit.cover,
                height: screenHeight * 0.3, // Set height as a percentage of screen height
              ),
            ),
            SizedBox(height: 20),

            // Welcome Text
            Text(
              'Welcome to the Learnify App!',
              style: TextStyle(
                fontSize: screenWidth > 600 ? 36 : 30, // Increase font size for larger screens
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              'Start your learning journey with us.',
              style: TextStyle(fontSize: screenWidth > 600 ? 24 : 18, color: Colors.black), // Adjust font size
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),

            // Call to Action Button
            ElevatedButton(
              onPressed: () {
                // Navigate to course screen or other action
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: screenWidth > 600 ? 20 : 15), // Adjust button height
                backgroundColor: Colors.white, // Background color
              ),
              child: Text(
                'Unlock Learning',
                style: TextStyle(
                  fontSize: screenWidth > 600 ? 24 : 20, // Adjust font size for the button
                  color: Colors.blueAccent, // Text color
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
