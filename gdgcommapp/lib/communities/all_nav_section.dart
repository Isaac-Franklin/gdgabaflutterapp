// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gdgcommapp/repository/model/eventsmodel.dart';

class AllNavSection extends StatefulWidget {
  AllNavSection({
    Key? key,
    // this.futureEvents,
  }) : super(key: key);

  @override
  State<AllNavSection> createState() => _AllNavSectionState();
}

class _AllNavSectionState extends State<AllNavSection> {
  // final GeminiService germiniApiService = GeminiService();
  // late Future<List<TechEventsModel>>? futureEvents;

  @override
  void initState() {
    super.initState();
    // futureEvents = germiniApiService
    //     .getAIResponse('Lagos'); // Replace with the desired city
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(0),
              height: 200.0,
              child: SliderHeroSection(),
            ),

            // Consume API for general updates view
            // Container(
            //   child: FutureBuilder<List<TechEventsModel>>(
            //     future: futureEvents,
            //     builder: (context, snapshot) {
            //       if (snapshot.connectionState == ConnectionState.waiting) {
            //         return Center(child: CircularProgressIndicator());
            //       } else if (snapshot.hasError) {
            //         return Center(child: Text('Error: ${snapshot.error}'));
            //       } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            //         return Center(child: Text('No events found'));
            //       } else {
            //         final events = snapshot.data!;
            //         return ListView.builder(
            //           itemCount: events.length,
            //           itemBuilder: (context, index) {
            //             final event = events[index];
            //             return ListTile(
            //               title: Text(event.name),
            //               subtitle: Text(event.date),
            //             );
            //           },
            //         );
            //       }
            //     },
            //   ),
            // ),

            // ListView
            // ListView.builder(
            //   shrinkWrap: true,
            //   physics: const NeverScrollableScrollPhysics(),
            //   itemCount: 20,
            //   itemBuilder: (context, index) {
            //     return const ListTile(
            //       leading: Icon(Icons.abc),
            //     );
            //   },
            // )
          ],
        ),
      ),
    );
  }
}

class SliderHeroSection extends StatelessWidget {
  SliderHeroSection({super.key});
  final List items = [
    'assets/images/ioaba.jpg',
    'assets/images/ioaba2.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200.0,
        viewportFraction: 0.6,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        scrollDirection: Axis.horizontal,
      ),
      items: items.map(
        (i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 1.0),
                // decoration: BoxDecoration(color: Colors.amber),
                child: Image(
                  fit: BoxFit.cover,
                  image: AssetImage(i),
                ),
              );
            },
          );
        },
      ).toList(),
    );
  }
}
