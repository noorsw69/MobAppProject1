import 'package:flutter/material.dart';
import 'package:flutter_project1/EnrolledCoursesScreen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04), 
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             
              CircleAvatar(
                radius: screenWidth * 0.15, 
                backgroundImage: const AssetImage('asset/profile_picture.png'),
                child: Icon(Icons.person, size: screenWidth * 0.15), 
              ),
              SizedBox(height: screenHeight * 0.02), 
              Text(
                'Noor Un Nisa',
                style: TextStyle(
                  fontSize: screenWidth * 0.06, 
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: screenHeight * 0.01), 
              Text(
                'noorunnisa43@example.com',
                style: TextStyle(fontSize: screenWidth * 0.045), 
              ),
              SizedBox(height: screenHeight * 0.02), 

           
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EnrolledCoursesScreen()),
                  );
                },
                child: Text('View Enrolled Courses'),
              ),
              SizedBox(height: screenHeight * 0.01), 
              ElevatedButton(
                onPressed: () {
                  print('Navigate to Edit Profile');
                },
                child: Text('Edit Profile'),
              ),
              SizedBox(height: screenHeight * 0.01), 

              ElevatedButton(
                onPressed: () {
                  print('Logged out');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple, 
                ),
                child: Text(
                  'Logout',
                  style: TextStyle(color: Colors.white), 
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
