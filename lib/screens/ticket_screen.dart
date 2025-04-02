import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:intl/intl.dart';

class TicketScreen extends StatelessWidget {
  final Map<String, dynamic> event;

  const TicketScreen({
    super.key,
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    // Generate a unique ticket ID (in a real app, this would come from the backend)
    final String ticketId = '${event['title']}-${DateTime.now().millisecondsSinceEpoch}';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Ticket'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      event['title'],
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    QrImageView(
                      data: ticketId,
                      version: QrVersions.auto,
                      size: 200,
                      backgroundColor: Colors.white,
                    ),
                    const SizedBox(height: 24),
                    _buildTicketInfo(
                      context,
                      'Ticket ID',
                      ticketId,
                    ),
                    const Divider(height: 32),
                    _buildTicketInfo(
                      context,
                      'Date',
                      DateFormat('EEEE, MMMM dd, yyyy').format(DateTime.parse(event['date'])),
                    ),
                    const SizedBox(height: 8),
                    _buildTicketInfo(
                      context,
                      'Location',
                      event['location'],
                    ),
                    const SizedBox(height: 8),
                    _buildTicketInfo(
                      context,
                      'Price',
                      event['price'],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                // In a real app, this would share the ticket
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Ticket sharing feature coming soon!'),
                  ),
                );
              },
              icon: const Icon(Icons.share),
              label: const Text('Share Ticket'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTicketInfo(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.grey[600],
                  ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
} 