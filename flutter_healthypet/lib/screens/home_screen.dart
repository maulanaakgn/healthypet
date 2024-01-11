import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_healthypet/model/doctor_model.dart';
import 'package:flutter_healthypet/model/service_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

var menus = [
  FeatherIcons.home,
  FeatherIcons.heart,
  FeatherIcons.messageCircle,
  FeatherIcons.user,
];

var selectedService = 0;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 76,
        child: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF9C81F9),
        unselectedItemColor: const Color(0xFFBFBFBF),
        showSelectedLabels: false,
        items: menus
            .map(
              (e) => BottomNavigationBarItem(
                icon: Icon(e),
                label: e.toString(),
              ),
            )
            .toList(),
          ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 22.41,
              ),
              _greetings(),
              const SizedBox(
                height: 17,
              ),
              _card(),
              const SizedBox(
                height: 21,
              ),
              _search(),
              const SizedBox(
                height: 20,
              ),
              _services(),
              const SizedBox(
                height: 27.59,
              ),
              _doctors(),
              //_bottomnav()
            ],
          ),
        ),
      ),
    );
  }

  ListView _doctors() {
    return ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) => _doctor(doctors[index]),
        separatorBuilder: (context, index) => const SizedBox(
              height: 11,
            ),
        itemCount: doctors.length);
  }

  Container _doctor(DoctorModel doctorModel) {
    return Container(
      height: 143,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF35385A).withOpacity(0.12),
            blurRadius: 30,
            offset: const Offset(0, 2),
          ),
        ],
        color: Colors.white,
      ),
      child: Row(
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.asset(
              'assets/images/${doctorModel.image}',
              width: 88,
              height: 103,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctorModel.name,
                  style: GoogleFonts.manrope(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF3F3E3F),
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                RichText(
                  text: TextSpan(
                    text: "Service: ${doctorModel.service.join(', ')}",
                    style: GoogleFonts.manrope(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    const Icon(
                      FeatherIcons.mapPin,
                      size: 14,
                      color: Color(0xFFACA3A3),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Text(
                      "${doctorModel.distance}km",
                      style: GoogleFonts.manrope(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFFACA3A3),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 7,
                ),
                Row(
                  children: [
                    Text(
                      "Available for",
                      style: GoogleFonts.manrope(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF50CC98),
                      ),
                    ),
                    const Spacer(),
                    SvgPicture.asset(
                      'assets/svgs/cat.svg',
                      width: 8.74,
                      height: 10,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SvgPicture.asset(
                      'assets/svgs/dog.svg',
                      width: 8.74,
                      height: 10,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SizedBox _services() {
    return SizedBox(
      height: 36,
      child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: selectedService == index
                      ? const Color(0xFF818AF9)
                      : const Color(0xFFF6F6F6),
                  border: selectedService == index
                      ? Border.all(
                          color: const Color(0xFFF1E5E5).withOpacity(0.22))
                      : null,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  ServiceModel.allServices()[index],
                  style: GoogleFonts.manrope(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: selectedService == index
                        ? Colors.white
                        : const Color(0xFF3F3E3F).withOpacity(0.3),
                  ),
                ),
              ),
          separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
          itemCount: ServiceModel.allServices().length),
    );
  }

  Container _search() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F6F6),
        borderRadius: BorderRadius.circular(14),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: const Icon(
            FeatherIcons.search,
            color: Color(0xFFADACAD),
          ),
          hintText: ('Find best vaccinate, treatment...'),
          hintStyle: GoogleFonts.manrope(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            height: 150 / 100,
            color: const Color(0xFFCACACA),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

  AspectRatio _card() {
    return AspectRatio(
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
