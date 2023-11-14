// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late String _userName;
  late String _email;
  late String _imagePath; // Added to store the image path

  @override
  void initState() {
    super.initState();
    // Initialize user data
    _userName = 'John Doe';
    _email = 'john.doe@example.com';
    _imagePath = 'assets/profile_image.jpg'; // Initial image path
  }

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imagePath = pickedFile.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // User details section
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: _getImage, // Call the _getImage function when the avatar is tapped
                    child: CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage(_imagePath),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    _userName,
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(_email),
                ],
              ),
            ),

            // Actions section
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Action 1: Edit Profile
                      // Add your logic here
                      print('Edit Profile');
                    },
                    child: const Text('Edit Profile'),
                  ),
                  const SizedBox(height: 8.0),
                  ElevatedButton(
                    onPressed: () {
                      // Action 2: Change Password
                      // Add your logic here
                      print('Change Password');
                    },
                    child: const Text('Change Password'),
                  ),
                  const SizedBox(height: 8.0),
                  ElevatedButton(
                    onPressed: () {
                      // Action 3: Logout
                      // Add your logic here
                      print('Logout');
                    },
                    child: const Text('Logout'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
