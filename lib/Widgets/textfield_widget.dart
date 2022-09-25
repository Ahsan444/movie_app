import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Constants/constants.dart';

class TextFieldWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final void Function(String)? onSubmitted;
  final TextEditingController? textEditingController;
  const TextFieldWidget({
    Key? key,
    this.onPressed,
    this.onSubmitted ,
    required this.size,
    this.textEditingController,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.07,
      decoration: BoxDecoration(
        color: Constants.COLOR5.withOpacity(0.7),
        borderRadius: BorderRadius.circular(30),
      ),
      alignment: Alignment.center,
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search_sharp,
            color: Colors.black,
            size: size.height * 0.025,
          ),
          suffix: Padding(
            padding: const EdgeInsets.only(right: 20.0,),
            child: IconButton(
              icon: Icon(
                Icons.close_sharp,
                color: Constants.COLOR1,
                size: size.height * 0.03,
              ),
              tooltip: 'Clear',
              onPressed:onPressed?? () => debugPrint('--------> clear'),
            ),
          ),
          hintText: 'TV shows,movies and more',
          hintStyle: GoogleFonts.poppins(
            textStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Constants.COLOR3,
            ),
          ),
        ),
        onSubmitted: onSubmitted?? (value) => debugPrint('--------> $value'),
      ),
    );
  }
}