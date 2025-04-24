import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:vehicle_management_app/models/header_data_model.dart';
import 'package:vehicle_management_app/models/vehicle_data_model.dart';
import 'package:vehicle_management_app/services/pnl_service.dart';

part 'pnl_event.dart';
part 'pnl_state.dart';

class PnlBloc extends Bloc<PnlEvent, PnlState> {
  PnlBloc() : super(PnlInitial()) {
    on<FetchDataEvent>(fetchDataEvent);
  }
  final PnlService pnlService = PnlService();
  FutureOr<void> fetchDataEvent(
    FetchDataEvent event,
    Emitter<PnlState> emit,
  ) async {
    try {
      emit(LoadingState());
      final Map<String, dynamic> data = await pnlService.getPnL(
        event.type,
        refresh: event.refresh,
      );
      final HeaderData headerData = HeaderData.fromMap(data['header']);
      final List<VehicleData> vehicleDataList =
          (data['vehicles'] as List)
              .map((vehicle) => VehicleData.fromMap(vehicle))
              .toList();
      emit(
        DataFetchCompletedState(
          vehicleDataList: vehicleDataList,
          headerData: headerData,
        ),
      );
    } catch (e) {
      final String error = e.toString();
      log(error);

      String userFriendlyMessage = 'Something went wrong.';
      if (error.contains('SocketException')) {
        userFriendlyMessage = 'No Internet connection.';
      } else if (error.contains('FormatException')) {
        userFriendlyMessage = 'Invalid data format received.';
      }

      emit(ErrorState(error: userFriendlyMessage));
    }
  }
}
