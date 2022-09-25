import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/AppModule/MediaLib/pay_screen.dart';
import 'package:movie_app/Constants/constants.dart';


class TicketScreen extends StatelessWidget {
  const TicketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TicketAppbar(size: size),
            SizedBox(height: size.height * 0.15),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'Date',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.04,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      height: size.height * 0.03,
                      width: size.width * 0.2,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: index == 0
                            ? Constants.COLOR4
                            : Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          index == 0
                              ? BoxShadow(
                                  color: Constants.COLOR4.withOpacity(0.3),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: const Offset(0, 1),
                                )
                              : const BoxShadow(
                                  color: Colors.transparent,
                                ),
                        ],
                      ),
                      child: Text(
                        '5 Mar',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: index == 0 ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: size.height * 0.05),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Text(
                        '12:30',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: size.width * 0.03),
                      Text(
                        'Cinetech + Hall 1',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 0),
                  child: Container(
                    height: size.height * 0.2,
                    width: size.width * 0.6,
                    decoration: BoxDecoration(
                      border: Border.all(color: Constants.COLOR4),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        Image.asset(Constants.MOBILE_MAP,height: size.height * 0.16,),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                Padding(padding: const EdgeInsets.only(left: 15, top: 0),
                child: Row(
                  children: [
                    Text(
                      'From',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(width: size.width * 0.01),
                    Text(
                      '50\$',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: size.width * 0.01),
                    Text(
                      'or',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(width: size.width * 0.01),
                    Text(
                      '2500 bonus',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),

                  ],
                ),),
                SizedBox(height: size.height * 0.15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    width: size.height * 0.5,
                    decoration:const BoxDecoration(
                      color:  Constants.COLOR4,
                      borderRadius:  BorderRadius.all(Radius.circular(10)),
                    ),
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(context, CupertinoPageRoute(builder: (_) => const PayScreen()),);
                      },
                      child:  Text(
                        "Select Seats",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class TicketAppbar extends StatelessWidget {
  const TicketAppbar({
    Key? key,
    this.title,
    required this.size,
  }) : super(key: key);

  final Size size;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.15,
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
           Padding(
            padding:const EdgeInsets.only(bottom: 20),
            child: InkWell(
              onTap: ()=> Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'The King\'s Man',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: size.height * 0.01),
              Text(
                title??'In Theaters December 22,2022',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Constants.COLOR4,
                ),
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
