import 'package:flutter/material.dart';
import 'package:vehicle_management_app/models/header_data_model.dart';
import 'package:vehicle_management_app/widgets/dashboard_widget/stat_card.dart';

class CardSection extends StatelessWidget {
  final HeaderData headerData;
  const CardSection({super.key, required this.headerData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          StatCard(
            icon: Icons.monetization_on,
            iconColor: Colors.teal,
            title: "Earnings",
            subtitle: "Total revenue generated",
            value: "₹${headerData.earningActual.toStringAsFixed(0)}",
            prediction:
                "predicted ₹${headerData.earningPredicted.toStringAsFixed(0)}",
          ),
          StatCard(
            icon: Icons.attach_money,
            iconColor: Colors.blue,
            title: "Variable Cost",
            subtitle: "Expenses & maintenance",
            value: "₹${headerData.costingActual.toStringAsFixed(0)}",
            prediction:
                "predicted ₹${headerData.costingPredicted.toStringAsFixed(0)}",
          ),
          StatCard(
            icon: Icons.trending_up,
            iconColor: Colors.green,
            title: "Profit / Loss",
            subtitle: "Financial outcome",
            value: "₹${headerData.profitLossActual.toStringAsFixed(0)}",
            prediction:
                "predicted ₹${headerData.profitLossPredicted.toStringAsFixed(0)}",
          ),
          StatCard(
            icon: Icons.check_circle_outline,
            iconColor: Colors.blueGrey,
            title: "No. of trips completed",
            subtitle: "Successful trips finished",
            value: "${headerData.tripsCompleted}",
            prediction: "",
          ),
          StatCard(
            icon: Icons.local_shipping,
            iconColor: Colors.amber,
            title: "Vehicles on the road",
            subtitle: "Active fleet count",
            value: "${headerData.vehiclesOnRoad}",
            prediction: "",
          ),
          StatCard(
            icon: Icons.route,
            iconColor: Colors.purple,
            title: "Total distance travelled",
            subtitle: "Kilometers covered by the fleet",
            value: "${headerData.totalDistanceActual.toStringAsFixed(1)} km",
            prediction:
                "predicted ${headerData.totalDistancePredicted.toStringAsFixed(1)} km",
          ),
        ],
      ),
    );
  }
}
