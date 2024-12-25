import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom Navigation Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const NavigationMenu(),
    );
  }
}

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({Key? key}) : super(key: key);

  @override
  _NavigationMenuState createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Screen'),
    Text('Devices Screen'),
    Text('Alerts Screen'),
    Text('Profile Screen'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey, width: 0.5)), // Applying the black top border
        ),
        child: NavigationBar(
          height: 60,
          elevation: 0,
          selectedIndex: _selectedIndex,
          backgroundColor: Colors.white,
          onDestinationSelected: _onItemTapped,
          destinations: [
            NavigationDestination(
              icon: _selectedIndex == 0 ? const Icon(Iconsax.home_15) : const Icon(Iconsax.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: _selectedIndex == 1 ? const Icon(Iconsax.activity5) : const Icon(Iconsax.activity),
              label: 'Devices',
            ),
            NavigationDestination(
              icon: _selectedIndex == 2 ? const Icon(Iconsax.messages_35) : const Icon(Iconsax.messages_3),
              label: 'Alerts',
            ),
            NavigationDestination(
              icon: _selectedIndex == 3 ? const Icon(Icons.person, size: 25, color: Colors.black) : const Icon(Icons.person_outline, size: 25),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
