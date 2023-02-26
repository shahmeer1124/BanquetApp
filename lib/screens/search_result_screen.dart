import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelbook/screens/search_detail_screen.dart';
import '../cubit/app_cubit.dart';
import '../cubit/app_cubit_state.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TextEditingController _searchController = TextEditingController();
    TabController _tabController = TabController(length: 1, vsync: this);
    return WillPopScope(
      onWillPop: () async {
        // Emit a state here before popping the screen
        BlocProvider.of<AppCubits>(context).againgoHome();

        // Return true to allow the screen to be popped
        return true;
      },
      child: SafeArea(
        child: Scaffold(
            appBar: MyAppBar(
              title: 'Banquets.pk',
              backgroundColor: Colors.black, // set your desired color here
            ),
            // AppBar(
            //   backgroundColor: Colors.blueGrey[900],
            //   title: Text("Banquets"),
            // ),

            backgroundColor: Color(0xFFa9c5e4),
            body: BlocBuilder<AppCubits, Cubitstate>(builder: (context, state) {
              if (state is SearchLoadedState) {
                var info = state.newplaces;
                if (info.length == 0) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      IconButton(
                        onPressed: () {
                          BlocProvider.of<AppCubits>(context).againgoHome();
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 200,
                      ),
                      const Center(
                          child: Text(
                        "No hotel found in this city",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                    ],
                  );
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          IconButton(
                            onPressed: () {
                              BlocProvider.of<AppCubits>(context).againgoHome();
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      // Container(
                      //   height: 50,
                      //   decoration: const BoxDecoration(
                      //       borderRadius: BorderRadius.only(
                      //         bottomLeft: Radius.circular(30),
                      //         bottomRight: Radius.circular(30),
                      //       ),
                      //       color: Color(0xFF242529)),
                      //   padding: EdgeInsets.only(top: 0, left: 20),
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       IconButton(
                      //         onPressed: () {
                      //           BlocProvider.of<AppCubits>(context).againgoHome();
                      //         },
                      //         icon: Icon(
                      //           Icons.arrow_back,
                      //           color: Colors.white,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),

                      Expanded(
                        child: Container(
                          color: Color(0xFFa9c5e4),
                          // color: Colors.orange,
                          padding: EdgeInsets.only(left: 0, top: 0),
                          // height: MediaQuery.of(context).size.height - 350,
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
                                      } else {
                                        // Error
                                        print('Error: ${response.statusCode}');
                                      }
                                      BlocProvider.of<AppCubits>(context)
                                          .newdetailPage(info[index]);
                                    },
                                    child: Container(
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                              right: 1,
                                            ),
                                            width: 120,
                                            height: 150,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(
                                                        info[index]
                                                            .hotelPic
                                                            .toString()))),
                                          ),
                                          Expanded(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.black,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              padding: EdgeInsets.all(10),
                                              // margin: EdgeInsets.only(top: 10),
                                              height: 150,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        info[index]
                                                            .name
                                                            .toString(),
                                                        style: const TextStyle(
                                                            color: Colors.white,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis),
                                                      ),
                                                      const SizedBox(
                                                        height: 4,
                                                      ),
                                                      Text(
                                                        "Location" +
                                                            info[index]
                                                                .location
                                                                .toString(),
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis),
                                                      ),
                                                      const SizedBox(
                                                        height: 4,
                                                      ),
                                                      Text(
                                                        "Ph No: " +
                                                            info[index]
                                                                .mobileNumber
                                                                .toString(),
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis),
                                                      ),
                                                      SizedBox(
                                                        height: 4,
                                                      ),
                                                      Text(
                                                        info[index].hotelType ==
                                                                true
                                                            ? "Hotel Type: Banquet"
                                                            : "Hotel Type: Buffet",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis),
                                                      ),
                                                      const SizedBox(
                                                        height: 4,
                                                      ),
                                                      Text(
                                                        "Views: ${info[index].views}",
                                                        style: const TextStyle(
                                                            color: Colors.white,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis),
                                                      ),
                                                      SizedBox(
                                                        height: 4,
                                                      ),
                                                      Icon(
                                                        Icons.verified_user,
                                                        color: Colors.blue,
                                                        size: 17,
                                                      )
                                                    ],
                                                  ),
                                                  Center(
                                                    child: InkWell(
                                                      onTap: () async {
                                                        // open Google Maps app with directions to the hotel
                                                        final Uri _url = Uri.parse(
                                                            "https://www.google.com/maps/dir/?api=1&destination=${Uri.encodeComponent(info[index].googleMapsLocation.toString())}");
                                                        _launchUrl(_url);
                                                      },
                                                      child: Row(
                                                        children: [
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
                }
              } else {
                return Container();
              }
            })),
      ),
    );
  }
}

Future<void> _launchUrl(Uri _url) async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}
