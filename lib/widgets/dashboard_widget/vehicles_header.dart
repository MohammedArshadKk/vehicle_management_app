import 'package:flutter/material.dart';

class VehiclesHeader extends StatelessWidget {
  const VehiclesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Icon(Icons.local_shipping, color: Colors.blueGrey[800]),
          const SizedBox(width: 8),
          Text(
            "Vehicles Overview",
            style: TextStyle(
              color: Colors.blueGrey[800],
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}