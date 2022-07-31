import 'package:dev_tools/pages/decode_base64.dart';
import 'package:dev_tools/pages/encode_base64.dart';
import 'package:dev_tools/pages/home.dart';
import 'package:flutter/material.dart';

final routes = {
  '/': (context) => const MyHomePage(
        title: 'Dev Tools',
      ),
  '/encode_base64': (context) => const EncodeBase64Page(),
  '/decode_base64': (context) => const DecodeBase64Page(),
};

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Dev tools',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () => Navigator.of(context).pushNamed('/'),
          ),
          ListTile(
            leading: Icon(Icons.code),
            title: Text('Encode Base 64'),
            onTap: () => Navigator.of(context).pushNamed('/encode_base64'),
          ),
          ListTile(
            leading: Icon(Icons.code),
            title: Text('Decode Base 64'),
            onTap: () => Navigator.of(context).pushNamed('/decode_base64'),
          ),
        ],
      ),
    );
  }
}
