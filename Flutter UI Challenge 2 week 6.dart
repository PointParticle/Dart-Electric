import 'package:flutter/material.dart';

void main() {
  runApp(ElectricVehicleApp());
}

class ElectricVehicleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Electric Vehicle App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Electric Vehicle App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Welcome to the Electric Vehicle App!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print('Button Clicked!');
              },
              child: Text('Click Me!'),
            ),
            SizedBox(height: 20),
            Image.network(
              'https://example.com/your-electric-vehicle-image.jpg', // Replace with a valid URL
              width: 300,
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
