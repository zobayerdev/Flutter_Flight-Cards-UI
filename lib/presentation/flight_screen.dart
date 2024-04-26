import 'package:flutter/material.dart';
import 'package:flutter_flight_ui/utlis/colors.dart';

class FlightScreen extends StatefulWidget {
  const FlightScreen({super.key});

  @override
  State<FlightScreen> createState() => _FlightScreenState();
}

class _FlightScreenState extends State<FlightScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController =
      TabController(length: tabs.length, vsync: this);
  List tabs = ['Economy', 'Business', 'Analysis'];

  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPicker.backGroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: ColorPicker.lightColor,
                        child: Icon(Icons.arrow_back),
                      ),
                      Text("Serach Result"),
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: ColorPicker.lightColor,
                        child: Icon(Icons.notification_add_outlined),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("251 Flight"),
                                Text("from New York to Paris"),
                              ],
                            ),
                            Expanded(
                              child: Image.asset(
                                'assets/map_img.png',
                                color: ColorPicker.primaryColor,
                                height:
                                    MediaQuery.of(context).size.height * 0.13,
                              ),
                            )
                          ],
                        ),
                        TabBar(
                          controller: tabController,
                          unselectedLabelColor: ColorPicker.primaryColor,
                          indicatorWeight: 0,
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent),
                          labelPadding:
                              const EdgeInsets.symmetric(horizontal: 5),
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: ColorPicker.primaryColor,
                          ),
                          indicatorSize: TabBarIndicatorSize.label,
                          isScrollable: true,
                          onTap: (index) {
                            selectIndex = index;
                            setState(() {});
                          },
                          tabs: tabs
                              .map(
                                (e) => Container(
                                  height: 40,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    color: tabs.indexOf(e) == selectIndex
                                        ? ColorPicker.primaryColor
                                        : ColorPicker.lightColor,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Text(
                                      e,
                                      style: TextStyle(
                                        color: tabs.indexOf(e) == selectIndex
                                            ? ColorPicker.backGroundColor
                                            : ColorPicker.primaryColor,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: TabBarView(
                controller: tabController,
                children: [
                  flightCard(),
                  const Center(
                    child: Text("Business"),
                  ),
                  const Center(
                    child: Text("Analysis"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget flightCard() => ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: double.infinity,
            child: Stack(
              children: [
                ClipPath(
                  clipper: FlightCardDesign(radius: 10),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: ColorPicker.primaryColor,
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  child: timeLocation('12:30', 'Dhaka'),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: CustomPaint(
                                  painter: DottedLine(radius: 10),
                                  child: SizedBox(
                                    height: MediaQuery.of(context).size.height,
                                    width: MediaQuery.of(context).size.height,
                                    child: Transform(
                                      transform:
                                          Matrix4.translationValues(0, 10, 0),
                                      child: const RotatedBox(
                                        quarterTurns: 1,
                                        child: Icon(
                                          Icons.flight,
                                          size: 30,
                                          color:
                                              Color.fromRGBO(255, 255, 124, 1),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  child: timeLocation('11:30', 'Qatar'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: const Text(
                                    'Emirates',
                                    style: TextStyle(
                                      backgroundColor: ColorPicker.primaryColor,
                                      color: ColorPicker.backGroundColor,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.only(right: 20),
                                  alignment: Alignment.centerRight,
                                  child: const Text(
                                    '\$2150',
                                    style: TextStyle(
                                      backgroundColor: ColorPicker.primaryColor,
                                      color: ColorPicker.backGroundColor,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                CustomPaint(
                  painter: DottedLine(radius: 10),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                Positioned(
                  bottom: 60,
                  left: MediaQuery.of(context).size.width / 2.5,
                  child: const Text(
                    '20h 20m',
                    style: TextStyle(
                      backgroundColor: ColorPicker.primaryColor,
                      color: ColorPicker.backGroundColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemCount: 4);

  Widget timeLocation(String time, String location) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              time,
              style: const TextStyle(
                color: ColorPicker.backGroundColor,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              location,
              style: const TextStyle(
                color: ColorPicker.backGroundColor,
                fontSize: 20,
              ),
            ),
          ],
        ),
      );
}

class DottedLine extends CustomPainter {
  double radius;
  DottedLine({required this.radius});
  @override
  void paint(Canvas canvas, Size size) {
    double dashWidth = 5;
    double dashSpace = 5;
    double startX = radius;

    final paint = Paint()
      ..color = ColorPicker.backGroundColor
      ..strokeWidth = 2;
    while (startX < size.width - radius) {
      canvas.drawLine(Offset(startX, size.height / 1.5),
          Offset(startX + dashWidth, size.height / 1.5), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class FlightCardDesign extends CustomClipper<Path> {
  double radius;
  FlightCardDesign({
    required this.radius,
  });

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

    path.addOval(Rect.fromCircle(
        center: Offset(0.0, size.height / 1.5), radius: radius));
    path.addOval(Rect.fromCircle(
        center: Offset(size.width, size.height / 1.5), radius: radius));

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
