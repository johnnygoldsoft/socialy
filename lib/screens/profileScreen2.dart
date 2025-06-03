import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:socialy/screens/widgets/gradientButton.dart';
import 'package:socialy/screens/widgets/profileStat.dart';
import 'package:socialy/screens/widgets/tabControllerscreen.dart';

class Profilescreen2 extends StatefulWidget {
  const Profilescreen2({super.key});

  @override
  State<Profilescreen2> createState() => _Profilescreen2State();
}

class _Profilescreen2State extends State<Profilescreen2> {
  final List<String> imageUrls = [
    "https://images.unsplash.com/photo-1642802767829-bea7b5a6c15f?q=80&w=436&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://plus.unsplash.com/premium_photo-1694425773163-d8d730608767?q=80&w=404&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1642802767829-bea7b5a6c15f?q=80&w=436&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://plus.unsplash.com/premium_photo-1694425773163-d8d730608767?q=80&w=404&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1642802767829-bea7b5a6c15f?q=80&w=436&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // SliverAppBar avec image
          SliverAppBar(
              expandedHeight: MediaQuery.of(context).size.height * 0.46,
              floating: false,
              pinned: true,
              flexibleSpace:

                  // FlexibleSpaceBar(
                  //   background: Image.network(
                  //     "https://images.unsplash.com/photo-1642802767829-bea7b5a6c15f?q=80&w=436&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                  //     fit: BoxFit.cover,
                  //   ),
                  // ),

                  Stack(
                children: [
                  Positioned.fill(
                    left: 0,
                    right: 0,
                    child: FadeInImage(
                      image: NetworkImage(
                        "https://images.unsplash.com/photo-1642802767829-bea7b5a6c15f?q=80&w=436&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                      ),
                      // imageErrorBuilder: (context, error, stackTrace) {
                      //   return Image.asset('assets/images/background.jpg',
                      //       fit: BoxFit.cover);
                      // },
                      fit: BoxFit.cover,
                      placeholder: NetworkImage(
                        "https://images.unsplash.com/photo-1642802767829-bea7b5a6c15f?q=80&w=436&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                      ),
                    ),
                  ),
                  Positioned(
                    child: Container(
                      height: 22.h,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(40),
                        ),
                      ),
                    ),
                    bottom: -7,
                    left: 0,
                    right: 0,
                  )
                ],
              )),

          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            return Container(
                child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 8.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.0.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Mary Snyder',
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: 20.sp, // Ajustement de taille
                                    color: Colors.black87,
                                    fontWeight:
                                        FontWeight.w600, // Couleur du texte
                                    letterSpacing: -1,
                                  ),
                                ),
                              ),
                              Text(
                                '@marysnyder_',
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: 14.sp, // Ajustement de taille
                                    color: Colors.black54, // Couleur du texte
                                  ),
                                ),
                              ),
                            ],
                          ),
                          GradientButton(onPressed: () {})
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                      child: Expanded(child: ProfileStatsWidget()),
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.0.w),
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 8.w),
                          padding: EdgeInsets.all(10),
                          color: Colors.grey.withOpacity(0.2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Linkedin.com/jeanclaudesassou',
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14.sp, // Ajustement de taille
                                    color: Colors.black45, // Couleur du texte
                                    letterSpacing: -1,
                                  ),
                                ),
                              ),
                              Icon(Icons.arrow_right)
                            ],
                          ),
                        )),
                    Padding(
                      padding: EdgeInsets.all(14.w),
                      child: RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Product designer at ',
                                style: TextStyle(fontWeight: FontWeight.w600)),
                            TextSpan(
                                text: '@airbnb',
                                style: TextStyle(
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.w600)),
                            TextSpan(
                                text:
                                    ' with a love for exploring the great outdoors. Creating beautiful interfaces and seamless user experiences is my jam! ',
                                style: TextStyle(fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    TabcontrollerScreen(),
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: imageUrls.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0), // Ajout d'un espacement
                            child: Container(
                              margin: EdgeInsets.only(top: 18.w),
                              height: 200,
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    20), // Arrondi des coins
                                image: DecorationImage(
                                  image: NetworkImage(imageUrls[index]),
                                  fit: BoxFit
                                      .cover, // Ajuste l'image pour remplir le container
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26, // Couleur de l'ombre
                                    blurRadius: 10, // Flou de l'ombre
                                    offset: Offset(0, 5), // Décalage de l'ombre
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ));
          }, childCount: 1))
        ],
      ),
    );
  }
}
