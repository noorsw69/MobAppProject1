import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project1/CourseDetailScreen.dart';
import 'package:flutter_project1/details.dart';

class CourseScreen extends StatelessWidget {
  final String category;
  final List<String> courses;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final uid = FirebaseAuth.instance.currentUser?.uid;

  CourseScreen({required this.category, required this.courses});

  void addCourseToFirestore(String course) async {
    try {
      DocumentReference userDoc = _firestore.collection('users').doc(uid);
      DocumentSnapshot docSnapshot = await userDoc.get();

      if (docSnapshot.exists) {
        // If the user exists, update the enrolled courses list
        List<dynamic> currentCourses = docSnapshot.get('enrolledCourses') ?? [];
        if (!currentCourses.contains(course)) {
          currentCourses.add(course);
          await userDoc.update({
            'enrolledCourses': currentCourses,
          });
        }
      } else {
        // If the user doesn't exist, create a new user document with the enrolled course
        await userDoc.set({
          'enrolledCourses': [course],
        });
      }
    } catch (e) {
      print('Error adding course to Firestore: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get screen width and height
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('$category Courses'),
      ),
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          Color cardColor = Colors.primaries[index % Colors.primaries.length];
          return SizedBox(
            height: screenWidth > 600 ? 120 : 100, // Adjust height for larger screens
            child: Card(
              margin: EdgeInsets.all(screenWidth > 600 ? 16.0 : 8.0), // Adjust margin for larger screens
              color: cardColor,
              child: ListTile(
                title: Text(
                  courses[index],
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth > 600 ? 22 : 18, // Adjust font size for larger screens
                  ),
                ),
                onTap: () {
                  final courseTitle = courses[index];
                  addCourseToFirestore(courseTitle);

                  final courseDetailsMap = courseDetails[courseTitle];

                  if (courseDetailsMap != null) {
                    final courseDescription = courseDetailsMap['description'] ?? 'No description available';
                    final courseVideoUrl = courseDetailsMap['videoUrl'] ?? '';

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CourseDetailScreen(
                          courseTitle: courseTitle,
                          description: courseDescription,
                          videoUrl: courseVideoUrl,
                        ),
                      ),
                    );
                  } else {
                    print('Course details not available for $courseTitle');
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}