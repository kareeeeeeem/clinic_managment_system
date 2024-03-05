import 'package:flutter/material.dart';

class MenuItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Items'), // Set the app bar title
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/patient_registration'); // Navigate to Patient Registration Page
              },
              child: buildMenuItem(context, 'Patient Registration'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/booking_appointment'); // Navigate to Booking Appointment Page
              },
              child: buildMenuItem(context, 'Booking Appointment'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/diagnosis'); // Navigate to Diagnosis Page
              },
              child: buildMenuItem(context, 'Diagnosis'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/prescription'); // Navigate to Prescription Page
              },
              child: buildMenuItem(context, 'Prescription'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/exit'); // Navigate to Prescription Page
              },
              child: buildMenuItem(context, 'Exit'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}