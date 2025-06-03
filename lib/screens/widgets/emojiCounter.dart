import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Emojicounter extends StatelessWidget {
  final List<Map<String, dynamic>> reactions;
  final Set<int> selectedIndices;
  final Function(int) onTap;

  const Emojicounter({
    required this.reactions,
    required this.selectedIndices,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Wrap(
        spacing: 8.0, // Espacement horizontal entre les widgets
        runSpacing: 8.0, // Espacement vertical entre les lignes
        children: reactions.asMap().entries.map((entry) {
          int index = entry.key;
          Map<String, dynamic> reaction = entry.value;

          bool isSelected = selectedIndices.contains(index);

          return GestureDetector(
            onTap: () => onTap(index),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 7.w),
              decoration: BoxDecoration(
                color: isSelected ? Colors.red : Colors.grey.shade200,
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    reaction['emoji'],
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    '${reaction['count']}',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: isSelected ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
