import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
   Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0; // Selected tab ko track karne ke liye
  final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>(); // GlobalKey for Drawer

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Selected index ko update karte hain
    });
  }

  String _getTitleText() {
    switch (_selectedIndex) {
      case 0:
        return 'Home';
      case 1:
        return 'Search';
      case 2:
        return 'Profile';
      default:
        return 'Hello Roshan';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Text('AppBar with Actions'),
          automaticallyImplyLeading: true,
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          actionsIconTheme: const IconThemeData(
            color: Colors.white,
            size: 30,
            opacity: 0.8,
          ),
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                if (kDebugMode) {
                  print("Search icon tapped");
                }
              },
            ),
            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {
                _scaffoldKey.currentState!.openDrawer();
              },
            ),
          ],
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.red, Colors.orange],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
          ),
        ),
        drawer: Drawer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              UserAccountsDrawerHeader(
                accountName: const Text("Roshan Kumar"),
                accountEmail: const Text("roshan.kumar@yuvaap.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/profile.jpg'),  // Correct way to load from assets
                ),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.red, Colors.orange],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text("Home"),
                onTap: () {
                  Navigator.pop(context);
                  print("Home tapped");
                },
              ),
              ListTile(
                leading: const Icon(Icons.search),
                title: const Text("Search"),
                onTap: () {
                  Navigator.pop(context);
                  print("Search tapped");
                },
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text("Profile"),
                onTap: () {
                  Navigator.pop(context);
                  print("Profile tapped");
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text("Settings"),
                onTap: () {
                  Navigator.pop(context);
                  print("Settings tapped");
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text("Logout"),
                onTap: () {
                  Navigator.pop(context);
                  print("Logout tapped");
                },
              ),
            ],
          ),
        ),
        body: Center(
          child: Text(
            _getTitleText(), // Dynamically change text
            style: const TextStyle(fontSize: 24),
          ),
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.orange, Colors.red],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.home, 'Home', 0),
              _buildNavItem(Icons.search, 'Search', 1),
              _buildNavItem(Icons.person, 'Profile', 2),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.white : Colors.black54,
            size: 30,
          ),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black54,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
