import 'package:flutter/material.dart';

class PropertyListScreen extends StatefulWidget {
  @override
  _PropertyListScreenState createState() => _PropertyListScreenState();
}

class _PropertyListScreenState extends State<PropertyListScreen> {
  List<Map<String, dynamic>> properties = [
    {
      'title': 'Luxury Apartment',
      'location': 'New York, USA',
      'price': '\$1,500/month',
      'image':
          'https://images.pexels.com/photos/323780/pexels-photo-323780.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    },
    {
      'title': 'Cozy Studio',
      'location': 'Los Angeles, USA',
      'price': '\$900/month',
      'image':
          'https://images.pexels.com/photos/323780/pexels-photo-323780.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    },
    {
      'title': 'Modern Villa',
      'location': 'Miami, USA',
      'price': '\$3,200/month',
      'image':
          'https://images.pexels.com/photos/323780/pexels-photo-323780.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    },
  ];

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Property List"),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {
              // TODO: Implement filter functionality
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search properties...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value.toLowerCase();
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: properties.length,
              itemBuilder: (context, index) {
                final property = properties[index];
                if (searchQuery.isNotEmpty &&
                    !property['title'].toLowerCase().contains(searchQuery) &&
                    !property['location'].toLowerCase().contains(searchQuery)) {
                  return SizedBox.shrink();
                }
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        property['image'],
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      property['title'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(property['location']),
                    trailing: Text(
                      property['price'],
                      style: TextStyle(color: Colors.green),
                    ),
                    onTap: () {
                      // TODO: Navigate to property details page
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
