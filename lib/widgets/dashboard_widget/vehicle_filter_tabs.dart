import 'package:flutter/material.dart';

class VehicleFilterTabs extends StatelessWidget {
  final String selectedFilter;
  final Function(String) onFilterSelected;
  final Map<String, int> counts;

  const VehicleFilterTabs({
    super.key,
    required this.selectedFilter,
    required this.onFilterSelected,
    required this.counts,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          FilterTab(
            title: 'All',
            count: counts['All']?.toString() ?? '0',
            isSelected: selectedFilter == 'All',
            onTap: () => onFilterSelected('All'),
          ),
          const SizedBox(width: 8),
          FilterTab(
            title: 'Running',
            count: counts['Running']?.toString() ?? '0',
            isSelected: selectedFilter == 'Running',
            onTap: () => onFilterSelected('Running'),
          ),
          const SizedBox(width: 8),
          FilterTab(
            title: 'Idle',
            count: counts['Idle']?.toString() ?? '0',
            isSelected: selectedFilter == 'Idle',
            onTap: () => onFilterSelected('Idle'),
          ),
          const SizedBox(width: 8),
          FilterTab(
            title: 'Inactive',
            count: counts['Inactive']?.toString() ?? '0',
            isSelected: selectedFilter == 'Inactive',
            onTap: () => onFilterSelected('Inactive'),
          ),
        ],
      ),
    );
  }
}

class FilterTab extends StatelessWidget {
  final String title;
  final String count;
  final bool isSelected;
  final VoidCallback onTap;

  const FilterTab({
    super.key,
    required this.title,
    required this.count,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF1C3661) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: !isSelected ? Border.all(color: Colors.grey.shade400) : null,
        ),
        child: Text(
          "$title ($count)",
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey.shade600,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
