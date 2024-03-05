import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DiagnosisPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController provisionalDiagnosisController =
      TextEditingController();
  final TextEditingController finalDiagnosisController =
      TextEditingController();
  final TextEditingController otherDiseasesController = TextEditingController();

  void submitData() async {
    final url = 'YOUR_PHP_SCRIPT_URL'; // تعديل: استبدلها بعنوان URL الخاص بخادمك

    try {
      final response = await http.post(
        Uri.parse(url),
        body: {
          'name': nameController.text,
          'provisional_diagnosis': provisionalDiagnosisController.text,
          'final_diagnosis': finalDiagnosisController.text,
          'other_diseases': otherDiseasesController.text,
        },
      );
      
      // يمكنك إدراج معالجة للرد هنا إذا كنت بحاجة إلى ذلك
      print('Response: ${response.body}');
    } catch (error) {
      print('Error: $error');
    }
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
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: provisionalDiagnosisController,
              decoration: InputDecoration(labelText: 'Provisional Diagnosis'),
            ),
            TextField(
              controller: finalDiagnosisController,
              decoration: InputDecoration(labelText: 'Final Diagnosis'),
            ),
            TextField(
              controller: otherDiseasesController,
              decoration: InputDecoration(labelText: 'Other Diseases'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: submitData,
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
