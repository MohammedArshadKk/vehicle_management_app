class VehicleData {
  final String vehicleNumber;
  final String vehicleUuid;
  final double earningActual;
  final double earningPredicted;
  final double costingActual;
  final double costingPredicted;
  final String driverName;
  final String? driverUuid; 
  final double profitLossActual;
  final double profitLossPredicted;
  final String vehicleStatus;
  final double distanceKmActual;
  final double distanceKmPredicted;
  

  VehicleData({
    required this.vehicleNumber,
    required this.vehicleUuid,
    required this.earningActual,
    required this.earningPredicted,
    required this.costingActual,
    required this.costingPredicted,
    required this.driverName,
    this.driverUuid,
    required this.profitLossActual,
    required this.profitLossPredicted,
    required this.vehicleStatus,
    required this.distanceKmActual,
    required this.distanceKmPredicted,
  });

  factory VehicleData.fromMap(Map<String, dynamic> map) {
    return VehicleData(
      vehicleNumber: map['vehicle_number'] ?? '',
      vehicleUuid: map['vehicle_uuid'] ?? '',
      earningActual: (map['earning_actual'] ?? 0).toDouble(),
      earningPredicted: (map['earning_predicted'] ?? 0).toDouble(),
      costingActual: (map['costing_actual'] ?? 0).toDouble(),
      costingPredicted: (map['costing_predicted'] ?? 0).toDouble(),
      driverName: map['driver_name'] ?? 'Unknown',
      driverUuid: map['driver_uuid'],
      profitLossActual: (map['profit/loss_actual'] ?? 0).toDouble(),
      profitLossPredicted: (map['profit/loss_predicted'] ?? 0).toDouble(),
      vehicleStatus: map['vehicle_status'] ?? 'Inactive',
      distanceKmActual: (map['distance_km_actual'] ?? 0).toDouble(),
      distanceKmPredicted: (map['distance_km_predicted'] ?? 0).toDouble(),
    ); 
  }
}
