import 'package:flutter/material.dart';
import 'dart:convert';

class TrackOrder {
  final String restaurantName;
  final String title;
  final String subtitle;
  final String status;
  final String date;
  final double amount;

  TrackOrder(this.restaurantName, this.title, this.subtitle, this.status,
      this.date, this.amount);
}
class TrackOrderWidget extends StatefulWidget {
  @override
  _TrackOrderWidgetState createState() => _TrackOrderWidgetState();
}

class _TrackOrderWidgetState extends State<TrackOrderWidget> {
  final List<TrackOrder> items = [
    TrackOrder(
        "Restaurant 1",
        "Item 1",
        "Description of item 1",
        "Being Prepared",
        "2023-04-27 12:30 PM",
        12.99),
    TrackOrder(
        "Restaurant 2",
        "Item 2",
        "Description of item 2",
        "Delivered",
        "2023-04-26 7:45 PM",
        9.99),
    TrackOrder(
        "Restaurant 3",
        "Item 3",
        "Description of item 3",
        "Out For Delivery",
        "2023-04-25 1:15 PM",
        15.99),
    TrackOrder(
        "Restaurant 4",
        "Item 4",
        "Description of item 4",
        "Order Confirmed",
        "2023-04-24 9:00 AM",
        7.99),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/homenew-1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 64, left: 32, bottom: 16),
              child: Text(
                "Tracking",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    margin:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          child: Text(
                            item.restaurantName,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        ListTile(
                          title: Text(item.title),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item.subtitle),
                              SizedBox(height: 4),
                              Text(
                                "Amount: \$${item.amount}",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 4),
                              Text(item.date),
                            ],
                          ),
                          trailing: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 4, horizontal: 8),
                            decoration: BoxDecoration(
                              color: _getColorForStatus(item.status),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text(
                              item.status,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                      ],
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

  Color? _getColorForStatus(String status) {
    switch (status) {
      case "Being Prepared":
        return Colors.blue;
      case "Delivered":
        return Colors.orangeAccent;
      case "Out For Delivery":
        return Colors.red[700];
      case "Order Confirmed":
        return Colors.green;
      default:
        return Colors.grey;
    }
  }
}