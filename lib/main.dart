import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Images and Assets',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Raleway', // Default font family
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  // URLs for remote images
  final List<String> remoteImageUrls = [
    'https://via.placeholder.com/800x600.png?text=Top+Image+1',
    'https://via.placeholder.com/800x600.png?text=Top+Image+2',
    'https://via.placeholder.com/800x600.png?text=Top+Image+3',
  ];

  // Local images list
  final List<String> localImages = [
    'assets/Images/Image-1.jpg',
    'assets/Images/Image-2.jpg',
    'assets/Images/Image-3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Images and Assets'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Top Swipeable Images (Remote)
            SizedBox(
              height: 200,
              child: PageView.builder(
                itemCount: remoteImageUrls.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Image.network(
                      remoteImageUrls[index],
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 16), // Spacing

            // ListTile with different font variants
            ListTile(
              leading: Icon(Icons.book),
              title: Text(
                'Raleway 100',
                style: TextStyle(fontWeight: FontWeight.w100),
              ),
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text(
                'Raleway 400',
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
            ),  
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(
                'Raleway 700',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                child: Text('R1'),
              ),
              title: Text(
                'Roboto Regular',
                style: TextStyle(fontFamily: 'Roboto'),
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                child: Text('B'),
              ),
              title: Text(
                'Roboto Bold',
                style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold),
              ),
            ),

            SizedBox(height: 16), // Spacing

            // Bottom Swipeable Images (Local)
            SizedBox(
              height: 200,
              child: PageView.builder(
                itemCount: localImages.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Image.asset(
                      localImages[index],
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
