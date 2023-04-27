import 'package:carriage_cuisine/views/stations_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final TextEditingController _trainNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text('CarriageCuisine'),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/homepage_bg.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 100.0),
                  Container(
                    height: 300.0,
                    width: 300.0,
                    child: Image.asset('assets/homepage_image.png'),
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            controller: _trainNumberController,
                            decoration: InputDecoration(
                              hintText: 'Train Number',
                            ),
                          ),
                        ),
                        SizedBox(width: 16.0),
                        ElevatedButton(
                          child: Text('Search'),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => StationsPage(trainNumber: _trainNumberController.text),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'PNR Number',
                            ),
                          ),
                        ),
                        SizedBox(width: 16.0),
                        ElevatedButton(
                          child: Text('Search'),
                          onPressed: () {
                            // Handle search button press
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
              children: <Widget>[
          UserAccountsDrawerHeader(
          accountName: Text("John Doe"),
          accountEmail: Text("johndoe@example.com"),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.white,
            child: Text(
              "JD",
              style: TextStyle(fontSize: 40.0),
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text("Home"),
          onTap: () {
            // Handle home button press
          },
        ),
        ListTile(
          leading: Icon(Icons.search),
          title: Text("Search"),
          onTap: () {
            // Handle search button press
          },
        ),
        ListTile(
        leading: Icon(Icons.fastfood),
    title: Text("Food"),
          onTap: () {
// Handle food button press
          },
        ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text("Settings"),
                  onTap: () {
// Handle settings button press
                  },
                ),
                ListTile(
                  leading: Icon(Icons.help),
                  title: Text("Help"),
                  onTap: () {
// Handle help button press
                  },
                ),
              ],
          ),
        ),
    bottomNavigationBar: Container(
    padding: EdgeInsets.only(bottom: 20),
    decoration: BoxDecoration(
    color: Colors.green,
    ),
    child: BottomNavigationBar(
    items: [
    BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: 'Home',
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.search),
    label: 'Search',
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.fastfood),
    label: 'Food',
    ),
    ],
    selectedItemColor: Colors.green,
    ),),    );

  }
}






