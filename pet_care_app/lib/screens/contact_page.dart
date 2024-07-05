import 'package:flutter/material.dart';
import 'package:pet_care_app/screens/home_page.dart';
class ContactPage extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contact Us',
          style: TextStyle(
            color: Colors.white, // Text color
          ),
        ),
        backgroundColor: Colors.black, // AppBar background color
        iconTheme: IconThemeData(color: Colors.white), // Back arrow color
      ),
      body: Container(
        color: Colors.black,
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(
              Icons.contact_mail,
              size: 104,
              color: Colors.white,
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _nameController,
              style: TextStyle(color: Colors.white), // Text color
              decoration: InputDecoration(
                labelText: 'Name',
                labelStyle: TextStyle(color: Colors.white), // Label color
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[800]!), // Border color
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue), // Focused border color
                ),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _emailController,
              style: TextStyle(color: Colors.white), // Text color
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.white), // Label color
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[800]!), // Border color
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue), // Focused border color
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Submit action
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );

              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Button background color
              ),
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
