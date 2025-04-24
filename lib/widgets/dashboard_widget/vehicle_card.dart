import 'package:flutter/material.dart';
import 'package:vehicle_management_app/widgets/dashboard_widget/sos_alert.dart';
import 'package:vehicle_management_app/widgets/dashboard_widget/vehicle_stat_row.dart';


class VehicleCard extends StatelessWidget {
  final String vehicleNumber;
  final String driverName;
  final String profit;
  final String cost; 
  final String costSubtext;
  final String earnings;
  final String earningsSubtext;
  final String sosTime;

  const VehicleCard({
    super.key,
    required this.vehicleNumber,
    required this.driverName,
    required this.profit,
    required this.cost,
    required this.costSubtext,
    required this.earnings,
    required this.earningsSubtext,
    required this.sosTime,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column( 
          children: [
            _buildCardHeader(),
            const Divider(height: 1),
            VehicleStatRow(
              label: "Cost",
              value: cost,
              subtext: costSubtext,
              progressColor: Colors.grey[200]!,
              progressWidth: 100,
            ),
            VehicleStatRow(
              label: "Earnings",
              value: earnings,
              subtext: earningsSubtext,
              progressColor: Colors.teal,
              progressWidth: double.infinity,
              bottomPadding: 12,
            ),
            SosAlert(time: sosTime),
          ],
        ),
      ),
    );
  }

  Widget _buildCardHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    vehicleNumber,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      "IDLE",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.person, size: 18, color: Colors.grey[600]),
                  const SizedBox(width: 4),
                  Text(
                    driverName,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: Colors.teal.shade50,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  profit,
                  style: const TextStyle(
                    color: Colors.teal,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Profit / Loss",
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}