import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socialy/screens/widgets/gradientButton.dart';
import 'package:socialy/screens/widgets/gradientButtonLow.dart';
import 'package:video_player/video_player.dart';

class Reelscreen extends StatefulWidget {
  const Reelscreen({super.key});

  @override
  State<Reelscreen> createState() => _ReelscreenState();
}

class _ReelscreenState extends State<Reelscreen> {
  final profilImage =
      "https://images.unsplash.com/photo-1657140649222-dc72c23bd1f3?q=80&w=435&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";
  final name = "benico.J";
  final List<String> videoUrls = [
    "assets/videos/vid1.mp4",
    "assets/videos/vid2.mp4",
    "assets/videos/vid3.mp4",
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
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, // Change this to your desired color
        ),
        title: Text(
          "Video",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        actions: [
          CircleAvatar(
            backgroundColor: Colors.transparent,
            child: Icon(Icons.search_rounded, color: Colors.white, size: 30),
          )
        ],
      ),
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
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

              /*

              Positioned(
                top: 10,
                left: 10,
                right: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: Colors.white,
                    ),
                    Text(
                      "Video",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),


*/
              Positioned(
                top: MediaQuery.of(context).size.height * 0.4,
                right: 16,
                child: Column(
                  children: [
                    Column(
                      children: [
                        IconButton(
                          icon: Icon(Icons.favorite,
                              weight: 20.0, color: Colors.white),
                          onPressed: () {},
                        ),
                        Text(
                          "1.7k",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          icon: Icon(Icons.message,
                              weight: 20.0, color: Colors.white),
                          onPressed: () {},
                        ),
                        Text(
                          "1.7k",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          icon: Icon(Icons.send,
                              weight: 20.0, color: Colors.white),
                          onPressed: () {},
                        ),
                        Text(
                          "1.7k",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          icon: Icon(Icons.bookmark_sharp,
                              weight: 20.0, color: Colors.white),
                          onPressed: () {},
                        ),
                        Text(
                          "1.7k",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Informations sur la vidéo
              Positioned(
                bottom: 20,
                left: 10,
                right: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(profilImage),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            name,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Gradientbuttonlow(onPressed: () {})
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        " with a love for exploring the great outdoors. Creating beautiful interfaces and seamless user experiences is my jam!",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 18,
                            backgroundColor: Colors.white38,
                            child: Icon(
                              Icons.music_note_outlined,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            name,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
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
