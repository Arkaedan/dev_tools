import 'package:dev_tools/pages/decode_base64.dart';
import 'package:dev_tools/pages/encode_base64.dart';
import 'package:dev_tools/pages/generate_guid.dart';
import 'package:dev_tools/pages/home.dart';
import 'package:flutter/material.dart';

final routes = {
  '/': (context) => const HomePage(),
  '/encode_base64': (context) => const EncodeBase64Page(),
  '/decode_base64': (context) => const DecodeBase64Page(),
  '/generate_guid': (context) => const GenerateGuidPage(),
};

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  void navigateTo(BuildContext context, String route) {
    Navigator.popAndPushNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.orange,
            ),
            child: Text(
              'Dev Tools',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () => navigateTo(context, '/'),
          ),
          ListTile(
            leading: const Icon(Icons.code),
            title: const Text('Encode Base 64'),
            onTap: () => navigateTo(context, '/encode_base64'),
          ),
          ListTile(
            leading: const Icon(Icons.code_off),
            title: const Text('Decode Base 64'),
            onTap: () => navigateTo(context, '/decode_base64'),
          ),
          ListTile(
            leading: const Icon(Icons.build),
            title: const Text('Generate GUID'),
            onTap: () => navigateTo(context, '/generate_guid'),
          ),
        ],
      ),
    );
  }
}
