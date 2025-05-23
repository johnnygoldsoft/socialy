import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabcontrollerScreen extends StatelessWidget {
  const TabcontrollerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Nombre d'onglets
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 1.w),
            color: Colors.white, // Couleur de fond pour la TabBar
            child: TabBar(
              tabAlignment: TabAlignment.center,
              labelPadding: EdgeInsets.symmetric(horizontal: 20.w),
              isScrollable: true,
              indicatorColor: Colors.redAccent,
              labelColor: Colors.redAccent,
              unselectedLabelColor: Colors.black54,
              tabs: [
                Tab(
                  child: Row(
                    children: [
                      Text(
                        "194",
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        " photos",
                        style: TextStyle(
                            fontSize: 12.sp, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    children: [
                      Text(
                        "15",
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        " videos",
                        style: TextStyle(
                            fontSize: 12.sp, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    children: [
                      Text(
                        "9",
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        " stories",
                        style: TextStyle(
                            fontSize: 12.sp, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    children: [
                      Text(
                        "85",
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        " tags",
                        style: TextStyle(
                            fontSize: 12.sp, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
