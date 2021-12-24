import 'package:basic_crypto_app/models/card_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatefulWidget {
  var title;

  MyHomePage({Key? key, required this.title}): super(key: key);
  
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        horizontalInterval: 1.6,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d).withOpacity(0.2),
            strokeWidth: 1,
          );
        },
      ),

      titlesData: FlTitlesData(
        show: true,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          interval: 1,
          getTextStyles: (context, value) =>
          const TextStyle(
            color: Color(0xff68737d),
            fontWeight: FontWeight.bold,
            fontSize: 11,
          ),
          getTitles: (value) {
            switch(value.toInt()) {
              case 2:
                return 'MAR';
              case 5:
                return 'JUN';
              case 8:
                return 'SEP';
            }
            return '';
          },
          margin: 8,
        ),

        leftTitles: SideTitles(
          showTitles: true,
          reservedSize: 32,
          interval: 1,
          getTextStyles: (context, value) =>
          const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 11,
          ),
          getTitles: (value) {
            switch(value.toInt()) {
              case 1:
                return '10K';
              case 3:
                return '30K';
              case 5:
                return '50K';
            }
            return '';
          },
          margin: 12,
        ),
      ),

      borderData: FlBorderData(
          show: false,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          colors: gradientColors,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors:
            gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xFF161621),
          body: SafeArea(
            child: Container(
              child: ListView(
                physics: ClampingScrollPhysics(),
                children: <Widget>[
                  // Top Nav Bar
                  Container(
                    margin: EdgeInsets.only(left: 16, right: 16, top: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(
                          Icons.view_headline,
                          color: Colors.grey,
                          size: 40
                        ),
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: AssetImage('assets/images/profile.png'),
                            )
                          ),
                        )
                      ],
                    )
                  ),

                  // Space between Top nav and Card section
                  SizedBox(
                    height: 25,
                  ),

                  Container(
                    height: 120,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.only(left: 8, right: 8),
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          if(index == 0 || index == 1) {
                            return Container(
                              margin: EdgeInsets.only(right: 4),
                              height: 120,
                              width: 184,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(28),
                                color: Color(cards[index].cardBackground),
                              ),
                              child: Stack(
                                alignment: Alignment.center,
                                children: <Widget>[
                                  Positioned(
                                      top: 15,
                                      child: Image.asset(
                                        cards[index].image,
                                        width: 27, 
                                        height: 27,
                                      )
                                  ),
                                  
                                  Positioned(
                                      top: 50,
                                      child: Text(cards[index].name,
                                        style: GoogleFonts.inter(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFFFFFFFFF),
                                        )
                                      )
                                  ),

                                  Positioned(
                                      top: 75,
                                      child: Text(cards[index].value,
                                          style: GoogleFonts.inter(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFFFFFFFFF),
                                          )
                                      )
                                  ),
                                ],
                              ),
                            );
                          } else {
                            return const SizedBox();
                          }
                        }
                    )
                  ),

                  SizedBox(
                    height: 15,
                  ),

                  Container(
                      height: 120,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.only(left: 8, right: 8),
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            if(index == 2 || index == 3) {
                              return Container(
                                margin: EdgeInsets.only(right: 4),
                                height: 120,
                                width: 184,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(28),
                                  color: Color(cards[index].cardBackground),
                                ),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: <Widget>[
                                    Positioned(
                                        top: 15,
                                        child: Image.asset(
                                          cards[index].image,
                                          width: 27,
                                          height: 27,
                                        )
                                    ),

                                    Positioned(
                                        top: 50,
                                        child: Text(cards[index].name,
                                            style: GoogleFonts.inter(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xFFFFFFFFF),
                                            )
                                        )
                                    ),

                                    Positioned(
                                        top: 75,
                                        child: Text(cards[index].value,
                                            style: GoogleFonts.inter(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xFFFFFFFFF),
                                            )
                                        )
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              return const SizedBox();
                            }
                          }
                      )
                  ),

                  SizedBox(
                    height: 45,
                  ),

                  Center(
                    child: Text(
                      "Bitcoin chart", style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFFFFFFFF)
                    ),
                    ),
                  ),

                  AspectRatio(
                      aspectRatio: 1.5,
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(18),
                        ),
                        color: Color(0xff232d37)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: 18.0, left: 12.0, top:24, bottom: 12),
                        child: LineChart(
                            mainData(),
                          ),
                        ),
                      ),
                    ),

                ],
              ),
            ),
          )
        )
    );
  }
  
}