import 'package:flutter/material.dart';
import '../widgets/event_card.dart';
import 'event_details_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> _events = [
    {
      'title': 'Summer Music Festival',
      'date': '2024-07-15',
      'location': 'Central Park, New York',
      'price': '\$99.99',
      'image': 'https://picsum.photos/200/300',
    },
    {
      'title': 'Tech Conference 2024',
      'date': '2024-08-20',
      'location': 'Convention Center, San Francisco',
      'price': '\$299.99',
      'image': 'https://picsum.photos/200/301',
    },
    {
      'title': 'Food & Wine Expo',
      'date': '2024-09-10',
      'location': 'Grand Hotel, Chicago',
      'price': '\$149.99',
      'image': 'https://picsum.photos/200/302',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Ticketing'),
        centerTitle: true,
        elevation: 0,
      ),
      body: _selectedIndex == 0
          ? ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _events.length,
              itemBuilder: (context, index) {
                final event = _events[index];
                return EventCard(
                  title: event['title'],
                  date: event['date'],
                  location: event['location'],
                  price: event['price'],
                  imageUrl: event['image'],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EventDetailsScreen(event: event),
                      ),
                    );
                  },
                );
              },
            )
          : const ProfileScreen(),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.event),
            label: 'Events',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
} 