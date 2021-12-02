import 'package:flutter/material.dart';
import 'package:flutter_purpose/views/bad_character.dart';
import 'package:google_fonts/google_fonts.dart';

import 'maps.dart';

class HomeBottomBar extends StatefulWidget {
  @override
  State<HomeBottomBar> createState() => _HomeBottomBarState();
}

class _HomeBottomBarState extends State<HomeBottomBar> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF10101A),
      appBar: AppBar(
        backgroundColor: Color(0xFF10101A),
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          _selectedIndex == 0 ? 'Home' : 'Map',
          style: GoogleFonts.nunito(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20.0),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 1.0,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        backgroundColor: Color(0x0D04103A),
        unselectedLabelStyle: GoogleFonts.nunito(),
        selectedLabelStyle: GoogleFonts.nunito(),
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
        ],
      ),
      body: IndexedStack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BadCharactersList(),
          ),
          Maps(),
        ],
        index: _selectedIndex,
      ),
    );
  }
}
