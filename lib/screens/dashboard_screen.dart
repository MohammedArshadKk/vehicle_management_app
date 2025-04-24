import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicle_management_app/blocs/pnl_bloc/pnl_bloc.dart';
import 'package:vehicle_management_app/utils/functions/get_user_name.dart';
import 'package:vehicle_management_app/utils/functions/tab_bar_section.dart';
import 'package:vehicle_management_app/widgets/common_widgets/error_message.dart';
import 'package:vehicle_management_app/widgets/common_widgets/loading_widget.dart';
import 'package:vehicle_management_app/widgets/dashboard_widget/card_section.dart';
import 'package:vehicle_management_app/widgets/dashboard_widget/user_name_session.dart';
import 'package:vehicle_management_app/widgets/dashboard_widget/profit_loss_section.dart';
import 'package:vehicle_management_app/widgets/dashboard_widget/vehicles_overview.dart';
import 'package:vehicle_management_app/widgets/dashboard_widget/bottom_navigation.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedTabIndex = 0;
  String name = '';

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      name = await getUserName() ?? '';
      setState(() {});
    });
    context.read<PnlBloc>().add(FetchDataEvent(type: 'Yesterday'));
    super.initState();
  }

  void _onTabSelected(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF141414),
      body: SafeArea(
        child: BlocConsumer<PnlBloc, PnlState>(
          listener: (context, state) {
            if (state is LoadingState) {
              customLoading(context);
            } else if (state is ErrorState) {
              Navigator.pop(context);
              showErrorMessage(
                context: context,
                message: state.error,
                onTap: () {
                  context.read<PnlBloc>().add(
                    FetchDataEvent(type: 'Yesterday'),
                  );
                  Navigator.pop(context);
                },
                text: 'Retry',
              );
            } else {
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            if (state is DataFetchCompletedState) {
              return RefreshIndicator(
                onRefresh: () async {
                  context.read<PnlBloc>().add(
                    FetchDataEvent(
                      type:
                          _selectedTabIndex == 0
                              ? 'Yesterday'
                              : _selectedTabIndex == 1
                              ? 'Today'
                              : 'Monthly',
                      refresh: true,
                    ),
                  );
                },
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      userNameSession(name),
                      TabBarSection(
                        selectedIndex: _selectedTabIndex,
                        onTabSelected: _onTabSelected,
                      ),
                      ProfitLossSection(
                        profitLoss: state.headerData.profitLossActual
                            .toStringAsFixed(2),
                        profitLossPredicted:
                            state.headerData.profitLossPredicted.toString(),
                      ),
                      CardSection(headerData: state.headerData),
                      VehiclesOverview(vehicleDataList: state.vehicleDataList),
                    ],
                  ),
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
      bottomNavigationBar: const DashboardBottomNavigation(),
    );
  }
}
