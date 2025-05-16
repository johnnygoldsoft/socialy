import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCard extends StatelessWidget {
  final String username;
  final String image;
  final String time;
  final String song;
  final String artist;
  final String albumArt;

  const CustomCard({
    super.key,
    required this.username,
    required this.image,
    required this.time,
    required this.song,
    required this.artist,
    required this.albumArt,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Section supérieure : Informations de l'utilisateur
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                // Avatar
                CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(albumArt),
                ),
                const SizedBox(width: 10),
                // Nom d'utilisateur et heure
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      username,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      time,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                // Icône d'options
                Icon(
                  Icons.more_horiz,
                  color: Colors.grey[800],
                ),
              ],
            ),
          ),
          // Image principale
          ClipRRect(
            child: Image.network(
              image,
              height: MediaQuery.of(context).size.height * 0.6,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          // Section inférieure : Détails de la chanson
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                // Image de l'album ou icône
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    albumArt,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 10),
                // Informations sur la chanson
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      song,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      artist,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                // Bouton de lecture
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {
                      debugPrint("Play tapped");
                    },
                    icon: const Icon(Icons.play_arrow_outlined),
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
