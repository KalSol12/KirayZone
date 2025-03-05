import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final String title;
  final String price;
  final String imageUrl;
  final String ownerName;
  final double rating;
  final String description;

  DetailScreen({
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.ownerName,
    required this.rating,
    required this.description,
  });

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Details', style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: Colors.red,
            ),
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              widget.imageUrl,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.price,
                        style: TextStyle(fontSize: 20, color: Colors.blue),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow),
                      SizedBox(width: 4),
                      Text('${widget.rating}', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Deskripsi',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.description,
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildFeatureIcon(Icons.bed, 'Bedroom'),
                      _buildFeatureIcon(Icons.bathtub, 'Bathroom'),
                      _buildFeatureIcon(Icons.wifi, 'WiFi'),
                      _buildFeatureIcon(Icons.local_parking, 'Parking'),
                    ],
                  ),
                  SizedBox(height: 20),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://via.placeholder.com/150',
                      ), // Replace with real profile picture
                    ),
                    title: Text('Bapak kost'),
                    subtitle: Text(widget.ownerName),
                    trailing: IconButton(
                      icon: Icon(Icons.chat, color: Colors.black),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ChatScreen()),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RentFormScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Ajukan sewa',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureIcon(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.blue),
        Text(label, style: TextStyle(color: Colors.blue)),
      ],
    );
  }
}

// ChatScreen Placeholder
class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chat with Owner")),
      body: Center(child: Text("Chat Functionality Here")),
    );
  }
}

// RentFormScreen Placeholder
class RentFormScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Rent Form")),
      body: Center(child: Text("Rent Application Form Here")),
    );
  }
}
