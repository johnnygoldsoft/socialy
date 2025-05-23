import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socialy/screens/homeScreen.dart';
import 'package:socialy/screens/onbordingScreen.dart';
import 'package:socialy/screens/profileScreen.dart';
import 'package:socialy/screens/profileScreen2.dart';
import 'package:socialy/screens/reelScreen.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Homescreen(),
    Reelscreen(),
    Center(child: Text("Add Page")),
    ProfileScreen(),
    Profilescreen2(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Stack(
        children: [
          // Conteneur pour contrôler hauteur et padding
          Container(
            height: 80.h, // Hauteur personnalisée
            padding: const EdgeInsets.symmetric(
                horizontal: 10), // Padding horizontal
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: BottomNavigationBar(
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.red,
              unselectedItemColor: Colors.grey,
              elevation: 0, // Supprimer l'élévation
              backgroundColor:
                  Colors.white, // Transparent pour respecter le conteneur
              items: [
                const BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Home",
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.video_library),
                  label: "Videos",
                ),
                BottomNavigationBarItem(
                  icon:
                      SizedBox(width: 40), // Placeholder pour l'espace central
                  label: "",
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: "Search",
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: "Account",
                ),
              ],
            ),
          ),
          // Bouton central
          Positioned(
            bottom:
                25, // Position ajustée pour correspondre à la nouvelle hauteur
            left: MediaQuery.of(context).size.width / 2 - 15,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = 2; // Sélectionne l'onglet "Add"
                });
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
