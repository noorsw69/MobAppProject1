import 'package:flutter/material.dart';
import 'package:flutter_project1/CourseScreen.dart';

class HomeScreen extends StatelessWidget {
  final Function(int) onNavigate;

  HomeScreen({required this.onNavigate});

  final List<Map<String, String>> categories = [
    {
      'name': 'Programming',
      'description': 'Learn to code with various programming languages.',
      'image': 'asset/images/laptop.jpg',
    },
    {
      'name': 'Accounting',
      'description': 'Master the principles of accounting and finance.',
      'image': 'asset/images/accounting.jpg',
    },
    {
      'name': 'Design',
      'description': 'Unleash your creativity with design skills.',
      'image': 'asset/images/design.jpg',
    },
    {
      'name': 'Marketing',
      'description': 'Understand marketing strategies and tactics.',
      'image': 'asset/images/marketing.jpg',
    },
  ];

  final Map<String, List<String>> courses = {
    'Programming': ['Flutter', 'Dart', 'Java', 'Python', 'JavaScript'],
    'Accounting': ['Financial Accounting', 'Taxation', 'Auditing', 'Cost Accounting', 'Management Accounting'],
    'Design': ['Graphic Design', 'UI/UX Design', 'Web Design', '3D Design', 'Animation'],
    'Marketing': ['Digital Marketing', 'SEO', 'Content Marketing', 'Social Media Marketing', 'Email Marketing'],
  };

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Categories of Courses'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to the MainScreen (Welcome Screen)
          },
        ),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: (screenWidth > 600) ? 3 : 2, // Adjust grid items based on screen width
          childAspectRatio: (screenWidth > 600) ? 1.0 : 0.7, // Adjust aspect ratio for larger screens
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(6.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CourseScreen(
                      category: categories[index]['name']!,
                      courses: courses[categories[index]['name']!]!,
                    ),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Image.asset(
                      categories[index]['image']!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.01, // Dynamic vertical padding
                      horizontal: screenWidth * 0.02, // Dynamic horizontal padding
                    ),
                    child: Text(
                      categories[index]['name']!,
                      style: TextStyle(
                        fontSize: (screenWidth > 600) ? 24 : 20, // Font size adjustment
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.02, // Dynamic horizontal padding
                    ),
                    child: Text(
                      categories[index]['description']!,
                      style: TextStyle(
                        fontSize: (screenWidth > 600) ? 16 : 12, // Font size adjustment
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
