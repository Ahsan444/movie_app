
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Constants/constants.dart';

Widget buttonWidget(var size, var show, {VoidCallback? onTap,String? title}) {
  return Container(
    width: size.height * 0.3,
    decoration: BoxDecoration(
      color: show ? Constants.COLOR4 : Colors.transparent,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      border: show
          ? const Border()
          : const Border(
        top: BorderSide(width: 1.0, color: Constants.COLOR4),
        left: BorderSide(width: 1.0, color: Constants.COLOR4),
        right: BorderSide(width: 1.0, color: Constants.COLOR4),
        bottom: BorderSide(width: 1.0, color: Constants.COLOR4),
      ),
    ),
    alignment: Alignment.center,
    child: TextButton(
      child: show
          ? Text(
        title??"Get Tickets",
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      )
          : Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.play_arrow,
            color: Constants.COLOR2,
          ),
          SizedBox(width: size.width * 0.01),
          Text(
            "Watch Trailer",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Constants.COLOR2,
            ),
          ),
        ],
      ),
      onPressed:onTap?? () {

        debugPrint('Get Tickets');
      },
    ),
  );
}