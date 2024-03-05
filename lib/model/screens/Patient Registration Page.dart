import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class PatientRegistrationPage extends StatelessWidget {

  // Function to initialize the database
  Future<Database> _initializeDatabase() async {
    // Get the directory for storing databases
    String path = await getDatabasesPath();
    // Join the path with the database name
    path = join(path, 'patients.db');

    // Open/create the database
    return openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        // Create the patient table
        await db.execute(
          'CREATE TABLE patients(id INTEGER PRIMARY KEY, name TEXT, age INTEGER, gender TEXT, contactNumber TEXT, anotherNumber TEXT, firstAppointmentDate TEXT, secondAppointmentDate TEXT)',
        );
      },
    );
  }

  // Function to insert patient data into the database
  Future<void> _insertPatient(Database db, Map<String, dynamic> patient) async {
    await db.insert(
      'patients',
      patient,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Registration'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Age'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Gender'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Contact Number'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Another Number'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Date of First Appointment'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Date of Second Appointment'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () async {
                // Initialize database
                Database db = await _initializeDatabase();
                // Insert patient data
                await _insertPatient(db, {
                  'name': 'John Doe', // Replace with actual data
                  'age': 30, // Replace with actual data
                  'gender': 'Male', // Replace with actual data
                  'contactNumber': '1234567890', // Replace with actual data
                  'anotherNumber': '0987654321', // Replace with actual data
                  'firstAppointmentDate': '2024-03-02', // Replace with actual data
                  'secondAppointmentDate': '2024-03-10', // Replace with actual data
                });
                print('Patient data inserted');
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                // Implement Update functionality
                // For now, just print a message
                print('Update button pressed');
              },
              icon: Icon(Icons.update),
            ),
            IconButton(
              onPressed: () {
                // Implement Delete functionality
                // For now, just print a message
                print('Delete button pressed');
              },
              icon: Icon(Icons.delete),
            ),
            IconButton(
              onPressed: () {
                // Implement Search functionality
                // For now, just print a message
                print('Search button pressed');
              },
              icon: Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {
                // Implement Show functionality
                // For now, just print a message
                print('Show button pressed');
              },
              icon: Icon(Icons.visibility), // or Icons.visibility_off
            ),
          ],
        ),
      ),
    );
  }
}
