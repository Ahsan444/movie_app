import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/AppModule/Dashboard/Provider/movie_provider.dart';
import 'package:movie_app/AppModule/Watch/Provider/watch_provider.dart';
import 'package:movie_app/Services/watch_movie_service.dart';
import 'package:provider/provider.dart';
import '../../Constants/constants.dart';
import '../../Widgets/movie_card_widget.dart';
import '../../Widgets/textfield_widget.dart';

class WatchScreen extends StatefulWidget {
  const WatchScreen({Key? key}) : super(key: key);

  @override
  State<WatchScreen> createState() => _WatchScreenState();
}

class _WatchScreenState extends State<WatchScreen> {
  late Future categoryData;

  @override
  void initState() {
    categoryData = WatchMovieService().getCategory(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer<MovieProvider>(builder: (context, provider, __) {
      return GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
          provider.isShowTextField = true;
        },
        child: Scaffold(
            body: SafeArea(
          child: Column(
            children: [
              SizedBox(height: size.height * 0.01),
              //search Icon
              provider.isShowTextField
                  ? Consumer<MovieProvider>(builder: (_, val, __) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Watch',
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                )),
                            IconButton(
                                onPressed: () {
                                  val.showTextField(false);
                                },
                                icon: const Icon(
                                  Icons.search_sharp,
                                  color: Colors.black,
                                )),
                          ],
                        ),
                      );
                    })
                  : Consumer<MovieProvider>(builder: (context, val, __) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFieldWidget(
                          size: size,
                          onPressed: () {
                            FocusManager.instance.primaryFocus?.unfocus();
                            val.isShowTextField = true;
                          },
                        ),
                      );
                    }),
              SizedBox(height: size.height * 0.01),

              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  color: Constants.COLOR5.withOpacity(0.3),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //  DashMovieCardWidget(size: size,showGridCard: true,),
                      SizedBox(height: size.height * 0.01),

                      SizedBox(height: size.height * 0.01),
                      /*ListTile(
                          leading: Container(
                            height: size.height * 0.3,
                            width: size.width * 0.35,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          title: Text('Movie Title',
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              )),
                          subtitle: Text('Movie subtitle',
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
                        ),*/
                      FutureBuilder(
                        future: categoryData,
                        builder: (_, AsyncSnapshot snapshot) {
                          if (snapshot.connectionState !=
                              ConnectionState.done) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (snapshot.hasData) {
                            return Consumer<WatchMovieProvider>(
                              builder: (_, provider1, __) {
                                return Expanded(
                                  child: GridView.builder(

                                    gridDelegate:
                                        const SliverGridDelegateWithMaxCrossAxisExtent(
                                            maxCrossAxisExtent: 200,
                                            childAspectRatio: 3 / 2,
                                            crossAxisSpacing: 10,
                                            mainAxisSpacing: 10),
                                    itemCount: provider1.watchMovieName?.length,
                                    itemBuilder: (BuildContext ctx, int index) {
                                      return DashMovieCardWidget(
                                        size: size,
                                        showGridCard: true,
                                        movieTitle: provider1.watchMovieName?[index].name,
                                        imageUrl: 'https://image.tmdb.org/t/p/w500${provider.upComingMovie![index].posterPath}',
                                      );
                                    },
                                  ),
                                );
                              },
                            );
                          } else if (snapshot.hasError) {
                            return Text('${snapshot.error}');
                          } else {
                            return const SizedBox.shrink();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )),
      );
    });
  }
}
