import 'package:flutter/material.dart';

class PatientShowDetails extends StatelessWidget {
  late final String patientName;
  late final String patientId; // يمكنك إضافة المزيد من المعلومات عن المريض حسب الحاجة

  @override
  Widget build(BuildContext context) {
    // يمكنك استخدام هذه المعلومات لجلب تفاصيل المريض من قاعدة البيانات أو من أي مصدر آخر
    return Scaffold(
      appBar: AppBar(
        title: Text('تفاصيل المريض'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('اسم المريض: $patientName'),
            Text('رقم المريض: $patientId'),
            // يمكنك إضافة المزيد من التفاصيل هنا
          ],
        ),
      ),
    );
  }
}
