import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class PrescriptionPage extends StatelessWidget {

  // Function to initialize the database
  Future<Database> _initializeDatabase() async {
    // Get the directory for storing databases
    String path = await getDatabasesPath();
    // Join the path with the database name
    path = join(path, 'prescriptions.db');

    // Open/create the database
    return openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        // Create the prescription table
        await db.execute(
          'CREATE TABLE prescriptions(id INTEGER PRIMARY KEY, name TEXT, description TEXT)',
        );
      },
    );
  }

  // Function to insert prescription data into the database
  Future<void> _insertPrescription(Database db, Map<String, dynamic> prescription) async {
    await db.insert(
      'prescriptions',
      prescription,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prescription'),
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
              decoration: InputDecoration(labelText: 'Description of Treatment'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () async {
                // Initialize database
                Database db = await _initializeDatabase();
                // Insert prescription data
                await _insertPrescription(db, {
                  'name': 'John Doe', // Replace with actual data
                  'description': 'Prescription description', // Replace with actual data
                });
                print('Prescription data inserted');
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
