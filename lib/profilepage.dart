// ignore_for_file: file_names

import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.person),
                Text(
                  'Name: Jean',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.email),
                Text(
                  'Email: student@example.com',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              width: 200, // Adjust the container width here
              color: const Color.fromARGB(255, 51, 143, 218),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  // ignore: deprecated_member_use
                  primary: const Color.fromARGB(255, 51, 143, 218),
                  minimumSize: const Size(150, 40),
                ),
                child: const Text('Edit Profile'),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: 200, // Adjust the container width here
              color: const Color.fromARGB(255, 51, 143, 218),
              child: ElevatedButton(
                onPressed: () {
                 
                },
                style: ElevatedButton.styleFrom(
                  // ignore: deprecated_member_use
                  primary: const Color.fromARGB(255, 51, 143, 218),
                  minimumSize: const Size(150, 40),
                ),
                child: const Text('Change Password'),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: 200, // Adjust the container width here
              color: const Color.fromARGB(255, 51, 143, 218),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  // ignore: deprecated_member_use
                  primary: const Color.fromARGB(255, 51, 143, 218),
                  minimumSize: const Size(150, 40),
                ),
                child: const Text('Logout'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
