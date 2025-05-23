import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:socialy/screens/widgets/gradientButton.dart';
import 'package:socialy/screens/widgets/profileStat.dart';
import 'package:socialy/screens/widgets/tabControllerscreen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Liste d'images
  final List<String> imageUrls = [
    "https://images.unsplash.com/photo-1642802767829-bea7b5a6c15f?q=80&w=436&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://plus.unsplash.com/premium_photo-1694425773163-d8d730608767?q=80&w=404&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1642802767829-bea7b5a6c15f?q=80&w=436&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Container(
        child: Stack(
          // alignment: Alignment.bottomCenter,
          // clipBehavior: Clip.none,
          children: [
            Stack(children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.red[50],
                  image: const DecorationImage(
                    image: NetworkImage(
                        "https://images.unsplash.com/photo-1642802767829-bea7b5a6c15f?q=80&w=436&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"), // Remplace par ton URL
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ]),

            // Gradient au bas de l'écran
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    color: Colors.white),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 14.h,
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
                        height: 8.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.0.w),
                        child: ProfileStatsWidget(),
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
                                  style:
                                      TextStyle(fontWeight: FontWeight.w600)),
                              TextSpan(
                                  text: '@airbnb',
                                  style: TextStyle(
                                      color: Colors.redAccent,
                                      fontWeight: FontWeight.w600)),
                              TextSpan(
                                  text:
                                      ' with a love for exploring the great outdoors. Creating beautiful interfaces and seamless user experiences is my jam! ',
                                  style:
                                      TextStyle(fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      TabcontrollerScreen(),
                      Container(
                        height: 200,
                        child: SizedBox(
                          height: 100,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: imageUrls.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: CircleAvatar(
                                  radius: 40, // Rayon des images
                                  backgroundImage:
                                      NetworkImage(imageUrls[index]),
                                  backgroundColor: Colors
                                      .grey[200], // Couleur de fond par défaut
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Align(
            //   alignment: Alignment.bottomCenter,
            //   child: Container(
            //     padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.w),
            //     decoration: BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadius.all(Radius.circular(24)),
            //       boxShadow: [
            //         BoxShadow(
            //           color: Colors.black26,
            //           blurRadius: 10,
            //         ),
            //       ],
            //     ),
            //     child: Column(
            //       mainAxisSize: MainAxisSize.min,
            //       children: [
            //         SizedBox(height: 16.h),
            //         // Texte de bienvenue
            //         Text(
            //           'Bienvenue',
            //           style: TextStyle(
            //             fontSize: 24.sp,
            //             fontWeight: FontWeight.bold,
            //           ),
            //         ),
            //         SizedBox(height: 8.h),
            //         Text(
            //           'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
            //           'Ut et massa mi. Aliquam in hendrerit urna.',
            //           textAlign: TextAlign.center,
            //           style: TextStyle(fontSize: 16.sp, color: Colors.grey),
            //         ),
            //         SizedBox(height: 24.h),
            //         // Boutons
            //         Container(
            //           padding: EdgeInsets.symmetric(horizontal: 18.w),
            //           child: Column(
            //             crossAxisAlignment: CrossAxisAlignment
            //                 .stretch, // Assure que les boutons s'étendent sur toute la largeur
            //             children: [
            //               // Bouton "Créer un compte"
            //               OutlinedButton(
            //                 onPressed: () {
            //                   // Action pour "Créer un compte"
            //                 },
            //                 style: OutlinedButton.styleFrom(
            //                   padding: EdgeInsets.symmetric(
            //                       vertical: 10.w), // Uniforme et centré
            //                   side: BorderSide(
            //                       color: Colors.teal), // Couleur de la bordure
            //                   shape: RoundedRectangleBorder(
            //                     borderRadius:
            //                         BorderRadius.circular(32.r), // Coins arrondis
            //                   ),
            //                 ),
            //                 child: Text(
            //                   'Créer un compte',
            //                   style: GoogleFonts.poppins(
            //                     textStyle: TextStyle(
            //                       fontSize: 20.sp, // Ajustement de taille
            //                       color: Color(0xFF014D5D), // Couleur du texte
            //                       letterSpacing: .5,
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //               SizedBox(
            //                   height: 16.h), // Espacement entre les deux boutons
            //               // Bouton "Se connecter"
            //               ElevatedButton(
            //                 onPressed: () {
            //                   // Action pour "Se connecter"
            //                 },
            //                 style: ElevatedButton.styleFrom(
            //                   padding: EdgeInsets.symmetric(
            //                       vertical: 10.w), // Uniforme et centré
            //                   backgroundColor:
            //                       Color(0xFF014D5D), // Couleur de fond
            //                   shape: RoundedRectangleBorder(
            //                     borderRadius:
            //                         BorderRadius.circular(32), // Coins arrondis
            //                   ),
            //                 ),
            //                 child: Text(
            //                   'Se connecter',
            //                   style: GoogleFonts.poppins(
            //                     textStyle: TextStyle(
            //                       fontSize: 20.sp, // Ajustement de taille
            //                       color: Colors.white, // Couleur du texte
            //                       letterSpacing: .5,
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
      // Informations utilisateur
    );
  }
}
