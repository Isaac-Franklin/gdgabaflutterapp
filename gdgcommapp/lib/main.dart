import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gdgcommapp/chatFeature/bloc/chat_feature_bloc.dart';
import 'package:gdgcommapp/chatFeature/chatscene.dart';
import 'package:gdgcommapp/communities/all_nav_section.dart';
import 'package:gdgcommapp/communities/bloc/all_nav_bloc_bloc.dart';
import 'package:gdgcommapp/communities/navitems.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AllNavBlocBloc(),
        ),
        BlocProvider(
          create: (context) => ChatFeatureBloc(
            GenerativeModel(
                apiKey: 'AIzaSyCkIwgMVXnmY6WgJrK_bxmaDOK3ev-OG3c',
                model: 'gemini-pro'),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocBuilder<AllNavBlocBloc, AllNavBlocState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Container(
                padding: const EdgeInsets.all(10),
                child: const Row(
                  children: [
                    Image(
                      width: 50,
                      image: AssetImage(
                        'assets/logo/gdglogopng.png',
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(
                        'Community Update Forum',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(100),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            child: TextFormField(
                              decoration: InputDecoration(
                                focusColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                // disabledBorder: OutlineInputBorder,
                                contentPadding: const EdgeInsets.all(10),
                                fillColor: Colors.black,
                                border: const OutlineInputBorder(),
                                prefixIcon: const Icon(
                                  Icons.search,
                                  size: 30,
                                ),
                                // suffixIcon: Icon(Icons)
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ChatScene(),
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.all(3),
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(05)),
                              color: Color.fromRGBO(249, 189, 12, 1),
                            ),
                            child: const Icon(
                              Icons.chat,
                              size: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(0),
                      height: 40, // Height of the navigation section
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: const <Widget>[
                          NavItem(title: 'All'),
                          NavItem(title: 'Aba'),
                          NavItem(title: 'Lagos'),
                          NavItem(title: 'Port Harcourt'),
                          NavItem(title: 'Uyo'),
                          NavItem(title: 'Enugu'),
                          // Add more navigation items as needed
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            ),
            body: BlocBuilder<AllNavBlocBloc, AllNavBlocState>(
              builder: (context, state) {
                if (state is AbaClickedState) {
                  const Center(child: CircularProgressIndicator());
                  return const Center(
                    child: Text(
                      'Aba Tech Events Updates',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                      ),
                    ),
                  );
                } else if (state is LagosClickedState) {
                  const Center(child: CircularProgressIndicator());
                  return const Center(
                    child: Text(
                      'Lagos Tech Events Updates',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                      ),
                    ),
                  );
                } else if (state is PortHarcourtClickedState) {
                  return const Center(
                    child: Text(
                      'Port Harcourt Tech Events Updates',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                      ),
                    ),
                  );
                } else if (state is UyoClickedState) {
                  return const Center(
                    child: Text(
                      'Uyo Tech Events Updates',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                      ),
                    ),
                  );
                } else if (state is EnuguClickedState) {
                  return const Center(
                    child: Text(
                      'Enugu Tech Events Updates',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                      ),
                    ),
                  );
                } else if (state is AllClickedState) {
                  return AllNavSection();
                }

                return const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // CircularProgressIndicator(),
                      Image(
                        width: 50,
                        image: AssetImage(
                          'assets/logo/gdglogopng.png',
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      CircularProgressIndicator(
                        color: Color.fromRGBO(249, 189, 12, 1),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  final String title;

  const NavItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle navigation tap
        // print('$title tapped');
        context.read<AllNavBlocBloc>().add(CommunityChanged(title));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        decoration: BoxDecoration(
          color: Colors.black,
          // color: const Color.fromRGBO(237, 72, 59, 1),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17.0,
              fontFamily: 'Poppins',
            ),
          ),
        ),
      ),
    );
  }
}
