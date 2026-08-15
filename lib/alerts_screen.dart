import 'package:flutter/material.dart';

class AlertsScreen extends StatelessWidget {
  const AlertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Alerts',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          AlertCard(
            severity: 'WARNING',
            title: 'High temperature detected',
            node: 'NODE_03',
            sector: 'Sector 3',
            time: '14:35',
          ),
        ],
      ),
    );
  }
}

class AlertCard extends StatelessWidget {
  final String severity;
  final String title;
  final String node;
  final String sector;
  final String time;

  const AlertCard({
    super.key,
    required this.severity,
    required this.title,
    required this.node,
    required this.sector,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const CircleAvatar(child: Icon(Icons.warning_amber)),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('$node • $sector\n$time'),
        isThreeLine: true,
      ),
    );
  }
}
