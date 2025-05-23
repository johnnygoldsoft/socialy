import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Reelscreen extends StatefulWidget {
  const Reelscreen({super.key});

  @override
  State<Reelscreen> createState() => _ReelscreenState();
}

class _ReelscreenState extends State<Reelscreen> {
  final List<String> videoUrls = [
    "videos/vid1.mp4",
    "assets/videos/vid2.mp4",
    "videos/vid3.mp4",
  ];

  int currentPage = 0;
  late PageController pageController;
  late List<VideoPlayerController> videoControllers;

  @override
  void initState() {
    super.initState();
    pageController = PageController();

    // Initialisation des contrôleurs de vidéo avec Uri.parse
    videoControllers = videoUrls.map((url) {
      return VideoPlayerController.asset(url)
        ..initialize().then((_) {
          setState(() {}); // Met à jour l'interface une fois la vidéo chargée
        }).catchError((error) {
          print("Erreur de chargement de la vidéo : $error");
        });
    }).toList();

    // Jouer automatiquement la première vidéo après son initialisation
    if (videoControllers.isNotEmpty) {
      videoControllers[0].addListener(() {
        if (mounted) setState(() {});
      });
      videoControllers[0].initialize().then((_) {
        videoControllers[0].play();
        setState(() {});
      }).catchError((error) {
        print("Erreur de lecture de la première vidéo : $error");
      });
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    for (var controller in videoControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void onPageChanged(int index) {
    setState(() {
      currentPage = index;
    });

    // Pause la vidéo précédente
    for (int i = 0; i < videoControllers.length; i++) {
      if (i == index) {
        videoControllers[i].play();
      } else {
        videoControllers[i].pause();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        controller: pageController,
        scrollDirection: Axis.vertical,
        onPageChanged: onPageChanged,
        itemCount: videoUrls.length,
        itemBuilder: (context, index) {
          final videoController = videoControllers[index];
          return Stack(
            children: [
              // Vidéo en plein écran
              videoController.value.isInitialized
                  ? GestureDetector(
                      onDoubleTap: () {
                        // Logique pour aimer la vidéo (par exemple, envoyer un événement à un backend ou changer l'état local)
                        print("Double tap on video $index");
                      },
                      onTap: () {
                        // Lecture/Pause
                        if (videoController.value.isPlaying) {
                          videoController.pause();
                        } else {
                          videoController.play();
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: FittedBox(
                          fit: videoController.value.aspectRatio > 1
                              ? BoxFit.contain // Format paysage
                              : BoxFit.cover, // Format portrait (reel)
                          child: SizedBox(
                            width: videoController.value.size.width,
                            height: videoController.value.size.height,
                            child: VideoPlayer(videoController),
                          ),
                        ),
                      ),
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    ),

              // Informations sur la vidéo
              Positioned(
                bottom: 20,
                left: 10,
                right: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Video $index",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.favorite, color: Colors.red, size: 30),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
