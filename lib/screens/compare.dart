import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pricy/providers/dailyByData.dart';
import 'package:pricy/utilities/styles.dart';
import 'package:pricy/widgets/customContainer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../assets/colors/palette.dart';
import '../providers/periodByData.dart';

class ComparePage extends StatefulWidget {
  ComparePage({super.key, required this.title, required this.items});
  final String title;
  final Price items;
  @override
  State<ComparePage> createState() => _Compare();
}

class _Compare extends State<ComparePage> {
  String inputText = '0';
  late String theDay = widget.items.dpr1;
  late String dayAgo = widget.items.dpr2;
  late String monthAgo = widget.items.dpr3;
  late String yearAgo = widget.items.dpr4;
  late int dayPrice = int.parse('${theDay.replaceAll(",", "")}');
  // late int dayAgoPrice = int.parse('${dayAgo.replaceAll(",", "")}');
  // late int monthAgoPrice = int.parse('${monthAgo.replaceAll(",", "")}');
  // late int yearAgoPrice = int.parse('${yearAgo.replaceAll(",", "")}');
  late int result = dayPrice - int.parse(inputText.replaceAll('"', ''));

  // List<_SalesData> data = [
  //   _SalesData('5개월 전', dayPrice),
  //   _SalesData('4개월 전', dayAgoPrice),
  //   _SalesData('3개월 전', monthAgoPrice),
  //   _SalesData('2개월 전', yearAgoPrice)
  // ];

  @override
  Widget build(BuildContext context) {
    // String inputText = '0';
    late int dayPrice = int.parse('${theDay.replaceAll(",", "")}');
    late int dayAgoPrice = int.parse('${dayAgo.replaceAll(",", "")}');
    late int monthAgoPrice = int.parse('${monthAgo.replaceAll(",", "")}');
    late int yearAgoPrice = int.parse('${yearAgo.replaceAll(",", "")}');
    late int result = dayPrice - int.parse(inputText.replaceAll('"', ''));
    List<_SalesData> data = [
      _SalesData('1년 전', yearAgoPrice),
      _SalesData('한달 전', monthAgoPrice),
      _SalesData('하루 전', dayAgoPrice),
      _SalesData('당일', dayPrice)
    ];
    List<int> numbers = [dayPrice, dayAgoPrice, monthAgoPrice, yearAgoPrice];
    numbers.sort();
    double max = double.parse(numbers[3].toString());
    double min = double.parse(numbers[0].toString());

    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Palette.normalTextColor),
            backgroundColor: Palette.screensColor,
            centerTitle: false,
            elevation: 0,
            actions: [],
            title: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    widget.items.itemName,
                    style: Styles.itemNameText,
                  ),
                  Text(
                    widget.items.unit,
                    style: Styles.unitText,
                  )
                ],
              ),
            ),
          ),
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  //chartBox
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.4,
                        decoration: BoxDecoration(
                            color: Palette.containerColor,
                            borderRadius: BorderRadius.circular(5.0),
                            shape: BoxShape.rectangle,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 0,
                                  color: Palette.shadowColor,
                                  offset: Offset(0, 5))
                            ]),
                        child: Column(children: [
                          Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
                          Container(
                            child: SfCartesianChart(
                                primaryXAxis: CategoryAxis(),
                                primaryYAxis: NumericAxis(
                                    minimum: min - min / 2,
                                    maximum: max + max / 2),
                                // Chart title
                                title: ChartTitle(text: '1년간 금액 변화'),
                                // Enable legend
                                legend: Legend(isVisible: false),
                                // Enable tooltip
                                tooltipBehavior: TooltipBehavior(enable: true),
                                series: <ChartSeries<_SalesData, String>>[
                                  LineSeries<_SalesData, String>(
                                      dataSource: data,
                                      xValueMapper: (_SalesData sales, _) =>
                                          sales.year,
                                      yValueMapper: (_SalesData sales, _) =>
                                          sales.sales,
                                      name: 'Sales',
                                      // Enable data label
                                      dataLabelSettings:
                                          DataLabelSettings(isVisible: true)),
                                ]),
                          )
                        ]))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.1,
                      decoration: BoxDecoration(
                        color: Palette.containerColor,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 0,
                            color: Palette.shadowColor,
                            offset: Offset(0, 5),
                          )
                        ],
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      alignment: AlignmentDirectional(0, 0),
                      child: TextField(
                        onChanged: (text) {
                          setState(() {
                            inputText = text;
                            if (inputText == " ") {
                              inputText = '0';
                            }
                          });
                        },
                        obscureText: false,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: '금액 입력하기',
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.1,
                      alignment: AlignmentDirectional(0, 0),
                      decoration: BoxDecoration(
                          color: Palette.containerColor,
                          borderRadius: BorderRadius.circular(5.0),
                          shape: BoxShape.rectangle,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 0,
                                color: Palette.shadowColor,
                                offset: Offset(0, 5))
                          ]),
                      child: Column(
                        children: [
                          Text(
                            "금일 가격 : ${theDay} 원",
                            style: Styles.dprText,
                          ),
                          Text(
                            "입력 가격 : ${inputText} 원",
                            style: Styles.dprText,
                          ),
                          Text(
                            "차액 : ${result} 원",
                            style: Styles.dprText,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (result > 0)
                      takeBuyBox()
                    else
                      // Container(
                      //   color: Palette.highLightColor,
                      // )
                      dontBuyBox()
                  ],
                )
              ],
            ),
          ),
        ));
  }

  // Widget getWidget() {
  //   if (result > 0) {
  //     return Container(
  //       color: Palette.containerColor,
  //       child: Text("구매해!"),
  //     );
  //   } else {
  //     return Container(
  //       color: Palette.highLightColor,
  //       child: Text("구매하지마!"),
  //     );
  //   }
  // }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final int sales;
}
