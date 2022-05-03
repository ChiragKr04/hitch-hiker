import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hitch_hiker_app/constants/constant_colors.dart';
import 'package:hitch_hiker_app/constants/constant_images.dart';

class EventCard extends ConsumerWidget {
  const EventCard({
    Key? key,
    required this.idx,
  }) : super(key: key);

  final int idx;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String title = """"Mehengaru biru" at the top of Mount Luwu""";
    String timeLeft = "";
    String totalJoined = "6/10";
    String location = "";
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10,
        left: 5,
        right: 5,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: ConstantColors.darkBackgroundColor.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 2,
              offset: const Offset(0, 0),
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          color: Colors.transparent,
        ),
        child: SizedBox(
          width: double.infinity,
          height: 250,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              children: [
                Column(
                  children: const [
                    SizedBox(
                      width: double.infinity,
                      height: 200,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(
                              ConstantImages.mountainRoads,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      gradient: LinearGradient(
                        begin: FractionalOffset.topCenter,
                        end: FractionalOffset.bottomCenter,
                        colors: [
                          Colors.transparent,
                          ConstantColors.eventCardBottomColor,
                        ],
                        stops: [0, 0.7],
                      ),
                    ),
                  ),
                ),
                LayoutBuilder(builder: (context, constraints) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: constraints.maxHeight * 0.2,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Text(
                            title,
                            overflow: TextOverflow.clip,
                            softWrap: true,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                color: ConstantColors.white, fontSize: 30),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const FlutterLogo(),
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Text(
                                totalJoined,
                                style: const TextStyle(
                                    color: ConstantColors.white, fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                const Text(
                                  "sdfsdfsdfsdfsdfdsfdsfdsfdsf",
                                  style: TextStyle(
                                    color: ConstantColors.highlighColor,
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "sdfsdfsdfsdfsdfdsfdsfdsfdsf",
                                  style: TextStyle(
                                    color:
                                        ConstantColors.white.withOpacity(0.8),
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: SizedBox(
                                height: 40,
                                width: 60,
                                child: Material(
                                  borderRadius: BorderRadius.circular(20),
                                  color: ConstantColors.highlighColor,
                                  child: Icon(
                                    Icons.arrow_right_alt_sharp,
                                    color: Colors.black.withOpacity(0.8),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
