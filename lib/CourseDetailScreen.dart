import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CourseDetailScreen extends StatefulWidget {
  final String courseTitle;
  final String description;
  final String videoUrl;

  const CourseDetailScreen({
    required this.courseTitle,
    required this.description,
    required this.videoUrl,
  });

  @override
  _CourseDetailScreenState createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  late YoutubePlayerController _youtubeController;

  @override
  void initState() {
    super.initState();
    String? videoId = YoutubePlayer.convertUrlToId(widget.videoUrl);

    if (videoId != null) {
      _youtubeController = YoutubePlayerController(
        initialVideoId: videoId,
        flags: YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
        ),
      );
    } else {
      print('Invalid YouTube URL');
    }
  }

  @override
  void dispose() {
    _youtubeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get screen width for responsiveness
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.courseTitle),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth > 600 ? 24.0 : 16.0), // Adjust padding based on screen width
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (YoutubePlayer.convertUrlToId(widget.videoUrl) != null)
              Container(
                margin: EdgeInsets.only(bottom: 16.0),
                child: AspectRatio(
                  aspectRatio: 16 / 9, // Maintain aspect ratio for the video
                  child: YoutubePlayer(
                    controller: _youtubeController,
                    showVideoProgressIndicator: true,
                  ),
                ),
              )
            else
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text('Video not available', style: TextStyle(fontSize: screenWidth > 600 ? 20 : 16)),
              ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                widget.description,
                style: TextStyle(
                  fontSize: screenWidth > 600 ? 18 : 16, // Adjust font size based on screen width
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
