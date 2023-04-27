import 'package:flutter/material.dart';

class AddItemsPage extends StatefulWidget {
  final String restaurantName;

  AddItemsPage({required this.restaurantName});

  @override
  _AddItemsPageState createState() => _AddItemsPageState();
}

class _AddItemsPageState extends State<AddItemsPage> {
  List<String> items = [    'Item 1',    'Item 2',    'Item 3',    'Item 4',    'Item 5',  ];

  Map<String, int> cartItems = {};

  void addToCart(String item) {
    setState(() {
      if (cartItems.containsKey(item)) {
        cartItems[item] = cartItems[item]! + 1;
      } else {
        cartItems[item] = 1;
      }
    });
  }

  void removeFromCart(String item) {
    setState(() {
      if (cartItems.containsKey(item)) {
        if (cartItems[item] == 1) {
          cartItems.remove(item);
        } else {
          cartItems[item] = cartItems[item]! - 1;
        }
      }
    });
  }

  int getItemCount(String item) {
    if (cartItems.containsKey(item)) {
      return cartItems[item]!;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.restaurantName),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(items[index]),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    removeFromCart(items[index]);
                  },
                  icon: Icon(Icons.remove),
                ),
                Text(getItemCount(items[index]).toString()),
                IconButton(
                  onPressed: () {
                    addToCart(items[index]);
                  },
                  icon: Icon(Icons.add),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Navigate to the cart page
        },
        label: Text('View Cart'),
        icon: Icon(Icons.shopping_cart),
      ),
    );
  }
}
