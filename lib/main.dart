import 'package:clinic_management_app/Exit%20Page.dart';
import 'package:clinic_management_app/model/custombar/Patient%20Show%20Details%20Page.dart';
import 'package:clinic_management_app/model/custombar/Patients%20Search%20Page.dart';
import 'package:clinic_management_app/model/screens/Patient%20Registration%20Page.dart';
import 'package:clinic_management_app/model/custombar/Patients%20Delete%20Details%20Page.dart';
import 'package:clinic_management_app/model/custombar/Patients%20Update%20Details%20Page.dart';
import 'package:flutter/material.dart';
import 'package:clinic_management_app/Login%20Page.dart'; // Import your LoginPage here
import 'package:clinic_management_app/model/screens/Booking%20Appointment%20Page.dart';
import 'package:clinic_management_app/model/screens/Diagnosis%20Page.dart';
import 'package:clinic_management_app/model/screens/Presentation%20Page.dart';
import 'package:clinic_management_app/model/screens/MenuItem.dart'; // Import MenuItemPage

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'تطبيق إدارة العيادة',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainPage(),
        '/login': (context) => LoginPage(),
        '/patient_registration': (context) => PatientRegistrationPage(),
        '/booking_appointment': (context) => BookingAppointmentPage(),
        '/diagnosis': (context) => DiagnosisPage(),
        '/prescription': (context) => PrescriptionPage(),
        '/menuitem': (context) => MenuItemPage(), // Define the route named "menuitem"
        '/exit': (context) =>ExitPage(), 
      
        '/PatientsUpdate': (context) => PatientsUpdateDetails(),
        '/PatientShow': (context) => PatientShowDetails(),
        '/PatientsDelete': (context) => PatientsDeleteDetails(),
        '/PatientsSearch': (context) => PatientsSearch(),

      
      },
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dr Ahmed Eldemerdash clinic'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: LoginPage(),
            ),
          ],
        ),
      ),
    );
  }
}