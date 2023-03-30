import 'package:flutter/material.dart';
import 'package:keeptruckin/ChatBot/chat_screen.dart';
import 'package:keeptruckin/constants.dart';
import 'package:keeptruckin/deliveries.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  final screens =[
    OrdersHomeScreen(),
    const Text('Current Location'),
  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: screens[index],
      floatingActionButton: FloatingActionButton.large(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const ChatScreen()));
      }, child: const Icon(Icons.smart_toy_outlined)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: NavigationBar(
        height: scHeight(context)*0.09,
        selectedIndex: index,
        onDestinationSelected: (index) => setState(() => this.index = index),
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.home_outlined),
            label: 'Deliveries',
            selectedIcon: Icon(Icons.home),
          ),
          NavigationDestination(
            icon: const Icon(Icons.location_on_outlined),
            label: 'Current Location',
            selectedIcon: Icon(Icons.location_on),
          ),
        ],

      ),
    );
  }
}
