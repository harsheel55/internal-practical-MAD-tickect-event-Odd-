import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class TicketTransferScreen extends StatelessWidget {
  final Map<String, dynamic> event;
  final String ticketId;

  const TicketTransferScreen({
    super.key,
    required this.event,
    required this.ticketId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfer Ticket'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      event['title'],
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Ticket ID: $ticketId',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Date: ${event['date']}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Transfer Options',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            _buildTransferOption(
              context,
              icon: Icons.email,
              title: 'Transfer via Email',
              subtitle: 'Send ticket to an email address',
              onTap: () => _showEmailTransferDialog(context),
            ),
            const SizedBox(height: 16),
            _buildTransferOption(
              context,
              icon: Icons.link,
              title: 'Generate Transfer Link',
              subtitle: 'Create a shareable link for the ticket',
              onTap: () => _generateTransferLink(context),
            ),
            const SizedBox(height: 16),
            _buildTransferOption(
              context,
              icon: Icons.qr_code,
              title: 'Transfer via QR Code',
              subtitle: 'Generate a QR code for transfer',
              onTap: () => _showQRTransferDialog(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransferOption(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }

  void _showEmailTransferDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Transfer via Email'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Recipient Email',
                hintText: 'Enter email address',
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              // In a real app, this would handle the email transfer
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Ticket transfer initiated!'),
                ),
              );
            },
            child: const Text('Transfer'),
          ),
        ],
      ),
    );
  }

  void _generateTransferLink(BuildContext context) {
    // In a real app, this would generate a unique transfer link
    final transferLink = 'https://yourapp.com/transfer/$ticketId';
    Share.share(
      'Transfer your ticket: $transferLink',
      subject: 'Ticket Transfer Link',
    );
  }

  void _showQRTransferDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Transfer QR Code'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Show this QR code to the recipient to transfer the ticket',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            // In a real app, this would generate a QR code with transfer data
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Text('QR Code Placeholder'),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
} 