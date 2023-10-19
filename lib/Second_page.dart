import 'package:flutter/material.dart';
import 'package:camera/camera.dart'; // Import the camera package

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  CameraController? _controller;
  List<CameraDescription>? cameras;

  @override
  void initState() {
    super.initState();
    initializeCamera();
  }

  Future<void> initializeCamera() async {
    cameras = await availableCameras();
    if (cameras != null && cameras!.isNotEmpty) {
      _controller = CameraController(cameras![0], ResolutionPreset.medium);
      await _controller!.initialize();
      if (!mounted) {
        return;
      }
      setState(() {});
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null || !_controller!.value.isInitialized) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Pixelizer - Camera'),
      ),
      body: CameraPreview(_controller!), // Display the camera preview
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Take a photo when the FloatingActionButton is pressed
          takePicture();
        },
        child: Icon(Icons.camera),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Future<void> takePicture() async {
    if (!_controller!.value.isInitialized) {
      return;
    }

    try {
      XFile? file = await _controller!.takePicture();
      // Process the captured image (save, display, etc.)
      print('Picture taken at: ${file?.path}');
    } catch (e) {
      print('Error taking picture: $e');
    }
  }
}
