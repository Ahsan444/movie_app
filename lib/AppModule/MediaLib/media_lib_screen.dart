import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/AppModule/MediaLib/Widgets/buttonWidget.dart';
import 'package:movie_app/AppModule/MediaLib/Widgets/chipWidget.dart';
import 'package:movie_app/AppModule/MediaLib/ticket_screen.dart';
import 'package:movie_app/Constants/constants.dart';

class MediaLibScreen extends StatelessWidget {
  const MediaLibScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: size.height * 0.55,
              decoration: const BoxDecoration(
                color: Colors.grey,
                image: DecorationImage(
                  image: NetworkImage(
                      'https://assets1.ignimgs.com/2019/09/30/the-kings-man-new-button-1569854451869.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        SizedBox(
                          height: size.height * 0.15,
                        ),
                        const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                        SizedBox(width: size.width * 0.05),
                        Text(
                          'Watch',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.15,
                  ),
                  Text(
                    'In Theaters December 22,2022',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: size.height * 0.015),
                  //start button
                  buttonWidget(size, true,onTap: (){
                    Navigator.push(context, CupertinoPageRoute(builder: (_) => const TicketScreen()));
                  }),
                  SizedBox(height: size.height * 0.015),
                  buttonWidget(size, false),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height * 0.015),
                  Text(
                    'Geners',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      chipWidget(
                        'Action',
                      ),
                      chipWidget('Thriller', color: Constants.COLOR7),
                      chipWidget('Science', color: Constants.COLOR8),
                      chipWidget('Fiction', color: Constants.COLOR9),
                      SizedBox(
                        width: size.width * 0.15,
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.01),
                  Text(
                    'Overview',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),
                  Text(
                    'As a collection of history\'s worst tyrants and\ncriminal masterminds gather to plot a war to\nwipe out millions, one man must race against\ntime to stop them. Discover the origins of the\nvery first independent intelligence agency in The\nKing\'s Man. The Comic Book “The Secret Service”\nby Mark Millar and Dave Gibbons.',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.black.withOpacity(0.5),
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

