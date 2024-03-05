import 'package:flutter/material.dart';

class ExitPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EXIT'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('are you sure?'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Perform any cleanup or transition logic here
                Navigator.pushNamed(context, '/transition');
              },
              child: const Text('yes'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('no'),
            ),
          ],
        ),
      ),
    );
  }
}
