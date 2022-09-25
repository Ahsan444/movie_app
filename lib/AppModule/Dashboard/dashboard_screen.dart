import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/AppModule/Dashboard/Provider/movie_provider.dart';
import 'package:movie_app/AppModule/Dashboard/Widgets/search_widget.dart';
import 'package:movie_app/Services/movie_service.dart';
import 'package:movie_app/Services/search_movies_service.dart';
import 'package:movie_app/Widgets/movie_card_widget.dart';
import 'package:provider/provider.dart';
import '../../Constants/constants.dart';
import '../../Widgets/textfield_widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late Future userData;
  late Future searchMovieData;

  @override
  void initState() {
    userData = MovieService().getUpcomingMovies(context);
    searchMovieData = SearchMovieService().getSearchResults(context,'thor');
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
                          textEditingController: val.textController,
                          onPressed: () {
                            FocusManager.instance.primaryFocus?.unfocus();
                            val.textController.clear();
                            val.showTextField(true);
                            Navigator.of(context);
                          },
                          onSubmitted: (value) {
                            val.showTextField(false);
                            searchMovieData =
                                SearchMovieService().getSearchResults(context, val.textController.text);
                            debugPrint('-------> Data: ${val.textController.text}');
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
                      provider.isShowTextField ? const SizedBox.shrink()  : Text('Top Results',
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          )),
                      provider.isShowTextField ? const SizedBox.shrink() : const Divider(
                        color: Constants.COLOR3,
                        thickness: 1,
                      ),
                      SizedBox(height: size.height * 0.01),

                     provider.isShowTextField ? FutureBuilder(
                        future: userData,
                        builder: (_, AsyncSnapshot snapshot) {
                          if (snapshot.connectionState !=
                              ConnectionState.done) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (snapshot.hasData) {
                            return Consumer<MovieProvider>(
                              builder: (_, provider, __) {
                                return Expanded(
                                  child: ListView.builder(
                                    itemCount: provider
                                        .getUpComingModel.results?.length,
                                    shrinkWrap: true,
                                    physics: const BouncingScrollPhysics(),
                                    itemBuilder: (_, int index) {
                                      return Padding(
                                        padding: EdgeInsets.only(bottom: size.height * 0.025),
                                        child: DashMovieCardWidget(
                                          size: MediaQuery.of(context).size,
                                          movieTitle:
                                              '${provider.upComingMovie![index].title}',
                                          imageUrl:
                                              'https://image.tmdb.org/t/p/w500${provider.upComingMovie![index].posterPath}',
                                          showGridCard: false,
                                        ),
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
                      ) : FutureBuilder(
                       future: searchMovieData,
                       builder: (_, AsyncSnapshot snapshot) {
                         if (snapshot.connectionState !=
                             ConnectionState.done) {
                           return const Center(
                             child: CircularProgressIndicator(),
                           );
                         } else if (snapshot.hasData) {
                           return Consumer<MovieProvider>(
                             builder: (_, provider, __) {
                               return Expanded(
                                 child: ListView.builder(
                                   itemCount: provider
                                       .searchMovieResult?.length,
                                   shrinkWrap: true,
                                   physics: const BouncingScrollPhysics(),
                                   itemBuilder: (_, int index) {
                                     return Padding(
                                       padding: EdgeInsets.only(bottom: size.height * 0.025),
                                       child: SearchResultWidget(
                                         title: provider.searchMovieResult == null ? 'Movie title':'${provider.searchMovieResult![index].title}',
                                         subtitle: provider.searchMovieResult == null ? 'movie subtitle':'${provider.searchMovieResult![index].releaseDate}',
                                         // imageUrl: provider.searchMovieResult == null ? 'posterPath' : 'https://image.tmdb.org/t/p/w500${provider.searchMovieResult![index].posterPath}',
                                       ),
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
