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
                // Add code to navigate to the Photo Camera Page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PhotoCameraPage(),
                  ),
                );
              },
              child: Text('Take Photos'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Add code to navigate to the Video Camera Page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VideoCameraPage(),
                  ),
                );
              },
              child: Text('Record Videos'),
            ),
          ],
        ),
      ),
    );
  }
}

class PhotoCameraPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Add camera access code for taking photos here
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo Camera'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.camera_alt,
              size: 100.0,
              color: Colors.blue,
            ),
            SizedBox(height: 20.0),
            Text(
              'Tap the button to start editing photos',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Add code to access the camera for taking photos
              },
              child: Text('Take Photos'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Add code to access the camera for taking photos
              },
              child: Text('Access Gallery'),
            ),
          ],
        ),
      ),
    );
  }
}

class VideoCameraPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Add camera access code for recording videos here
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Camera'),
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
              'Tap the button to start recording videos',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Add code to access the camera for recording videos
              },
              child: Text('Record Videos'),
            ),
          ],
        ),
      ),
    );
  }
}
