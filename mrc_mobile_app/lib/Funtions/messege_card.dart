import 'package:flutter/material.dart';

class MessageCard extends StatelessWidget {
  final String location;
  final String waterLevel;
  final String timestamp;
  final String floodAlert;
  final String trend;
  final String historicalData;
  final String predictiveInfo;

  const MessageCard(
      {super.key,
      required this.location,
      required this.waterLevel,
      required this.timestamp,
      required this.floodAlert,
      required this.trend,
      required this.historicalData,
      required this.predictiveInfo});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Location: $location",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'CADTMonoDisplay',
              color: Color.fromARGB(255, 6, 18, 67),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Water Level: $waterLevel",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Timestamp: $timestamp",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Flood Alert: $floodAlert",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Trend: $trend",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Historical Data: $historicalData",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Predictive Information: $predictiveInfo",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
