import 'package:flutter/material.dart';

class CustomButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Patient Registration'),
      // ),
      body: Container(
        alignment: Alignment.center,
        child: Text('Your custom button widget goes here'),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                // Implement Update functionality
              },
              icon: Icon(Icons.update),
            ),
            IconButton(
              onPressed: () {
                // Implement Delete functionality
              },
              icon: Icon(Icons.delete),
            ),
            IconButton(
              onPressed: () {
                // Implement Search functionality
              },
              icon: Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {
                // Implement Show functionality
              },
              icon: Icon(Icons.visibility), // or Icons.visibility_off
            ),
          ],
        ),
      ),
    );
  }
}
