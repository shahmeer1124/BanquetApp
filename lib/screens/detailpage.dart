import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/app_cubit.dart';
import '../cubit/app_cubit_state.dart';
import '../misc/colors.dart';
import '../widgets/apptext.dart';
import '../widgets/text.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenstars = 4;
  int selectedindex = -1;
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, Cubitstate>(builder: (context, state) {
      final ScrollController _scrollController = ScrollController();
      DetailState detail = state as DetailState;
      //  for(int i=0;i<detail.place.packages[index].)
      return Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 350,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              detail.place.pictures![0].picture.toString()),
                          fit: BoxFit.cover)),
                ),
              ),
              Positioned(
                left: 20,
                top: 50,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        BlocProvider.of<AppCubits>(context).goHome();
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 200,
                child: Container(
                  padding: EdgeInsets.only(left: 5, right: 5, top: 15),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.blueGrey[900],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        // topRight: Radius.circular(30)
                      )),
                  child: Column(
                    children: [
                      SingleChildScrollView(
                        // Main column
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                AppLargeText(
                                  size: MediaQuery.of(context).size.width > 600
                                      ? 40
                                      : 20,
                                  text: detail.place.name.toString(),
                                  color: Colors.white,
                                ),
                                Expanded(child: Container()),
                                Icon(
                                  Icons.location_on,
                                  color: AppColors.mainColor,
                                ),
                                AppText(
                                  text: detail.place.location.toString(),
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 9,
                            ),
                            // Location Icon and location text
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.start,
                            //   children: [
                            //     Icon(
                            //       Icons.location_on,
                            //       color: AppColors.mainColor,
                            //     ),
                            //     AppText(
                            //       text: detail.place.location.toString(),
                            //       color: AppColors.textColor1,
                            //     ),
                            //   ],
                            // ),
                            AppText(
                              text: "Utilities",
                              color: Colors.orange,
                              size: 19,
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            // three icons in after utilities text
                            Row(
                              children: [
                                BeautifulContainer(
                                  icon:
                                      detail.place.features![0].parking == true
                                          ? Icons.local_parking
                                          : Icons.cancel,
                                  text: 'Parking',
                                  height:
                                      MediaQuery.of(context).size.height > 600
                                          ? 60
                                          : 40,
                                  width: MediaQuery.of(context).size.width > 600
                                      ? 60
                                      : 60,
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                BeautifulContainer(
                                  icon:
                                      detail.place.features![0].childPlayarea ==
                                              true
                                          ? Icons.child_friendly
                                          : Icons.remove,
                                  text: 'Play',
                                  height:
                                      MediaQuery.of(context).size.height > 600
                                          ? 60
                                          : 40,
                                  width: MediaQuery.of(context).size.width > 600
                                      ? 60
                                      : 60,
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                BeautifulContainer(
                                  icon: detail.place.features![0]
                                              .groundLighting ==
                                          true
                                      ? Icons.light_mode
                                      : Icons.cancel,
                                  text: 'Lighting',
                                  height:
                                      MediaQuery.of(context).size.height > 600
                                          ? 60
                                          : 40,
                                  width: MediaQuery.of(context).size.width > 600
                                      ? 60
                                      : 60,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            // three icons in after utilities text
                            Row(
                              children: [
                                BeautifulContainer(
                                  icon:
                                      detail.place.features![0].chiller == true
                                          ? Icons.ac_unit
                                          : Icons.cancel,
                                  text: 'AC',
                                  height:
                                      MediaQuery.of(context).size.height > 600
                                          ? 60
                                          : 40,
                                  width: MediaQuery.of(context).size.width > 600
                                      ? 60
                                      : 60,
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                BeautifulContainer(
                                  icon: detail.place.features![0].soundSystem ==
                                          true
                                      ? Icons.music_note_sharp
                                      : Icons.cancel,
                                  text: 'Music',
                                  height:
                                      MediaQuery.of(context).size.height > 600
                                          ? 60
                                          : 40,
                                  width: MediaQuery.of(context).size.width > 600
                                      ? 60
                                      : 60,
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                BeautifulContainer(
                                  icon:
                                      detail.place.features![0].bridalSystem ==
                                              true
                                          ? Icons.room_preferences
                                          : Icons.cancel,
                                  text: 'Room',
                                  height:
                                      MediaQuery.of(context).size.height > 600
                                          ? 60
                                          : 40,
                                  width: MediaQuery.of(context).size.width > 600
                                      ? 60
                                      : 60,
                                ),
                              ],
                            ),
                            // SizedBox(
                            //   height: 0,
                            // ),
                            // AppLargeText(text: "Packages"),

                            // Packages Containers
                            Container(
                              height: MediaQuery.of(context).size.height,
                              width: double.infinity,
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: detail.place.packages!.length,
                                scrollDirection: Axis.vertical,
                                physics: AlwaysScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  List<Widget> packageImages = [];
                                  for (var i = 0;
                                      i <
                                          detail.place.packages![index]
                                              .packagePictures!.length;
                                      i++) {
                                    var packagePicture = detail.place
                                        .packages![index].packagePictures![i];
                                    // Images List View in packages
                                    packageImages.add(
                                      GestureDetector(
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return Dialog(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      fit: BoxFit.contain,
                                                      image: NetworkImage(
                                                          packagePicture.picture
                                                              .toString()),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(right: 10),
                                          width: 150,
                                          height: 150,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(packagePicture
                                                  .picture
                                                  .toString()),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  return SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(
                                              top: 09, left: 10, right: 10),
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(30)),
                                          ),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                // Text fields in packages
                                                Text(
                                                  detail.place.packages![index]
                                                      .packageName
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18),
                                                ),
                                                Text(
                                                  detail.place.packages![index]
                                                      .chargesPerHeadWithoutFood
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18),
                                                ),
                                                Text(
                                                  detail.place.packages![index]
                                                      .chargesPerHeadWithFood
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18),
                                                ),
                                                Text(
                                                  detail.place.packages![index]
                                                      .foodServed
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Row(
                                                  children: [
                                                    BeautifulContainer(
                                                      icon: detail
                                                                  .place
                                                                  .packages![
                                                                      index]
                                                                  .freeWifi ==
                                                              true
                                                          ? Icons.wifi
                                                          : Icons.cancel,
                                                      text: "Wifi",
                                                      height:
                                                          MediaQuery.of(context)
                                                                      .size
                                                                      .height >
                                                                  600
                                                              ? 60
                                                              : 40,
                                                      width:
                                                          MediaQuery.of(context)
                                                                      .size
                                                                      .width >
                                                                  600
                                                              ? 60
                                                              : 60,
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    BeautifulContainer(
                                                      icon: detail
                                                                  .place
                                                                  .packages![
                                                                      index]
                                                                  .stageDecoration ==
                                                              true
                                                          ? Icons.handshake
                                                          : Icons.cancel,
                                                      text: "Stage",
                                                      height:
                                                          MediaQuery.of(context)
                                                                      .size
                                                                      .height >
                                                                  600
                                                              ? 60
                                                              : 40,
                                                      width:
                                                          MediaQuery.of(context)
                                                                      .size
                                                                      .width >
                                                                  600
                                                              ? 60
                                                              : 60,
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    BeautifulContainer(
                                                      icon: detail
                                                                  .place
                                                                  .packages![
                                                                      index]
                                                                  .soundSystem ==
                                                              true
                                                          ? Icons.music_note
                                                          : Icons.cancel,
                                                      text: "Music",
                                                      height:
                                                          MediaQuery.of(context)
                                                                      .size
                                                                      .height >
                                                                  600
                                                              ? 60
                                                              : 40,
                                                      width:
                                                          MediaQuery.of(context)
                                                                      .size
                                                                      .width >
                                                                  600
                                                              ? 60
                                                              : 60,
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    BeautifulContainer(
                                                      icon: detail
                                                                  .place
                                                                  .packages![
                                                                      index]
                                                                  .groundLighting ==
                                                              true
                                                          ? Icons.light
                                                          : Icons.cancel,
                                                      text: "Lighting",
                                                      height:
                                                          MediaQuery.of(context)
                                                                      .size
                                                                      .height >
                                                                  600
                                                              ? 60
                                                              : 40,
                                                      width:
                                                          MediaQuery.of(context)
                                                                      .size
                                                                      .width >
                                                                  600
                                                              ? 60
                                                              : 60,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Row(
                                                  children: [
                                                    BeautifulContainer(
                                                      icon: detail
                                                                  .place
                                                                  .packages![
                                                                      index]
                                                                  .bridalRoom ==
                                                              true
                                                          ? Icons.room
                                                          : Icons.cancel,
                                                      text: "Room",
                                                      height:
                                                          MediaQuery.of(context)
                                                                      .size
                                                                      .height >
                                                                  600
                                                              ? 60
                                                              : 40,
                                                      width:
                                                          MediaQuery.of(context)
                                                                      .size
                                                                      .width >
                                                                  600
                                                              ? 60
                                                              : 60,
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    BeautifulContainer(
                                                      icon: detail
                                                                  .place
                                                                  .packages![
                                                                      index]
                                                                  .freeParking ==
                                                              true
                                                          ? Icons
                                                              .local_parking_sharp
                                                          : Icons.cancel,
                                                      text: "Parking",
                                                      height:
                                                          MediaQuery.of(context)
                                                                      .size
                                                                      .height >
                                                                  600
                                                              ? 60
                                                              : 40,
                                                      width:
                                                          MediaQuery.of(context)
                                                                      .size
                                                                      .width >
                                                                  600
                                                              ? 60
                                                              : 60,
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    BeautifulContainer(
                                                      icon: detail
                                                                  .place
                                                                  .packages![
                                                                      index]
                                                                  .chiller ==
                                                              true
                                                          ? Icons.ac_unit
                                                          : Icons.cancel,
                                                      text: "Chiller",
                                                      height:
                                                          MediaQuery.of(context)
                                                                      .size
                                                                      .height >
                                                                  600
                                                              ? 60
                                                              : 40,
                                                      width:
                                                          MediaQuery.of(context)
                                                                      .size
                                                                      .width >
                                                                  600
                                                              ? 60
                                                              : 60,
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    BeautifulContainer(
                                                      icon: detail
                                                                  .place
                                                                  .packages![
                                                                      index]
                                                                  .heater ==
                                                              true
                                                          ? Icons
                                                              .holiday_village
                                                          : Icons.cancel,
                                                      text: "Heater",
                                                      height:
                                                          MediaQuery.of(context)
                                                                      .size
                                                                      .height >
                                                                  600
                                                              ? 60
                                                              : 40,
                                                      width:
                                                          MediaQuery.of(context)
                                                                      .size
                                                                      .width >
                                                                  600
                                                              ? 60
                                                              : 60,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Container(
                                                  height: 150,
                                                  child: SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    child: Row(
                                                      children: packageImages,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          margin: EdgeInsets.only(top: 10),
                                          height: 1300,
                                          width:
                                              MediaQuery.of(context).size.width,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            
            ],
          ),
        ),
      );
    });
  }
}

class BeautifulContainer extends StatelessWidget {
  final IconData icon;
  final String text;
  final double height;
  final double width;

  BeautifulContainer(
      {required this.icon,
      required this.text,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xff9494d7),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 13,
            color: Colors.white,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 10,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class ImageDialog extends StatefulWidget {
  final String image;

  ImageDialog({required this.image});

  @override
  _ImageDialogState createState() => _ImageDialogState();
}

class _ImageDialogState extends State<ImageDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.contain,
            image: NetworkImage(widget.image),
          ),
        ),
      ),
    );
  }
}
