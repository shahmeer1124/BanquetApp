import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/app_cubit.dart';
import '../misc/colors.dart';
import '../widgets/apptext.dart';
import '../widgets/responsive_button.dart';
import '../widgets/text.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "welcome-one.png",
    "welcome-two.png",
    "welcome-three.png",
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "img/" + images[index],
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppLargeText(text: "Find Marriage Hall"),
                        AppText(
                          text: "Find the best hotel in your city",
                          size: 18,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 250,
                          child: AppText(
                            text:
                                "Booking a hotel in your city is a great way to enjoy a comfortable stay and explore the city's sights and sounds. To find the best price hotel in your city with the best food options, it is advisable to do some research online and compare prices and services offered by different hotels. You can also look for special deals and promotions offered by hotels during different seasons and holidays. Furthermore, you can read reviews and ratings from previous guests to get an idea of the food quality and services offered by the hotel. Additionally, you can consider booking a package deal that includes meals and other amenities to get the best value for your money. ",
                            color: Colors.white,
                            size: 14,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        GestureDetector(
                          onTap: () {
                            BlocProvider.of<AppCubits>(context).getdata();
                          },
                          child: Container(
                            width: 240,
                            child: Row(children: [
                              ResponsiveButton(
                                width: 225,
                              ),
                            ]),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: List.generate(3, (indexDots) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 2),
                          width: 8,
                          height: index == indexDots ? 25 : 8,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: index == indexDots
                                  ? AppColors.mainColor
                                  : AppColors.mainColor.withOpacity(0.2)),
                        );
                      }),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
