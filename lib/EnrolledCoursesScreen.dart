import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EnrolledCoursesScreen extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final uid = FirebaseAuth.instance.currentUser?.uid;

  @override
  Widget build(BuildContext context) {
    // Get screen width for responsiveness
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Enrolled Courses'),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: _firestore.collection('users').doc(uid).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error fetching courses.'));
          }

          if (!snapshot.hasData || !snapshot.data!.exists) {
            return Center(child: Text('No enrolled courses yet.'));
          }

          var userDoc = snapshot.data!;
          List<dynamic> coursesFromFirestore = userDoc.get('enrolledCourses') ?? [];
          List<String> enrolledCourses = coursesFromFirestore.cast<String>();

          return enrolledCourses.isNotEmpty
              ? ListView.builder(
                  itemCount: enrolledCourses.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(screenWidth > 600 ? 16.0 : 12.0), // Adjust padding for larger screens
                      child: Card(
                        elevation: 2,
                        child: ListTile(
                          title: Text(
                            enrolledCourses[index],
                            style: TextStyle(
                              fontSize: screenWidth > 600 ? 20 : 16, // Adjust font size for larger screens
                            ),
                          ),
                          onTap: () {
                            // You can add functionality here, e.g., navigating to course details
                          },
                        ),
                      ),
                    );
                  },
                )
              : Center(child: Text('No enrolled courses yet.'));
        },
      ),
    );
  }
}
