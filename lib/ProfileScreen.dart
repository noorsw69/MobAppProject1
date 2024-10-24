import 'package:flutter/material.dart';
import 'package:flutter_project1/EnrolledCoursesScreen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to get the screen dimensions
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04), // Responsive padding
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile Picture
              CircleAvatar(
                radius: screenWidth * 0.15, // Responsive radius
                backgroundImage: const AssetImage('asset/profile_picture.png'),
                child: Icon(Icons.person, size: screenWidth * 0.15), // Responsive icon size
              ),
              SizedBox(height: screenHeight * 0.02), // Responsive spacing
              Text(
                'Noor Un Nisa',
                style: TextStyle(
                  fontSize: screenWidth * 0.06, // Responsive font size
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: screenHeight * 0.01), // Responsive spacing
              Text(
                'noorunnisa43@example.com',
                style: TextStyle(fontSize: screenWidth * 0.045), // Responsive font size
              ),
              SizedBox(height: screenHeight * 0.02), // Responsive spacing

              // Buttons
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EnrolledCoursesScreen()),
                  );
                },
                child: Text('View Enrolled Courses'),
              ),
              SizedBox(height: screenHeight * 0.01), // Responsive spacing

              ElevatedButton(
                onPressed: () {
                  print('Navigate to Edit Profile');
                },
                child: Text('Edit Profile'),
              ),
              SizedBox(height: screenHeight * 0.01), // Responsive spacing

              ElevatedButton(
                onPressed: () {
                  print('Logged out');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple, // Use backgroundColor instead of primary
                ),
                child: Text(
                  'Logout',
                  style: TextStyle(color: Colors.white), // Set text color to white
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
