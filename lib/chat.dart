import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final items = List.generate(10, (index) => 'Item: $index');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(children: <Widget>[
          ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 32.8,
              vertical: 8.0,
            ),
            leading: ClipOval(
              child: Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e5/Steve_Jobs_WWDC07.jpg/1024px-Steve_Jobs_WWDC07.jpg'),
            ),
            trailing: Text('3分前'),
            title: Text('大友頌平'),
            subtitle: Text('Flutterは楽しいなー'),
          )
        ]),
      ),
    );
  }
}
