import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socialy/screens/widgets/customCard.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final List<Map<String, String>> stories = [
    {
      "name": "benico.J",
      "image":
          "https://images.unsplash.com/photo-1657140649222-dc72c23bd1f3?q=80&w=435&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    },
    {
      "name": "santiago18",
      "image":
          "https://images.unsplash.com/photo-1662139578574-36c9c0f724ec?q=80&w=436&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    },
    {
      "name": "elxGray",
      "image":
          "https://images.unsplash.com/photo-1657140610896-9736a42f4ea9?q=80&w=436&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    },
    {
      "name": "benico.J",
      "image":
          "https://plus.unsplash.com/premium_photo-1694425773163-d8d730608767?q=80&w=404&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    },
    {"name": "santiago18", "image": "https://via.placeholder.com/150/00FF00"},
    {"name": "elxGray", "image": "https://via.placeholder.com/150/0000FF"},
  ];

  // Liste fictive de données pour les cartes.
  final List<Map<String, String>> cardData = [
    {
      "username": "@harry_lee",
      "image":
          "https://images.unsplash.com/photo-1642802767829-bea7b5a6c15f?q=80&w=436&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "time": "25 min ago",
      "song": "Black Eyes Blue",
      "artist": "Corey Taylor",
      "albumArt":
          "https://plus.unsplash.com/premium_photo-1694425773163-d8d730608767?q=80&w=404&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    },
    {
      "username": "@john_doe",
      "image": "https://via.placeholder.com/400x201",
      "time": "1 hr ago",
      "song": "Lost Cause",
      "artist": "Billie Eilish",
      "albumArt": "https://via.placeholder.com/51",
    },
    {
      "username": "@john_doe",
      "image": "https://via.placeholder.com/400x201",
      "time": "1 hr ago",
      "song": "Lost Cause",
      "artist": "Billie Eilish",
      "albumArt": "https://via.placeholder.com/51",
    },
    {
      "username": "@john_doe",
      "image": "https://via.placeholder.com/400x201",
      "time": "1 hr ago",
      "song": "Lost Cause",
      "artist": "Billie Eilish",
      "albumArt": "https://via.placeholder.com/51",
    },
    {
      "username": "@john_doe",
      "image": "https://via.placeholder.com/400x201",
      "time": "1 hr ago",
      "song": "Lost Cause",
      "artist": "Billie Eilish",
      "albumArt": "https://via.placeholder.com/51",
    },
    {
      "username": "@john_doe",
      "image": "https://via.placeholder.com/400x201",
      "time": "1 hr ago",
      "song": "Lost Cause",
      "artist": "Billie Eilish",
      "albumArt": "https://via.placeholder.com/51",
    },
    // Ajoute plus de cartes ici...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 10.w),
            // Liste des stories
            SizedBox(
              height: 110.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: stories.length + 1, // +1 pour l'élément "Add Story"
                itemBuilder: (context, index) {
                  if (index == 0) {
                    // Icône "Add Story"
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                      child: Column(
                        children: [
                          Container(
                            width: 80.w,
                            height: 80.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: const LinearGradient(colors: [
                                Colors.pink,
                                Colors.red,
                              ]),
                            ),
                            child: Center(
                              child: IconButton(
                                icon: const Icon(
                                  Icons.add,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  debugPrint("Add Story tapped");
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 5.h),
                          const Text(
                            'Your story',
                            style: TextStyle(fontSize: 12),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  } else {
                    // Stories normales
                    final story = stories[index - 1]; // Décalage
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                      child: Column(
                        children: [
                          Container(
                            width: 80.w,
                            height: 80.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: const LinearGradient(colors: [
                                Colors.pink,
                                Colors.purple,
                              ]),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: CircleAvatar(
                                radius: 35.w,
                                backgroundImage: NetworkImage(story['image']!),
                              ),
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            story['name']!,
                            style: const TextStyle(fontSize: 12),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
            // Liste des cartes
            Expanded(
              child: ListView.builder(
                itemCount: cardData.length,
                itemBuilder: (context, index) {
                  final data = cardData[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: CustomCard(
                      key: ValueKey(data["username"]),
                      username: data["username"]!,
                      image: data["image"]!,
                      time: data["time"]!,
                      song: data["song"]!,
                      artist: data["artist"]!,
                      albumArt: data["albumArt"]!,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
