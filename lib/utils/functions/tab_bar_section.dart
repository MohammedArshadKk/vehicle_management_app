import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vehicle_management_app/blocs/pnl_bloc/pnl_bloc.dart';

class TabBarSection extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabSelected;

  const TabBarSection({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(child: tab("Yesterday", 0, 'Yesterday', context)),
          const SizedBox(width: 8),
          Expanded(child: tab("Today", 1, 'Today', context)),
          const SizedBox(width: 8),
          Expanded(child: tab("Monthly", 2, 'Monthly', context)),
        ],
      ),
    );
  }

  Widget tab(String title, int index, String type, BuildContext context) {
    final isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () {
        onTabSelected(index);
        context.read<PnlBloc>().add(FetchDataEvent(type: type));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : const Color(0xFF282828),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.black : Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
