import 'package:flutter/material.dart';

class SosAlert extends StatelessWidget {
  final String time;

  const SosAlert({
    super.key,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.amber[50],
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.warning_amber_rounded, color: Colors.red[700]),
              const SizedBox(width: 8),
              RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.grey[800]),
                  children: [
                    const TextSpan(
                      text: "SOS call made at ",
                      style: TextStyle(fontSize: 14),
                    ),
                    TextSpan(
                      text: time,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.red[700],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const TextSpan(
                      text: " by driver",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Icon(
            Icons.arrow_forward,
            color: Colors.grey[800],
          ),
        ],
      ),
    );
  }
}