import 'package:flutter/material.dart';

class FriendPage extends StatelessWidget {
  final items = List.generate(10, (index) => 'Item: $index');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 10,
        child: buildBasicListView(context),
      ),
    );
  }

  Widget buildBasicListView(context) => ListView.separated(
        padding: EdgeInsets.all(16),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => Divider(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(right: 16),
            child: Text(item),
          );
        },
      );
}
