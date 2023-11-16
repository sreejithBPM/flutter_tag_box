import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<List<String>> selectedItems = [];

  List<List<String>> itemList = [
    ['Item 1', 'Description 1'],
    ['Item 2', 'Description 2'],
    ['Item 3', 'Description 3'],
    // Add more items as needed
  ];

  void _showItemSelection() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ListView.builder(
          itemCount: itemList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(itemList[index][0]), // Display item name
              subtitle: Text(itemList[index][1]), // Display item description
              onTap: () {
                _selectItem(itemList[index]);
              },
            );
          },
        );
      },
    );
  }

  void _selectItem(List<String> item) {
    setState(() {
      selectedItems.add(item);
    });
    Navigator.pop(context); // Close the bottom sheet after selecting an item
  }

  void _removeItem(List<String> item) {
    setState(() {
      selectedItems.remove(item);
    });
  }

  void _clearAll() {
    setState(() {
      selectedItems.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Popup Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
           
            
            Container(
              height: 80,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(1.0),
              ),
              padding: EdgeInsets.all(10.0),
              child: Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: selectedItems.map((item) {
                  return Chip(
                    label: Text(item[0]), // Display item name in chip
                    deleteIcon: Icon(Icons.close),
                    onDeleted: () {
                      _removeItem(item);
                    },
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 16.0),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: _showItemSelection,
                  child: Text('Add New'),
                ),
                ElevatedButton(
                  onPressed: _clearAll,
                  child: Text('Clear All'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red, // Use a different color for Clear All
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}