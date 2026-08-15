import 'package:flutter/material.dart';

class NodesScreen extends StatelessWidget {
  const NodesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sensor Nodes',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          NodeCard(
            nodeId: 'NODE_01',
            sector: 'Sector 1',
            temperature: '32.5 °C',
            humidity: '45 %',
            status: 'Normal',
          ),
          NodeCard(
            nodeId: 'NODE_02',
            sector: 'Sector 2',
            temperature: '34.1 °C',
            humidity: '41 %',
            status: 'Normal',
          ),
          NodeCard(
            nodeId: 'NODE_03',
            sector: 'Sector 3',
            temperature: '42.8 °C',
            humidity: '25 %',
            status: 'Warning',
          ),
          NodeCard(
            nodeId: 'NODE_04',
            sector: 'Sector 4',
            temperature: '31.2 °C',
            humidity: '48 %',
            status: 'Normal',
          ),
        ],
      ),
    );
  }
}

class NodeCard extends StatelessWidget {
  final String nodeId;
  final String sector;
  final String temperature;
  final String humidity;
  final String status;

  const NodeCard({
    super.key,
    required this.nodeId,
    required this.sector,
    required this.temperature,
    required this.humidity,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final bool isWarning = status == 'Warning';

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: isWarning
                  ? Colors.orange.shade100
                  : Colors.green.shade100,
              child: Icon(
                isWarning ? Icons.warning_amber : Icons.check_circle,
                color: isWarning ? Colors.orange : Colors.green,
              ),
            ),

            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nodeId,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(sector),
                  const SizedBox(height: 8),
                  Text(
                    '$temperature  •  $humidity',
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),

            Text(
              status,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isWarning ? Colors.orange : Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
