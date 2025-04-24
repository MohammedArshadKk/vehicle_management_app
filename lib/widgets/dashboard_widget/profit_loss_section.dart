import 'package:flutter/material.dart';
import 'package:vehicle_management_app/utils/colors.dart';

class ProfitLossSection extends StatelessWidget {
  final String profitLoss;
  final String profitLossPredicted;
  const ProfitLossSection({
    super.key,
    required this.profitLoss,
    required this.profitLossPredicted,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Profit/Loss",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.backgroundColor,
                ),
              ),
              Text("Fri, 7 Mar", style: TextStyle(color: AppColors.textMedium)),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '₹$profitLoss',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              Text(
                "predicted: ₹$profitLossPredicted",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
