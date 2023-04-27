import 'package:flutter/material.dart';

import 'additmes_page.dart';

class StationsPage extends StatelessWidget {
  final String trainNumber;

  StationsPage({required this.trainNumber});

  @override
  Widget build(BuildContext context) {
    List<String> stations = [      'Station A',      'Station B',      'Station C',      'Station D',      'Station E',      'Station F',    ];

    List<List<String>> restaurants = [      ['Restaurant 1A', 'Restaurant 1B', 'Restaurant 1C'],
      ['Restaurant 2A', 'Restaurant 2B', 'Restaurant 2C'],
      ['Restaurant 3A', 'Restaurant 3B', 'Restaurant 3C'],
      ['Restaurant 4A', 'Restaurant 4B', 'Restaurant 4C'],
      ['Restaurant 5A', 'Restaurant 5B', 'Restaurant 5C'],
      ['Restaurant 6A', 'Restaurant 6B', 'Restaurant 6C'],
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Stations for Train $trainNumber'),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: stations.length,
        itemBuilder: (BuildContext context, int index) {
          return ExpansionTile(
            title: Text(
              stations[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            subtitle: Text(
              'Arrival time: 10:00 AM',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14.0,
              ),
            ),
            children: [
              Column(
                children: restaurants[index].map((restaurant) {
                  return ListTile(
                    title: Text(restaurant),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddItemsPage(restaurantName: restaurant),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ],
          );
        },
      ),
    );
  }
}