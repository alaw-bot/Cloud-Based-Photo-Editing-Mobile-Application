import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:camera/camera.dart';

void main() {
  runApp(PixelizerApp());
}

class PixelizerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pixelizer - Edit your media'),
      ),
      body: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/home_logo.png',
                width: 150.0,
                height: 150.0,
              ),
              SizedBox(height: 20.0),
              Text(
                'Welcome to Pixelizer!',
                style: TextStyle(fontSize: 24.0, color: Colors.white),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ActionPage(),
                    ),
                  );
                },
                child: Text('Get Started'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ActionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose an Option'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Add code to navigate to the Video Recording Page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VideoRecordingPage(),
                  ),
                );
              },
              child: Text('Record Videos'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Add code to navigate to the Gallery Page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GalleryPage(),
                  ),
                );
              },
              child: Text('Select Photos'),
            ),
          ],
        ),
      ),
    );
  }
}

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

class GalleryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallery Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.photo,
              size: 100.0,
              color: Colors.green,
            ),
            SizedBox(height: 20.0),
            Text(
              'Select photos from your gallery',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Add code to access the gallery for selecting photos
                _getImageFromGallery(context);
              },
              child: Text('Select Photos'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _getImageFromGallery(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(
        source: ImageSource.gallery); // Open the gallery to select photos

    if (pickedFile != null) {
      // Handle the selected photos, for example, display or process them
      // You can navigate to a new page for photo editing here
      print('Photos picked: ${pickedFile.path}');
    }
  }
}
