import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelbook/screens/search_detail_screen.dart';
import '../cubit/app_cubit.dart';
import '../cubit/app_cubit_state.dart';
import '../misc/colors.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var Images = {
    "balloning.png": "Balloning",
    "hiking.png": "Hiking",
    "kayaking.png": "Kayaking",
    "snorkling.png": "Snorking"
  };
  @override
  Widget build(BuildContext context) {
    TextEditingController _searchController = TextEditingController();
    TabController _tabController = TabController(length: 1, vsync: this);
    return Scaffold(
        appBar: MyAppBar(
          title: 'Banquets.pk',
          backgroundColor: Colors.black, // set your desired color here
        ),
        // AppBar(
        //   backgroundColor: Colors.blueGrey[900],
        //   title: Text("Find Banquets"),
        //   centerTitle: true,
        // ),
        // this color is covering the rounded shape
        backgroundColor: Color(0xFFa9c5e4),
        body: BlocBuilder<AppCubits, Cubitstate>(builder: (context, state) {
          if (state is LoadedState) {
            var info = state.places;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                      color: Color(0xFFa9c5e4)),
                  padding: const EdgeInsets.only(right: 05, left: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 10,
                      ),
                      // Search Bar
                      TextField(
                        style: const TextStyle(color: Colors.white),
                        controller: _searchController,
                        decoration: InputDecoration(
                            hintText: "Enter your city or banquet name.",
                            hintStyle: const TextStyle(color: Colors.white),
                            fillColor: Colors.black,
                            filled: true,
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            suffixIcon: InkWell(
                              onTap: () {
                                BlocProvider.of<AppCubits>(context)
                                    .getsearchdata(_searchController.text);
                              },
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: defaultPadding / 2),
                                padding:
                                    const EdgeInsets.all(defaultPadding * 0.75),
                                decoration: const BoxDecoration(
                                    color: primaryColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: const Icon(
                                  Icons.search,
                                  color: Colors.black,
                                ),
                              ),
                            )),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Color(0xFFa9c5e4),
                    // padding: const EdgeInsets.only(
                    //     // left: 5,
                    //     ),
                    width: double.maxFinite,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        ListView.builder(
                          itemCount: info.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () async {
                                var response = await http.post(Uri.parse(
                                    'http://18.182.42.34:8000/gethotels/hotels/${info[index].id}/view-count/'));
                                if (response.statusCode == 200) {
                                  // Success
                                  print('View count incremented successfully');
                                } else {
                                  // Error
                                  print('Error: ${response.statusCode}');
                                }

                                BlocProvider.of<AppCubits>(context)
                                    .detailPage(info[index]);
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 1),
                                    width: 120,
                                    height: 150,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(info[index]
                                                .hotelPic
                                                .toString()))),
                                  ),
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      padding: EdgeInsets.all(10),
                                      // margin: EdgeInsets.only(top: 10),
                                      height: 150,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                info[index].name.toString(),
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    overflow:
                                                        TextOverflow.ellipsis),
                                              ),
                                              const SizedBox(
                                                height: 4,
                                              ),
                                              Text(
                                                "Location: ${info[index].location}",
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    overflow:
                                                        TextOverflow.ellipsis),
                                              ),
                                              const SizedBox(
                                                height: 4,
                                              ),
                                              Text(
                                                "Ph No: ${info[index].mobileNumber}",
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    overflow:
                                                        TextOverflow.ellipsis),
                                              ),
                                              const SizedBox(
                                                height: 4,
                                              ),
                                              Text(
                                                info[index].hotelType == true
                                                    ? "Hotel Type: Banquet"
                                                    : "Hotel Type: Buffet",
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    overflow:
                                                        TextOverflow.ellipsis),
                                              ),
                                              const SizedBox(
                                                height: 4,
                                              ),
                                              Text(
                                                "Views: ${info[index].views}",
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    overflow:
                                                        TextOverflow.ellipsis),
                                              ),
                                              const SizedBox(
                                                height: 4,
                                              ),
                                              const Icon(
                                                Icons.verified_user,
                                                color: Colors.blue,
                                                size: 17,
                                              ),
                                            ],
                                          ),
                                          Center(
                                            child: InkWell(
                                              onTap: () async {
                                                // open Google Maps app with directions to the hotel
                                                final coordinates = info[index]
                                                    .googleMapsLocation!
                                                    .split(',');
                                                final lat = double.parse(
                                                    coordinates[0]);
                                                final lng = double.parse(
                                                    coordinates[1]);
                                                final latLng = LatLng(lat, lng);
                                                final url = Uri.parse(
                                                    'geo:${latLng.latitude},${latLng.longitude}?q=${latLng.latitude},${latLng.longitude}');
                                                await _launchUrl(url);
                                              },
                                              child: Row(
                                                children: const [
                                                  Icon(
                                                    Icons.directions,
                                                    color: Colors.white,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Container();
          }
        }));
  }
}

Future<void> _launchUrl(Uri _url) async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}
