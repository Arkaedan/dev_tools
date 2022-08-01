import 'package:flutter/material.dart';

import '../widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: const [
          HomeCard(
            title: 'Encode Base64',
            icon: Icons.code,
            route: '/encode_base64',
          ),
          HomeCard(
            title: 'Decode Base64',
            icon: Icons.code_off,
            route: '/decode_base64',
          ),
          HomeCard(
            title: 'Generate GUID',
            icon: Icons.build,
            route: '/generate_guid',
          ),
        ],
      ),
    );
  }
}
