import 'package:flutter/material.dart';
import 'package:pricy/providers/dailyByData.dart';
import '../assets/colors/palette.dart';
import '../widgets/customContainer.dart';

import 'compare.dart';
import '../providers/dailyByData.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<DailyByData> _dailyByData = [
    DailyByData('쌀', '5000', 0),
    DailyByData('콩', '4000', 1),
    DailyByData('고구마', '8000', 2),
    DailyByData('감자', '4400', 0),
    DailyByData('보리', '12000', 1),
  ];
  @override
  Widget build(BuildContext context) {
    //MARK: DefaultTabController
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        //MARK: Custom AppBar
        appBar: AppBar(
          backgroundColor: Palette.screensColor,
          title: const Text(
            'Pricy',
            style: TextStyle(
                color: Palette.normalTextColor,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              onPressed: () {
                //MARK: Button isonPressed ? PopUpDialog
                showDialog(
                  context: context,
                  // -Dialog 바깥 영역을 터치 시 화면 닫기 여부
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("앱 정보"),
                      backgroundColor: Palette.screensColor,
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: [
                            //MARK: Information needs Classifier
                            Text("개발자"),
                            Text("김유진"),
                            Text("박현렬"),
                            Text("이진우"),
                            Text("API 제공처"),
                            Text("KAMIS")
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              icon: const Icon(
                Icons.info_outline,
                color: Palette.normalTextColor,
                size: 30,
              ),
            ),
          ],
          centerTitle: false,
          elevation: 0,
          //MARK: bottom in tabBar
          bottom: TabBar(
            isScrollable: true,
            labelColor: Palette.tabLabelColor,
            indicatorColor: Palette.tabLabelColor,
            indicatorWeight: 3,
            unselectedLabelColor: Palette.normalTextColor,
            tabs: <Widget>[
              Tab(
                child:
                    Text("식량", style: TextStyle(fontWeight: FontWeight.w400)),
              ),
              Tab(
                child:
                    Text("채소", style: TextStyle(fontWeight: FontWeight.w400)),
              ),
              Tab(
                child:
                    Text("과일", style: TextStyle(fontWeight: FontWeight.w400)),
              ),
            ],
          ),
        ),
        body:
            //MARK: TabBarView
            TabBarView(
          children: <Widget>[
            //MARK: Using Class ListContainer
            Tab(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.zero,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ComparePage(title: 'ComparePage')));
                        },
                        child: CustomBox(),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Tab(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.zero,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: CustomBox(),
                    )
                  ],
                ),
              ),
            ),
            Tab(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.zero,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ComparePage(title: 'ComparePage')));
                        },
                        child: CustomBox(),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
