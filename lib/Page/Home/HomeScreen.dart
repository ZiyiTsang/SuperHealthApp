import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquee/marquee.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';
import 'package:third/Component/ToDoItem.dart';

import '../../Component/BarChart.dart';
import '../../Model/Appcolor.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> showingTooltipOnSpots = [21]; //assg2转移到别的文件夹好了

  List<FlSpot> get allSpots => const [
        FlSpot(0, 20),
        FlSpot(1, 25),
        FlSpot(2, 40),
        FlSpot(3, 50),
        FlSpot(4, 35),
        FlSpot(5, 40),
        FlSpot(6, 30),
        FlSpot(7, 60),
        FlSpot(8, 25),
        FlSpot(9, 40),
        FlSpot(10, 50),
        FlSpot(11, 75),
        FlSpot(12, 50),
        FlSpot(13, 60),
        FlSpot(14, 40),
        FlSpot(15, 50),
        FlSpot(16, 20),
        FlSpot(17, 25),
        FlSpot(18, 40),
        FlSpot(19, 50),
        FlSpot(20, 35),
        FlSpot(21, 80),
        FlSpot(22, 30),
        FlSpot(23, 20),
        FlSpot(24, 25),
        FlSpot(25, 40),
        FlSpot(26, 50),
        FlSpot(27, 35),
        FlSpot(28, 50),
        FlSpot(29, 60),
        FlSpot(30, 40),
      ];

  List StepArr = [
    {"title": "6am - 8am", "subtitle": "600"},
    {"title": "9am - 11am", "subtitle": "500"},
    {"title": "11am - 2pm", "subtitle": "1000"},
    {"title": "2pm - 4pm", "subtitle": "700"},
    {"title": "4pm - 6pm", "subtitle": "900"},
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    //specific heart rate line
    final lineBarsData = [
      LineChartBarData(
        showingIndicators: showingTooltipOnSpots,
        spots: allSpots,
        isCurved: false,
        barWidth: 3,
        belowBarData: BarAreaData(
          show: true,
          gradient: LinearGradient(colors: [
            MyColors.primaryColor2.withOpacity(0.8),
            MyColors.primaryColor1.withOpacity(0.05),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        dotData: FlDotData(show: false),
        gradient: LinearGradient(
          colors: MyColors.primaryG,
        ),
      ),
    ];

    final tooltipsOnBar = lineBarsData[0];

    return ListView(
      children: [
        SizedBox(height: media.width * 0.01),
        _run_hourse(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              welcome_card(media),
              SizedBox(height: media.width * 0.05),
              Text(
                "Dymatic Health",
                style: TextStyle(
                  color: MyColors.blackColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: media.width * 0.04),
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Container(
                  height: media.width * 0.4,
                  width: media.width,
                  decoration: BoxDecoration(
                      color: MyColors.primaryColor2.withOpacity(0.03),
                      borderRadius: BorderRadius.circular(25)),
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Pressure",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800),
                            ),
                            SizedBox(height: media.width * 0.01),
                            ShaderMask(
                              blendMode: BlendMode.srcIn,
                              shaderCallback: (bounds) {
                                return LinearGradient(
                                        colors: MyColors.primaryG,
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight)
                                    .createShader(Rect.fromLTRB(
                                        0, 0, bounds.width, bounds.height));
                              },
                              child: Text(
                                "Good",
                                style: TextStyle(
                                  color: Colors.deepOrange,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      LineChart(
                        LineChartData(
                          showingTooltipIndicators:
                              showingTooltipOnSpots.map((index) {
                            return ShowingTooltipIndicators([
                              LineBarSpot(
                                tooltipsOnBar,
                                lineBarsData.indexOf(tooltipsOnBar),
                                tooltipsOnBar.spots[index],
                              ),
                            ]);
                          }).toList(),
                          lineBarsData: lineBarsData,
                          minY: 0,
                          maxY: 130,
                          titlesData: FlTitlesData(show: false),
                          gridData: FlGridData(show: false),
                          borderData: FlBorderData(
                            show: false,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: media.width * 0.05),
              Text(
                "Activity Status",
                style: TextStyle(
                  color: MyColors.blackColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: media.width * 0.05),
              Row(
                children: [
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: double.maxFinite,
                        height: media.width * 0.45,
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                        decoration: BoxDecoration(
                            color: MyColors.whiteColor,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 2)
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Sleep",
                                  style: TextStyle(
                                      color: MyColors.blackColor,
                                      fontSize: 16,
                                      fontFamily: Theme.of(context)
                                          .textTheme
                                          .headlineLarge!
                                          .fontFamily!,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "6h 20m",
                                  style: TextStyle(
                                    color: Colors.pinkAccent,
                                    fontSize: 14,
                                    fontFamily: Theme.of(context)
                                        .textTheme
                                        .headlineLarge!
                                        .fontFamily!,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: media.width * 0.02),
                            Center(
                                child: Image.asset(
                              "assets/images/sleep.png",
                              width: media.width * 0.28,
                              height: media.width * 0.28,
                            ))
                          ],
                        ),
                      ),
                      SizedBox(height: media.width * 0.03),
                      Container(
                        width: double.maxFinite,
                        height: media.width * 0.45,
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                        decoration: BoxDecoration(
                            color: MyColors.whiteColor,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 2)
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Exercise",
                                  style: TextStyle(
                                      color: MyColors.blackColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: media.width * 0.03),
                                Text(
                                  "800 min",
                                  style: TextStyle(
                                    color: Colors.pink,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: media.width * 0.03),
                            Image.asset('assets/images/fitness.png',
                                width: media.width * 0.28,
                                height: media.width * 0.28),
                          ],
                        ),
                      ),
                      SizedBox(height: media.width * 0.03),
                      Container(
                        width: double.maxFinite,
                        height: media.width * 0.45,
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                        decoration: BoxDecoration(
                            color: MyColors.whiteColor,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 2)
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Calories",
                                  style: TextStyle(
                                      color: MyColors.blackColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: media.width * 0.03),
                                Text(
                                  "790 kCal",
                                  style: TextStyle(
                                    color: Colors.pink,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            Image.asset(
                              'assets/images/calories.png',
                              width: media.width * 0.3,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
                  SizedBox(width: media.width * 0.03),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          height: media.width * 0.95,
                          padding: const EdgeInsets.symmetric(
                              vertical: 25, horizontal: 10),
                          decoration: BoxDecoration(
                              color: MyColors.whiteColor,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(color: Colors.black12, blurRadius: 2)
                              ]),
                          child: Row(children: [
                            SimpleAnimationProgressBar(
                              height: media.width * 0.9,
                              width: media.width * 0.07,
                              backgroundColor: Colors.grey.shade100,
                              foregrondColor: Colors.purple,
                              ratio: 0.5,
                              direction: Axis.vertical,
                              curve: Curves.fastLinearToSlowEaseIn,
                              duration: const Duration(seconds: 3),
                              borderRadius: BorderRadius.circular(30),
                              gradientColor: LinearGradient(
                                  colors: MyColors.primaryG,
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Step Count",
                                  style: TextStyle(
                                      color: MyColors.blackColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: media.width * 0.01),
                                Text(
                                  "6230/10000",
                                  style: TextStyle(
                                    color: Colors.pink,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: media.width * 0.03),
                                Column(
                                  children: StepArr.map((obj) {
                                    var isLast = obj == StepArr.last;
                                    return Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 6),
                                                width: 10,
                                                height: 10,
                                                decoration: BoxDecoration(
                                                    color: Colors.deepOrange,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                              ),
                                              if (!isLast)
                                                DottedDashedLine(
                                                  width: 0,
                                                  height: media.width * 0.078,
                                                  axis: Axis.vertical,
                                                  dashColor: Colors.deepOrange
                                                      .withOpacity(0.5),
                                                )
                                            ]),
                                        SizedBox(width: 10),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                                height: media.width * 0.01),
                                            Text(
                                              obj["title"].toString(),
                                              style: TextStyle(
                                                  color: MyColors.blackColor,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(height: 1),
                                            Text(
                                              obj["subtitle"].toString(),
                                              style: TextStyle(
                                                color: Colors.deepOrange,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    );
                                  }).toList(),
                                )
                              ],
                            ))
                          ]),
                        ),
                        SizedBox(height: media.width * 0.02),
                        Container(
                          width: double.maxFinite,
                          height: media.width * 0.45,
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 15),
                          decoration: BoxDecoration(
                              color: MyColors.whiteColor,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(color: Colors.black12, blurRadius: 2)
                              ]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Weight",
                                    style: TextStyle(
                                        color: MyColors.blackColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: media.width * 0.03),
                                  Text(
                                    "60kg",
                                    style: TextStyle(
                                      color: Colors.pink,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: media.width * 0.05),
                              Image.asset(
                                'assets/images/measure.png',
                                height: media.height * 0.11,
                                width: double.maxFinite,
                                fit: BoxFit.fill,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: media.width * 0.05),
              Text(
                "Task Completion",
                style: TextStyle(
                  color: MyColors.blackColor,
                  fontSize: 18,
                  fontFamily:
                      Theme.of(context).textTheme.headlineLarge!.fontFamily!,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: media.width * 0.05),
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: MyColors.whiteColor,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 2)
                        ]),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    height: media.height * 0.3,
                    width: double.maxFinite,
                    child: BarChartCustom(), //有bug
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: Opacity(
                      opacity: 0.5,
                      child: Image.asset(
                        "assets/images/Medal.jpg",
                        width: media.width * 0.13,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: media.width * 0.05),
            ],
          ),
        )
      ],
    );
  }


  Container _run_hourse() {
    return Container(
      width: double.infinity,
      height: 35,
      child: Marquee(
        text:
            "Today News:    1.Cats insist on jogging every day, aiming to become the world's first marathon champion cat. 2.Elephants abandon weightlifting in favor of yoga, calling it swaying yoga . 3.Pandas try to learn boxing, but every punch they throw is defeated by their own cuteness. 4.Rabbits jog every morning, aiming to become the fastest legs in the forest.",
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.deepPurpleAccent),
        textScaleFactor: 1.5,
        scrollAxis: Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.start,
        blankSpace: 40.0,
        velocity: 100.0,
      ),
    );
  }

  Container welcome_card(media) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      height: media.width * 0.4,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(media.width * 0.065),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome Back ~",
                  style: GoogleFonts.oleoScript(
                    color: MyColors.primaryColor1,
                    fontSize: 28,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: media.width * 0.005),
                Text(
                  "To do:",
                  style: TextStyle(
                    color: MyColors.blackColor,
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: media.width * 0.01),
                TodoItem(title: "Go to the gym"),
                TodoItem(title: "Run 5km"),
              ],
            ),
          ),
          Expanded(
              flex: 4,
              child: Image.asset(
                "assets/images/to-do-list.png",
                width: media.width * 0.4,
                height: media.width * 0.4,
              ))
        ],
      ),
    );
  }
}
