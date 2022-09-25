import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Constants/constants.dart';

class SearchResultWidget extends StatelessWidget {
  final String? title;
  final String? imageUrl;
  final String? subtitle;
  const SearchResultWidget({Key? key,this.title,this.imageUrl,this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ListTile(
      leading: Container(
        height: size.height * 0.3,
        width: size.width * 0.35,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: NetworkImage(imageUrl??''),
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Text(title??'Movie Title',
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          )),
      subtitle: Text(subtitle??'Movie subtitle',
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Constants.COLOR3,
            ),
          )),
      trailing: const Icon(
        Icons.more_vert,
        color: Constants.COLOR6,
      ),
    );
  }
}
