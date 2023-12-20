import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:uas_traveleasy/page/lokasi.dart';
import 'package:uas_traveleasy/page/untuk_widget.dart';
import 'package:uas_traveleasy/resources/large_text.dart';
import 'package:uas_traveleasy/kategoripage/gunung.dart';
import 'package:uas_traveleasy/kategoripage/danau.dart';

class RatingTertinggi extends StatefulWidget {
  const RatingTertinggi({Key? key}) : super(key: key);

  @override
  State<RatingTertinggi> createState() => _RatingTertinggiState();
}

class _RatingTertinggiState extends State<RatingTertinggi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          Container(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Row(
              children: [
                Icon(Icons.menu, size: 30, color: Colors.black),
                Text("Project UTS"),
                Expanded(child: Container()),
                Container(
                  width: 50,
                  height: 50,
                  child: Icon(Icons.search, color: Colors.black),
                ),
              ],
            ),
          ),
          Column(
            children: [
              SizedBox(height: 40),
              LText(text: "Jelajahi"),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MText(text: "Rating Tertinggi"),
                  TextButton(
                    onPressed: () {},
                    child: const Text("See More"),
                  ),
                ],
              ),
              SizedBox(height: 10),
              CarouselSlider(
                items: [
                  Image.asset('assets/sumbing.png'),
                  Image.asset('assets/kaja.jpg'),
                  Image.asset('assets/lajo.jpg'),
                  // Add more images as needed
                ],
                options: CarouselOptions(
                  height: 200,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 0.8,
                ),
              ),
            ],
          ),
          Tempat2(),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MText(text: "Kategori Wisata"),
                  TextButton(
                    onPressed: () {},
                    child: const Text("See All"),
                  ),
                ],
              ),
              Container(
                height: 220,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                  ),
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            // Update this onTap to navigate to the correct page
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  // Use a switch statement or if-else to determine the correct page
                                  switch (data[index].category) {
                                    case 'Gunung':
                                      return GunungPage(
                                          gunung: gunungList[index]);
                                    case 'Danau':
                                      return DanauPage(danau: danauList[index]);
                                    // Add cases for other categories as needed
                                    default:
                                      return Container(); // Handle default case
                                  }
                                },
                              ),
                            );
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Image.asset(
                              data[index].gmbr,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Text(data[index].nma),
                      ],
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MText(text: "Pegunungan"),
                  TextButton(
                    onPressed: () {},
                    child: const Text("See More"),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Tempat(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MText(text: "Tempat Favorit"),
                  TextButton(
                    onPressed: () {},
                    child: const Text("See More"),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Tempat(),
            ],
          ),
        ],
      ),
    );
  }
}
