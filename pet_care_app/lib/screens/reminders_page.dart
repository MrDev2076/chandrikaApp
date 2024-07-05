import 'package:flutter/material.dart';

class RemindersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vaccination Reminders'),
        backgroundColor: Colors.yellowAccent,
      ),
      body: Container(
        color: Colors.black,
        child: ListView(
          children: <Widget>[
            SizedBox(height: 36.0),
            Icon(
              Icons.doorbell_rounded,
              size: 104,
              color: Colors.white,
            ),
            SizedBox(height: 16.0),
            HoverListTile(
              title: 'Rabies Vaccine',
              date: '12/12/2024',
            ),
            HoverListTile(
              title: 'Distemper Vaccine',
              date: '01/01/2025',
            ),
            HoverListTile(
              title: 'Parvovirus Vaccine',
              date: '02/02/2025',
            ),
            HoverListTile(
              title: 'Hepatitis Vaccine',
              date: '03/03/2025',
            ),
          ],
        ),
      ),
    );
  }
}

class HoverListTile extends StatefulWidget {
  final String title;
  final String date;

  HoverListTile({
    required this.title,
    required this.date,
  });

  @override
  _HoverListTileState createState() => _HoverListTileState();
}

class _HoverListTileState extends State<HoverListTile> {
  Color _tileColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _tileColor = Colors.white;
        });
      },
      onExit: (_) {
        setState(() {
          _tileColor = Colors.black;
        });
      },
      child: Container(
        color: _tileColor,
        child: ListTile(
          leading: Icon(
            Icons.alarm,
            color: _tileColor == Colors.black ? Colors.white : Colors.black,
          ),
          title: Text(
            widget.title,
            style: TextStyle(color: _tileColor == Colors.black ? Colors.white : Colors.black),
          ),
          subtitle: Text(
            widget.date,
            style: TextStyle(
              color: _tileColor == Colors.black ? Colors.yellow : Colors.orange,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: IconButton(
            icon: Icon(Icons.edit),
            color: _tileColor == Colors.black ? Colors.white : Colors.black,
            onPressed: () {
              // Define what happens when the edit icon is pressed.
            },
          ),
        ),
      ),
    );
  }
}
