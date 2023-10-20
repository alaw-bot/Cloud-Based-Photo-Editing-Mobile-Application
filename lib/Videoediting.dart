import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:camera/camera.dart';

class VideoRecordingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Editing'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.videocam,
              size: 100.0,
              color: Colors.blue,
            ),
            SizedBox(height: 20.0),
            Text(
              'Tap the button to start recording video or access gallery',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Add code to start video recording
              },
              child: Text('Start Recording'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Add code to access the gallery
                _getImageFromGallery(context);
              },
              child: Text('Access Gallery'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _getImageFromGallery(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.getVideo(
        source: ImageSource.gallery); // Open the gallery to select a video

    if (pickedFile != null) {
      // Handle the selected video, for example, play or process it
      // You can navigate to a new page for video editing here
      print('Video picked: ${pickedFile.path}');
    }
  }
}
