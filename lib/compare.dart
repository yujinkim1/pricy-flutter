import 'package:flutter/material.dart';
import 'assets/colors/palette.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ComparePage extends StatefulWidget {
  const ComparePage({super.key, required this.title});
  final String title;
  @override
  State<ComparePage> createState() => _Compare();
}

class _Compare extends State<ComparePage> {
  String inputText = '';
  List<_SalesData> data = [
    _SalesData('5개월 전', 35),
    _SalesData('4개월 전', 28),
    _SalesData('3개월 전', 34),
    _SalesData('2개월 전', 32),
    _SalesData('1개월 전', 40)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Palette.normalTextColor),
        backgroundColor: Palette.screensColor,
        shadowColor: Palette.containersColor,
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  // ItmeNameContainer
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.1,
                  decoration: BoxDecoration(
                    color: Palette.screensColor,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        color: Palette.containersColor,
                        offset: Offset(0, 5),
                      )
                    ],
                    borderRadius: BorderRadius.circular(15),
                  ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                //ChartContainer
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                  color: Palette.screensColor,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      color: Palette.containersColor,
                      offset: Offset(0, 5),
                    )
                  ],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(children: [
                  Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
                  // Text(
                  //   '최근동향',
                  //   style: TextStyle(fontFamily: 'NotoSansKR'),
                  // ),
                  Container(
                    child: SfCartesianChart(
                        primaryXAxis: CategoryAxis(),
                        // Chart title
                        title: ChartTitle(text: '최근동향'),
                        // Enable legend
                        legend: Legend(isVisible: false),
                        // Enable tooltip
                        tooltipBehavior: TooltipBehavior(enable: true),
                        series: <ChartSeries<_SalesData, String>>[
                          LineSeries<_SalesData, String>(
                              dataSource: data,
                              xValueMapper: (_SalesData sales, _) => sales.year,
                              yValueMapper: (_SalesData sales, _) =>
                                  sales.sales,
                              name: 'Sales',
                              // Enable data label
                              dataLabelSettings:
                                  DataLabelSettings(isVisible: false))
                        ]),
                  )
                ]),
              )
            ],
          ),

          // onTap: () {
          //   FocusScope.of(context).unfocus();
          // },
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                //PriceInputContainer
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: BoxDecoration(
                  color: Palette.screensColor,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      color: Palette.containersColor,
                      offset: Offset(0, 5),
                    )
                  ],
                  borderRadius: BorderRadius.circular(15),
                ),
                alignment: AlignmentDirectional(0, 0),
                child: TextField(
                  onChanged: (text) {
                    setState(() {
                      inputText = text;
                    }); //priceData
                  },
                  obscureText: false,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: '금액을 입력해주세요',
                  ),
                  keyboardType: TextInputType.datetime,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                //PriceOutputContainer
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.1,
                alignment: AlignmentDirectional(0, 0),
                decoration: BoxDecoration(
                  color: Palette.screensColor,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      color: Palette.containersColor,
                      offset: Offset(0, 5),
                    )
                  ],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(inputText),
              )
            ],
          )
        ]),
      ),
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
