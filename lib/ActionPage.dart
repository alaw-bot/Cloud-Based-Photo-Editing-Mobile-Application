import 'package:flutter/material.dart';
import 'videoediting.dart'; // Import VideoRecordingPage

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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GalleryPage(),
                  ),
                );
              },
              child: Text('Select Photos'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        VideoRecordingPage(), // Navigate to VideoRecordingPage
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
