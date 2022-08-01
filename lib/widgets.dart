import 'package:flutter/material.dart';
import 'nav.dart';

class PageScaffold extends StatelessWidget {
  const PageScaffold({
    Key? key,
    required this.child,
    this.title = 'Dev Tools',
  }) : super(key: key);
  final Widget child;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: const NavigationDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: child,
      ),
    );
  }
}

class HomeCard extends StatelessWidget {
  const HomeCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.route,
  }) : super(key: key);
  final String title;
  final IconData icon;
  final String route;

  void navigateTo(BuildContext context) {
    Navigator.pushNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(route);
        },
        child: SizedBox(
          width: 200,
          height: 200,
          child: Center(
            child: Column(
              children: [
                const Spacer(),
                Icon(icon),
                const Spacer(),
                Text(title),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
