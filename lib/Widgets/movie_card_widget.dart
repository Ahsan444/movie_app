import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashMovieCardWidget extends StatelessWidget {
  final bool showGridCard;
  final String? movieTitle;
  final String? imageUrl;
  const DashMovieCardWidget({
    this.showGridCard = true,
    this.movieTitle,
    this.imageUrl,
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: showGridCard ?  size.height * 0.22 :size.height * 0.2,
      width: showGridCard ? null : size.width * 0.45,
      decoration: BoxDecoration(
        color: Colors.grey.shade500,
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: NetworkImage(imageUrl??''),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top:showGridCard ?  size.height * 0.08 :size.height * 0.12,
            left: 16,
            child: Text(
              movieTitle??'Movie name',
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
