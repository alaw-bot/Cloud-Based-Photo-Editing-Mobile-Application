import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(PixelizerApp());
}

class PixelizerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(), // Set the initial route to HomePage
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pixelizer - Edit your photos'),
      ),
      body: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/home_logo.png', // Display the app logo
                width: 150.0,
                height: 150.0,
              ),
              SizedBox(height: 20.0),
              Text(
                'Welcome to Pixelizer!', // Display a welcome message
                style: TextStyle(fontSize: 24.0, color: Colors.white),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ActionPage()), // Navigate to ActionPage
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
  Future<void> _getImageFromGallery(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(
        source: ImageSource.gallery); // Open the gallery to select an image

    if (pickedFile != null) {
      // TODO: Handle the picked image (e.g., display it or process it)
      print('Image picked: ${pickedFile.path}'); // Print the picked image path
    }
  }

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
                _getImageFromGallery(
                    context); // Trigger image selection from the gallery
              },
              child: Text('Gallery'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          CameraScreen()), // Navigate to CameraScreen
                );
              },
              child: Text('Camera'),
            ),
          ],
        ),
      ),
    );
  }
}

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras(); // Get a list of available cameras

    // Check if any cameras are available
    if (cameras.isEmpty) {
      print('No camera available');
      return;
    }

    _controller = CameraController(
        cameras[0],
        ResolutionPreset
            .medium); // Use the first available camera with medium resolution
    _initializeControllerFuture =
        _controller.initialize(); // Initialize the camera controller
  }

  @override
  void dispose() {
    _controller.dispose(); // Release the camera resources
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera'),
      ),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller); // Display the camera preview
          } else {
            return Center(
                child:
                    CircularProgressIndicator()); // Show a loading indicator while initializing
          }
        },
      ),
    );
  }
}
