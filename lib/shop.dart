import 'package:flutter/material.dart';

class ShopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: buildBasicListView(),
      ),
    );
  }

  Widget buildBasicListView() => ListView(
        children: [
          ListTile(
            leading: Icon(Icons.arrow_forward_ios),
            title: Text('list1'),
            subtitle: Text('sublist1'),
            trailing: Icon(Icons.star, color: Colors.orange),
          ),
          ListTile(
            leading: Icon(Icons.arrow_forward_ios),
            title: Text('list2'),
            subtitle: Text('sublist2'),
            trailing: Icon(Icons.mood, color: Colors.blue),
          ),
          ListTile(
            leading: Icon(Icons.arrow_forward_ios),
            title: Text('list3'),
            subtitle: Text('sublist3'),
            trailing: Icon(Icons.star, color: Colors.black),
          ),
          ListTile(
              leading: Icon(Icons.delete_forever, color: Colors.red),
              title: Text('Delete'),
              onTap: () {
                print('Deleted');
              }),
        ],
      );
}
