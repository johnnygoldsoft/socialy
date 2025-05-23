import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileStatsWidget extends StatelessWidget {
  final List<Map<String, dynamic>> stats = [
    {
      "count": "214",
      "label": "posts",
      "images": [
        "https://images.unsplash.com/photo-1642802767829-bea7b5a6c15f?q=80&w=436&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "https://plus.unsplash.com/premium_photo-1694425773163-d8d730608767?q=80&w=404&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "https://images.unsplash.com/photo-1642802767829-bea7b5a6c15f?q=80&w=436&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      ],
    },
    {
      "count": "13k",
      "label": "followers",
      "images": [
        "https://images.unsplash.com/photo-1642802767829-bea7b5a6c15f?q=80&w=436&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "https://plus.unsplash.com/premium_photo-1694425773163-d8d730608767?q=80&w=404&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "https://images.unsplash.com/photo-1642802767829-bea7b5a6c15f?q=80&w=436&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      ],
    },
    {
      "count": "134",
      "label": "following",
      "images": [
        "https://images.unsplash.com/photo-1642802767829-bea7b5a6c15f?q=80&w=436&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "https://plus.unsplash.com/premium_photo-1694425773163-d8d730608767?q=80&w=404&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "https://images.unsplash.com/photo-1642802767829-bea7b5a6c15f?q=80&w=436&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: stats.map((stat) {
        return _buildStatCard(stat);
      }).toList(),
    );
  }

  Widget _buildStatCard(Map<String, dynamic> stat) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.w),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Superposition des avatars
          SizedBox(
            height: 40, // Hauteur pour le conteneur de Stack
            width: 100, // Largeur explicite pour Stack
            child: Stack(
              alignment: Alignment.center,
              children: List.generate(stat['images'].length, (index) {
                return Positioned(
                  left: index * 30.0, // Décalage horizontal entre les avatars
                  child: CircleAvatar(
                    radius: 16,
                    backgroundImage: NetworkImage(stat['images'][index]),
                    backgroundColor: Colors.grey[200],
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: 8),
          // Nombre
          Row(
            children: [
              Text(
                stat['count'],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),

              SizedBox(
                width: 5.w,
              ),
              // Label
              Text(
                stat['label'],
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
