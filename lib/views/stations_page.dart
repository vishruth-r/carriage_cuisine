import 'package:carriage_cuisine/api_services.dart';
import 'package:flutter/material.dart';
import 'additmes_page.dart';

class StationsPage extends StatelessWidget {
  final String trainNumber;

  StationsPage({required this.trainNumber});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: ApiService.getStations(trainNumber),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final stations = snapshot.data!;
          return Scaffold(
            appBar: AppBar(
              title: Text('Stations for Train $trainNumber'),
              backgroundColor: Colors.green,
            ),
            body: ListView.builder(
              itemCount: stations.length,
              itemBuilder: (BuildContext context, int index) {
                return FutureBuilder<List<String>>(
                  future: ApiService.getRestaurants(stations[index]),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final restaurants = snapshot.data!;
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
                            children: restaurants.map((restaurant) {
                              return ListTile(
                                title: Text(restaurant),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AddItemsPage(restaurantName: '',),
                                    ),
                                  );
                                },
                              );
                            }).toList(),
                          ),
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return CircularProgressIndicator();
                  },
                );
              },
            ),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return CircularProgressIndicator();
      },
    );
  }
}
