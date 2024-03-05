import 'package:clinic_management_app/database/DLogin%20Page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService authService = AuthService(); // تفترض وجود هذه الخدمة للتحقق من اسم المستخدم وكلمة المرور

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('تسجيل الدخول'),
      //   centerTitle: true,
      // ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  hintText: 'user name ',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: 'password ',
                  border: OutlineInputBorder(),
                ),
                obscureText: true, // لجعل النص مخفيًا كلمة مرور
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  String username = usernameController.text;
                  String password = passwordController.text;
                  bool loggedIn = await authService.signIn(username, password);
                  if (loggedIn) {
                   Navigator.pushNamed(context, '/menuitem');
                  } else {
                    // عرض رسالة خطأ
                  }
                },
                child: const Text('login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
