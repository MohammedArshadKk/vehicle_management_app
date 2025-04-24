class HeaderData {
  final double profitLossPredicted;
  final double profitLossActual;
  final double costingPredicted;
  final double costingActual;
  final double earningPredicted;
  final double earningActual;
  final int tripsCompleted;
  final int vehiclesOnRoad;
  final double totalDistancePredicted; 
  final double totalDistanceActual; 

  HeaderData({
    required this.profitLossPredicted,
    required this.profitLossActual,
    required this.costingPredicted,
    required this.costingActual,
    required this.earningPredicted,
    required this.earningActual,
    required this.tripsCompleted,
    required this.vehiclesOnRoad,
    required this.totalDistancePredicted,
    required this.totalDistanceActual,
  });

  factory HeaderData.fromMap(Map<String, dynamic> map) {
    return HeaderData(
      profitLossPredicted: map['profit/loss_predicted']?.toDouble() ?? 0.0,
      profitLossActual: map['profit/loss_actual']?.toDouble() ?? 0.0,
      costingPredicted: map['costing_predicted']?.toDouble() ?? 0.0,
      costingActual: map['costing_actual']?.toDouble() ?? 0.0,
      earningPredicted: map['earning_predicted']?.toDouble() ?? 0.0,
      earningActual: map['earning_actual']?.toDouble() ?? 0.0,
      tripsCompleted: map['trips_completed'] ?? 0,
      vehiclesOnRoad: map['vehicles_on_road'] ?? 0,
      totalDistancePredicted: map['total_distance_predicted']?.toDouble() ?? 0.0,
      totalDistanceActual: map['total_distance_actual']?.toDouble() ?? 0.0,
    );
  }
}
