import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ConsultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consult a Doctor'),
        backgroundColor: Colors.yellowAccent,
      ),
      body: Container(
        color: Colors.black,
        child: ListView(
          children: <Widget>[
            SizedBox(height: 36.0),
            Icon(
              Icons.local_hospital_rounded,
              size: 104,
              color: Colors.white,
            ),
            SizedBox(height: 16.0),
            HoverListTile(
              imageUrl: 'https://png.pngtree.com/png-vector/20240623/ourmid/pngtree-young-female-doctor-in-uniform-wearing-mask-with-stethoscope-png-image_12813451.png', // Replace with actual image URLs
              title: 'Dr. Smith',
              subtitle: 'Veterinarian',
              phoneNumber: 'tel:+1234567890', // Replace with actual phone number
            ),
            HoverListTile(
              imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSv8mKV8uOQFsC246lMiNejPry5LEBfCceLeXML2ISdFvhnTMNoN-CZR8lpgtv45Wo5S_s&usqp=CAU', // Replace with actual image URLs
              title: 'Doctor Stephen Strange',
              subtitle: 'neurosurgeon',
              phoneNumber: 'tel:+91-7901239016', // Replace with actual phone number
            ),
            HoverListTile(
              imageUrl: 'https://pbs.twimg.com/media/EPpqINbUwAADjMw.jpg', // Replace with actual image URLs
              title: 'Dr. Otto Octavius',
              subtitle: 'nuclear physicist',
              phoneNumber: 'tel:+91-8767237467', // Replace with actual phone number
            ),
          ],
        ),
      ),
    );
  }
}

class HoverListTile extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String phoneNumber;

  HoverListTile({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.phoneNumber,
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
          leading: CircleAvatar(
            radius: 30, // Increase the radius to make the image larger
            backgroundImage: NetworkImage(widget.imageUrl),
          ),
          title: Text(
            widget.title,
            style: TextStyle(color: _tileColor == Colors.black ? Colors.white : Colors.black),
          ),
          subtitle: Text(
            widget.subtitle,
            style: TextStyle(color: _tileColor == Colors.black ? Colors.white70 : Colors.black54),
          ),
          trailing: IconButton(
            icon: Icon(Icons.call),
            color: _tileColor == Colors.black ? Colors.white : Colors.black,
            onPressed: () async {
              final Uri phoneUri = Uri.parse(widget.phoneNumber);
              if (await canLaunch(widget.phoneNumber)) {
                await launch(widget.phoneNumber);
              } else {
                throw 'Could not launch ${widget.phoneNumber}';
              }
            },
          ),
        ),
      ),
    );
  }
}
