import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 22.41,
            ),
            _greetings(),
            const SizedBox(
              height: 17,
            ),
            AspectRatio(
              aspectRatio: 336 / 184,
              child: Container(
                clipBehavior: Clip.hardEdge,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: const Color(0xFF818AF9),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/background_card.png',
                      height: double.maxFinite,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'Your',
                              style: GoogleFonts.manrope(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFFDEE1FE),
                                  height: 150 / 100),
                              children: [
                                TextSpan(
                                  text: ' Catrine ',
                                  style: GoogleFonts.manrope(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white,
                                      height: 150 / 100),
                                ),
                                TextSpan(
                                  text: 'will get\nvaccination',
                                  style: GoogleFonts.manrope(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFFDEE1FE),
                                      height: 150 / 100),
                                ),
                                TextSpan(
                                  text: ' tomorrow\nat 07.00 am!',
                                  style: GoogleFonts.manrope(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white,
                                      height: 150 / 100),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            width: 85,
                            height: 36,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.4),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.12),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                                child: Text(
                              'See details',
                              style: GoogleFonts.manrope(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            )),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding _greetings() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Hello, Human!',
            style: GoogleFonts.manrope(
                color: const Color(0xFF3F3E3F),
                fontSize: 24,
                fontWeight: FontWeight.w800,
                height: 150 / 100),
          ),
          Stack(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  FeatherIcons.shoppingBag,
                  color: Color(0xFF818AF9),
                ),
              ),
              Positioned(
                right: 9,
                top: 9,
                child: Container(
                  height: 13,
                  width: 13,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEF6497),
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Center(
                      child: Text(
                    '2',
                    style: GoogleFonts.mPlus1p(
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  )),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
