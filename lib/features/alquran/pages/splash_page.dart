import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(
              "Quran App",
              style: GoogleFonts.poppins(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Color(0xffF9B091),
              ),
              
            
            ),
            const SizedBox(
              height: 16.0,
            ),
             Text(
              "Learn Quran and Recite once everyday",
              style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff8789A3)),
            ),
            const SizedBox(
              height: 49.0,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  "assets/images/quranapp/quranApp.png",
                  height: 450,
                  width: 314,
                ),
                Positioned(
                  bottom: 16,
                  child: Container(
                    width: 185,
                    height: 60,
                    decoration: BoxDecoration(
                      color: const Color(0xffF9B091),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child:  Center(
                      child: Text(
                        "Get Started",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
