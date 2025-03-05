import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/profile.png'),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Jimmy Sullivan',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'sullivan6661@gmail.com',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.flash_on),
            title: Text('Subscription'),
            trailing: Text('Weekly', style: TextStyle(color: Colors.grey)),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Payment'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.local_offer),
            title: Text('Promotion'),
            trailing: Text('6 Available', style: TextStyle(color: Colors.red)),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text('Ride History'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('Help & Center'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.card_giftcard),
            title: Text('Referral Code'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {},
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[200],
                    foregroundColor: Colors.black,
                    minimumSize: Size(double.infinity, 50),
                  ),
                  onPressed: () {},
                  child: Text('Change Profile'),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    minimumSize: Size(double.infinity, 50),
                  ),
                  onPressed: () {},
                  child: Text('Log Out', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
