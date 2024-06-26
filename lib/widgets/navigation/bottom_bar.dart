import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int)? onItemTap;

  const CustomBottomNavigationBar(this.selectedIndex, this.onItemTap,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.25),
            spreadRadius: 0.5,
            blurRadius: 10,
            offset: const Offset(0, -4)),
      ]),
      child: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0,
        iconSize: 40,
        currentIndex: selectedIndex,
        backgroundColor: const Color(0xff242333),
        selectedItemColor: const Color(0xff29d8f7),
        unselectedItemColor: const Color(0x4029d8f7),
        onTap: onItemTap,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_search_rounded),
            label: 'Matchmaking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.vpn_key_rounded),
            label: 'Game Vault',
          ),
        ],
      ),
    );
  }
}
