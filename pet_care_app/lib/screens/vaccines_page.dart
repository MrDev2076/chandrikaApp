import 'package:flutter/material.dart';

class VaccinesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vaccines'),
        backgroundColor: Colors.yellowAccent,
      ),
      body: Container(
        color: Colors.black,
        child: ListView(
          children: <Widget>[
            SizedBox(height: 36.0),
            Icon(
              Icons.medical_services,
              size: 104,
              color: Colors.white,
            ),
            SizedBox(height: 16.0),
            HoverListTile(
              title: 'Rabies Vaccine',
              icon: Icons.local_hospital,
            ),
            HoverListTile(
              title: 'Distemper Vaccine',
              icon: Icons.local_hospital,
            ),
            HoverListTile(
              title: 'Parvovirus Vaccine',
              icon: Icons.local_hospital,
            ),
            HoverListTile(
              title: 'Hepatitis Vaccine',
              icon: Icons.local_hospital,
            ),
          ],
        ),
      ),
    );
  }
}

class HoverListTile extends StatefulWidget {
  final String title;
  final IconData icon;

  HoverListTile({
    required this.title,
    required this.icon,
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
      child: Column(
        children: [

          Container(
            color: _tileColor,
            child: ListTile(
              leading: Icon(
                widget.icon,
                color: _tileColor == Colors.black ? Colors.white : Colors.black,
              ),
              title: Text(
                widget.title,
                style: TextStyle(color: _tileColor == Colors.black ? Colors.white : Colors.black),
              ),
              onTap: () {
                // Add navigation logic here if needed
              },
            ),
          ),
        ],
      ),
    );
  }
}
