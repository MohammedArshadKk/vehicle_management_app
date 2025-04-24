part of 'pnl_bloc.dart';

@immutable
sealed class PnlEvent {}

class FetchDataEvent extends PnlEvent {
  final String type;
  final bool refresh;

  FetchDataEvent({required this.type, this.refresh = false});
}
