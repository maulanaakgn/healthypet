import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_healthypet/screens/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  Future.delayed(const Duration(seconds: 3)).then((value) => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomeScreen())));

    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
              child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 42,
                ),
                Image.asset(
                  'assets/images/logo.png',
                  width: 144,
                  height: 22,
                ),
                const SizedBox(
                  height: 73,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Helping you\nto keep',
                    style: GoogleFonts.manrope(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFFDEE1FE),
                        letterSpacing: 0.84,
                        height: 152 / 100),
                    children: [
                      TextSpan(
                        text: ' your bestie',
                        style: GoogleFonts.manrope(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                            letterSpacing: 0.84,
                            height: 152 / 100),
                      ),
                      TextSpan(
                        text: '\nstay healthy!',
                        style: GoogleFonts.manrope(
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFFDEE1FE),
                            letterSpacing: 0.84,
                            height: 152 / 100),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
