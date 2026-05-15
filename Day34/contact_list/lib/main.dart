import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contact List',
      theme: ThemeData.dark(),
      home: const ContactPage(),
    );
  }
}

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  final List<Map<String, String>> contacts = const [
    {
      "name": "Arjun ms",
      "phone": "+91 9876543210",
    },
    {
      "name": "Deon",
      "phone": "+91 9123456780",
    },
    {
      "name": "Deepak",
      "phone": "+91 9988776655",
    },
    {
      "name": "Rahul Das",
      "phone": "+91 9871234567",
    },
    {
      "name": "Anjali Roy",
      "phone": "+91 9012345678",
    },
    {
      "name": "Nikhil Raj",
      "phone": "+91 9345678901",
    },
    {
      "name": "Sneha Pillai",
      "phone": "+91 9567890123",
    },
    {
      "name": "Vishnu Prasad",
      "phone": "+91 9876501234",
    },
  ];

  final List<Map<String, dynamic>> categories = const [
    {
      "title": "Family",
      "icon": Icons.family_restroom,
    },
    {
      "title": "Friends",
      "icon": Icons.people,
    },
    {
      "title": "Office",
      "icon": Icons.work,
    },
    {
      "title": "Favorites",
      "icon": Icons.star,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact List"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),

      body: Padding(
        padding: const EdgeInsets.all(12),

        child: Column(
          children: [

            // CATEGORY GRID

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: categories.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 2.5,
              ),

              itemBuilder: (context, index) {
                final category = categories[index];

                return Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.shade800,
                    borderRadius: BorderRadius.circular(15),
                  ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(category["icon"], color: Colors.white),
                      const SizedBox(width: 10),
                      Text(
                        category["title"],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),

            const SizedBox(height: 15),

            // CONTACT LIST

            Expanded(
              child: ListView.builder(
                itemCount: contacts.length,

                itemBuilder: (context, index) {
                  final contact = contacts[index];

                  return Card(
                    color: Colors.blueGrey.shade900,
                    margin: const EdgeInsets.only(bottom: 12),

                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.teal,
                        child: Text(
                          contact["name"]![0],
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),

                      title: Text(
                        contact["name"]!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      subtitle: Text(contact["phone"]!),

                      trailing: const Icon(
                        Icons.call,
                        color: Colors.green,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}