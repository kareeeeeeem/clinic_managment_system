import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BookingAppointmentPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController dayController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  Future<void> submitData() async {
    // تحضير البيانات للإرسال إلى PHP
    Map<String, String> data = {
      'name': nameController.text,
      'number': numberController.text,
      'day': dayController.text,
      'date': dateController.text,
      'time': timeController.text,
    };

    // إرسال البيانات إلى PHP
    var response = await http.post(
      Uri.parse('YOUR_PHP_SCRIPT_URL_HERE'), // تعديل
      body: data,
    );

    // قراءة الرد
    var responseData = json.decode(response.body);
    print(responseData); // اطبع الرد (يمكن تعديله وفقًا لاحتياجاتك)
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
              controller: numberController,
              decoration: InputDecoration(labelText: 'Number'),
            ),
            TextField(
              controller: dayController,
              decoration: InputDecoration(labelText: 'Day'),
            ),
            TextField(
              controller: dateController,
              decoration: InputDecoration(labelText: 'Date'),
            ),
            TextField(
              controller: timeController,
              decoration: InputDecoration(labelText: 'Time'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: submitData, // استدعاء الدالة submitData
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
                // تنفيذ الوظيفة الخاصة بالتحديث
              },
              icon: Icon(Icons.update),
            ),
            IconButton(
              onPressed: () {
                // تنفيذ الوظيفة الخاصة بالحذف
              },
              icon: Icon(Icons.delete),
            ),
            IconButton(
              onPressed: () {
                // تنفيذ الوظيفة الخاصة بالبحث
              },
              icon: Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {
                // تنفيذ الوظيفة الخاصة بالعرض
              },
              icon: Icon(Icons.visibility),
            ),
          ],
        ),
      ),
    );
  }
}
