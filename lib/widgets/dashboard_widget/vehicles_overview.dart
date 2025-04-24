import 'package:flutter/material.dart';
import 'package:vehicle_management_app/models/vehicle_data_model.dart';
import 'package:vehicle_management_app/widgets/dashboard_widget/vehicle_card.dart';
import 'package:vehicle_management_app/widgets/dashboard_widget/vehicle_filter_tabs.dart';
import 'package:vehicle_management_app/widgets/dashboard_widget/vehicles_header.dart';

class VehiclesOverview extends StatefulWidget {
  const VehiclesOverview({super.key, required this.vehicleDataList});
  final List<VehicleData> vehicleDataList;

  @override
  State<VehiclesOverview> createState() => _VehiclesOverviewState();
}

class _VehiclesOverviewState extends State<VehiclesOverview> {
  String _selectedFilter = 'All';

  void _onFilterSelected(String filter) {
    setState(() {
      _selectedFilter = filter;
    });
  }

  Map<String, int> _getVehicleCounts() {
    Map<String, int> counts = {
      'All': widget.vehicleDataList.length,
      'Running': 0,
      'Idle': 0,
      'Inactive': 0,
    };

    for (var vehicle in widget.vehicleDataList) {
      if (vehicle.vehicleStatus == 'Running') {
        counts['Running'] = (counts['Running'] ?? 0) + 1;
      } else if (vehicle.vehicleStatus == 'Idle') {
        counts['Idle'] = (counts['Idle'] ?? 0) + 1;
      } else if (vehicle.vehicleStatus == 'Inactive') {
        counts['Inactive'] = (counts['Inactive'] ?? 0) + 1;
      }
    }
    return counts;
  }

  @override
  Widget build(BuildContext context) {
    List<VehicleData> filteredVehicles =
        _selectedFilter == 'All'
            ? widget.vehicleDataList
            : widget.vehicleDataList
                .where((vehicle) => vehicle.vehicleStatus == _selectedFilter)
                .toList();
    Map<String, int> vehicleCounts = _getVehicleCounts();
    return Container(
      color: const Color(0xFFF0F0F0),
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VehiclesHeader(),
          const SizedBox(height: 16),
          VehicleFilterTabs(
            selectedFilter: _selectedFilter,
            onFilterSelected: _onFilterSelected,
            counts: vehicleCounts,
          ),
          const SizedBox(height: 16),
          filteredVehicles.isEmpty
              ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'No vehicles found for $_selectedFilter filter',
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
                  ),
                ),
              )
              : ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: filteredVehicles.length,
                itemBuilder: (context, index) {
                  final vehicle = filteredVehicles[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: VehicleCard(
                      vehicleNumber: vehicle.vehicleNumber,
                      driverName: vehicle.driverName,
                      profit: "₹${vehicle.profitLossActual.toStringAsFixed(0)}",
                      cost: "₹${vehicle.costingActual.toStringAsFixed(0)}",
                      costSubtext:
                          "₹${vehicle.costingPredicted.toStringAsFixed(0)}",
                      earnings: "₹${vehicle.earningActual.toStringAsFixed(0)}",
                      earningsSubtext:
                          "₹${vehicle.earningPredicted.toStringAsFixed(0)}",
                      sosTime:
                          vehicle.vehicleStatus == "Running"
                              ? "Active"
                              : "Inactive",
                    ),
                  );
                },
              ),
        ],
      ),
    );
  }
}
