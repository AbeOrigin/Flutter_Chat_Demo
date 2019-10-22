import 'package:flutter/material.dart';

class CategorySelector extends StatefulWidget {
  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  int selectedIndex = 0;

  static ItemSelectable message =
      ItemSelectable(categoryName: 'Messages', icon: Icon(Icons.search));
  static ItemSelectable online =
      ItemSelectable(categoryName: 'Online', icon: Icon(Icons.search));
  static ItemSelectable groups =
      ItemSelectable(categoryName: 'Groups', icon: Icon(Icons.search));
  static ItemSelectable requests =
      ItemSelectable(categoryName: 'Requests', icon: Icon(Icons.search));

  final List<String> categories = ['Messages', 'Online', 'Groups', 'Requests'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      color: Theme.of(context).primaryColor,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
              child: Text(
                categories[index],
                style: TextStyle(
                    color:
                        index == selectedIndex ? Colors.white : Colors.white60,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2
                    ),
              ),
            ),
          );
        },
      ),
    );
  }
}




class ItemSelectable {
  final String categoryName;
  final Icon icon;

  ItemSelectable({this.categoryName, this.icon});
}
