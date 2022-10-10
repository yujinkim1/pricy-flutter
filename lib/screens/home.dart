import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import '../assets/colors/palette.dart';
import '../widgets/customContainer.dart';
import 'compare.dart';
import '../providers/dailyByData.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<DailyByData> futureDaily;

  //MARK: callAPI
  @override
  void initState() {
    super.initState();
    futureDaily = fetchDaily();
  }

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
                      title: const Text("앱 정보",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      backgroundColor: Palette.screensColor,
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: const [
                            //MARK: Information needs Classifier
                            Text("개발자",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            Text("1. 김유진, Sungkonghoe University",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal)),
                            Text("2. 박현렬, Sungkonghoe University",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal)),
                            Text("3. 이진우, Sungkonghoe University",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal)),
                            Text("API 제공처",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            Text("KAMIS",
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Palette.normalTextColor,
                                    fontWeight: FontWeight.bold))
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
          bottom: const TabBar(
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
                padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                child: FutureBuilder<DailyByData>(
                    future: futureDaily,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var items = jsonDecode(snapshot.data.toString());
                        return ListView.builder(
                          scrollDirection: Axis.vertical,
                          padding: EdgeInsets.zero,
                          itemCount: items == null ? 0 : items.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                                elevation: 5,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 6),
                                child: Container(
                                    padding: const EdgeInsets.all(8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          child: Text(
                                            items[index]
                                                .itemName
                                                ?.cast<String>(),
                                          ),
                                        )
                                      ],
                                    )));
                          },
                        );
                      } else if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      }
                      return const CircularProgressIndicator();
                    }),
              ),
            ),
            Tab(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.zero,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: CustomBox(),
                    )
                  ],
                ),
              ),
            ),
            Tab(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.zero,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ComparePage(title: 'ComparePage')));
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

/*

children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ComparePage(
                                              title: 'ComparePage')));
                                },
                              ),
                            ),
                          ],

*/