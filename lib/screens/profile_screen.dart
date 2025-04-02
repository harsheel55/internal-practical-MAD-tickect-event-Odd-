import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://picsum.photos/200'),
            ),
            const SizedBox(height: 16),
            Text(
              'John Doe',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              'john.doe@example.com',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.grey[600],
                  ),
            ),
            const SizedBox(height: 32),
            _buildSection(
              context,
              'My Tickets',
              [
                _buildTicketItem(
                  context,
                  'Summer Music Festival',
                  'July 15, 2024',
                  '\$99.99',
                ),
                _buildTicketItem(
                  context,
                  'Tech Conference 2024',
                  'August 20, 2024',
                  '\$299.99',
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildSection(
              context,
              'Settings',
              [
                _buildSettingsItem(
                  context,
                  Icons.notifications,
                  'Notifications',
                ),
                _buildSettingsItem(
                  context,
                  Icons.payment,
                  'Payment Methods',
                ),
                _buildSettingsItem(
                  context,
                  Icons.help,
                  'Help & Support',
                ),
                _buildSettingsItem(
                  context,
                  Icons.logout,
                  'Logout',
                  isLogout: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context, String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 16),
        Card(
          child: Column(
            children: children,
          ),
        ),
      ],
    );
  }

  Widget _buildTicketItem(
    BuildContext context,
    String eventName,
    String date,
    String price,
  ) {
    return ListTile(
      title: Text(eventName),
      subtitle: Text(date),
      trailing: Text(
        price,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
      ),
      onTap: () {
        // In a real app, this would navigate to the ticket details
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Ticket details coming soon!'),
          ),
        );
      },
    );
  }

  Widget _buildSettingsItem(
    BuildContext context,
    IconData icon,
    String title, {
    bool isLogout = false,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: isLogout ? Colors.red : null,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isLogout ? Colors.red : null,
        ),
      ),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        // In a real app, this would handle the settings action
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$title feature coming soon!'),
          ),
        );
      },
    );
  }
} 