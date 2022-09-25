import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/AppModule/MediaLib/ticket_screen.dart';

import '../../Constants/constants.dart';

class PayScreen extends StatelessWidget {
  const PayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            TicketAppbar(size: size,title: 'OCT 5,2022 : 12:30 Hall 1',),
            SizedBox(height: size.height * 0.11),
            Image.asset(Constants.MOBILE_MAP,width: size.width,),
            SizedBox(height: size.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: size.height * 0.05,
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Constants.COLOR2,
                    boxShadow: [
                      BoxShadow(
                        color: Constants.COLOR3.withOpacity(0.3),
                        blurRadius: 1,
                        offset: const  Offset(0, 1),
                      ),
                    ],
                  ),
                  child: const Icon(Icons.add,color: Colors.black ,),
                ),
                const SizedBox(width: 10,),
                Container(
                  height: size.height * 0.05,
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Constants.COLOR2,
                    boxShadow: [
                      BoxShadow(
                        color: Constants.COLOR3.withOpacity(0.3),
                        blurRadius: 1,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: const Icon(Icons.remove,color: Colors.black ,),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Divider(
                color: Constants.COLOR3.withOpacity(0.5),
                thickness: 5,
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 2,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: size.height * 0.01),
                    Row(
                      children: [
                        Image.asset(Constants.SEAT_ICON,width: size.width * 0.07,
                        color: Constants.COLOR9,),
                        SizedBox(width: size.width * 0.02,),
                        Text('Selected',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Constants.COLOR3,

                        ),),
                        SizedBox(width: size.width * 0.25,),
                        Image.asset(Constants.SEAT_ICON,width: size.width * 0.07,
                          color: Constants.COLOR3,),
                        SizedBox(width: size.width * 0.02,),
                        Text('Not available',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Constants.COLOR3,

                          ),),
                      ],
                    ),
                    SizedBox(height: size.height * 0.02),
                    Row(
                      children: [
                        Image.asset(Constants.SEAT_ICON,width: size.width * 0.07,
                          color: Constants.COLOR8,),
                        SizedBox(width: size.width * 0.02,),
                        Text('VIP(150\$)',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Constants.COLOR3,

                          ),),
                        SizedBox(width: size.width * 0.25,),
                        Image.asset(Constants.SEAT_ICON,width: size.width * 0.07,
                          color: Constants.COLOR4,),
                        SizedBox(width: size.width * 0.02,),
                        Text('Regular(50\$)',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Constants.COLOR3,

                          ),),
                      ],
                    ),
                    SizedBox(height: size.height * 0.02),
                    Container(
                      width: size.width * 0.23,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: Constants.COLOR3.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('4/3row ',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,

                          ),),
                         const Icon(Icons.clear,color:Colors.black,size: 15,),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        priceButton1(size),
                        payButton(size),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}

Widget payButton(var size){
  return Container(
    width: size.height * 0.25,
    decoration:const BoxDecoration(
      color:  Constants.COLOR4,
      borderRadius:  BorderRadius.all(Radius.circular(10)),
    ),
    alignment: Alignment.center,
    child: TextButton(
      onPressed: () {
        //  Navigator.push(context, CupertinoPageRoute(builder: (_) => const PayScreen()),);
      },
      child:  Text(
        "Proceed to pay",
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    ),
  );
}
Widget priceButton1( var size){
  return  Container(
    width: size.width * 0.3,
    padding: const EdgeInsets.symmetric(vertical: 5),
    decoration: BoxDecoration(
      color: Constants.COLOR3.withOpacity(0.2),
      borderRadius: BorderRadius.circular(10),
    ),
    alignment: Alignment.center,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text('Total Price',
          style: GoogleFonts.poppins(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black,

          ),),
        Text('\$50',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,

          ),),

      ],
    ),
  );
}
