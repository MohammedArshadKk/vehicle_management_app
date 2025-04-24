part of 'pnl_bloc.dart';

@immutable
sealed class PnlState {}

final class PnlInitial extends PnlState {}

class LoadingState extends PnlState {}

class DataFetchCompletedState extends PnlState {
  final List<VehicleData> vehicleDataList;
  final HeaderData headerData;

  DataFetchCompletedState({
    required this.vehicleDataList,
    required this.headerData,
  });
}

class ErrorState extends PnlState {
  final String error;

  ErrorState({required this.error});
}
