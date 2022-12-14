import 'package:flutter/material.dart';
import '/assets/colors/palette.dart';
import 'compare.dart';
import '/providers/dailyByData.dart';
import '/utilities/styles.dart';

//MARK: DEFINED TEXTEDITING CONTROLLER

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<PriceList> futureDaily;

  //MARK: -API CALL
  @override
  void initState() {
    super.initState();
    futureDaily = fetchDaily();
  }

  @override
  Widget build(BuildContext context) {
    //MARK: DEFAULT TAB CONTORLLER
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        //MARK: CUSTOM APPBAR
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
                //MARK: BUTTON IS ON PRESSED ? POP UP DIALOG
                showDialog(
                  context: context,
                  //MARK: USER USING TAB TO CLOSE DIALOG
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
                            //MARK: APP INFORMATION
                            Text("Sungkonghoe University",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            Text("김유진",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal)),
                            Text("박현렬",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal)),
                            Text("이진우",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal)),
                            Text("API 제공처",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
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
          //MARK: BOTTOM IN TAB BAR
          bottom: const TabBar(
            isScrollable: true,
            labelColor: Palette.highLightColor,
            indicatorColor: Palette.highLightColor,
            indicatorWeight: 2,
            labelStyle: TextStyle(
                color: Palette.tabLabelColor,
                fontSize: 20,
                fontWeight: FontWeight.bold),
            unselectedLabelStyle:
                TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            unselectedLabelColor: Palette.normalTextColor,
            tabs: <Widget>[
              Tab(
                child: Text("식량작물"),
              ),
              Tab(
                child: Text("축산물"),
              ),
              Tab(
                child: Text("수산물"),
              ),
              Tab(
                child: Text("과일류"),
              ),
              Tab(
                child: Text("채소류"),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            //MARK: TAB BAR VIEW IN LIST CONTAINER
            Tab(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                child: new FutureBuilder<PriceList>(
                    future: futureDaily,
                    builder: (BuildContext context, snapshot) {
                      if (snapshot.hasData) {
                        var items = snapshot.data!.price;
                        return ListView.builder(
                          scrollDirection: Axis.vertical,
                          padding: EdgeInsets.zero,
                          itemCount: items == null ? 0 : items.length,
                          itemBuilder: (BuildContext context, int index) {
                            var datas = items![index];
                            late int thedayPrice =
                                int.parse('${datas.dpr1.replaceAll(",", "")}');
                            late int agoPrice =
                                int.parse('${datas.dpr2.replaceAll(",", "")}');
                            if (datas.categoryName == "식량작물") {
                              return SizedBox(
                                  height: 80,
                                  child: Card(
                                      shadowColor: Palette.shadowColor,
                                      elevation: 3,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 7),
                                      child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ComparePage(
                                                            title:
                                                                'ComparePage',
                                                            items: datas)));
                                          },
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.all(10),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(datas.itemName,
                                                          style: Styles
                                                              .itemNameText),
                                                      Text(datas.unit,
                                                          style:
                                                              Styles.unitText),
                                                    ],
                                                  ),
                                                ),
                                                Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      if (thedayPrice >
                                                          agoPrice)
                                                        Container(
                                                            margin:
                                                                EdgeInsets.all(
                                                                    10),
                                                            child: Row(
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .arrow_drop_up_outlined,
                                                                  size: 25,
                                                                  color: Palette
                                                                      .increaseColor,
                                                                ),
                                                                Text(
                                                                  datas.dpr1 +
                                                                      "원",
                                                                  style: Styles
                                                                      .dprUpText,
                                                                ),
                                                              ],
                                                            ))
                                                      else
                                                        Container(
                                                            margin:
                                                                EdgeInsets.all(
                                                                    10),
                                                            child: Row(
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .arrow_drop_down,
                                                                  size: 25,
                                                                  color: Palette
                                                                      .decreaseColor,
                                                                ),
                                                                Text(
                                                                  datas.dpr1 +
                                                                      "원",
                                                                  style: Styles
                                                                      .dprDownText,
                                                                ),
                                                              ],
                                                            ))
                                                    ])
                                              ]))));
                            } else {
                              return SizedBox.shrink();
                            }
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
                child: new FutureBuilder<PriceList>(
                    future: futureDaily,
                    builder: (BuildContext context, snapshot) {
                      if (snapshot.hasData) {
                        var items = snapshot.data!.price;
                        return ListView.builder(
                          scrollDirection: Axis.vertical,
                          padding: EdgeInsets.zero,
                          itemCount: items == null ? 0 : items.length,
                          itemBuilder: (BuildContext context, int index) {
                            var datas = items![index];
                            late int thedayPrice =
                                int.parse('${datas.dpr1.replaceAll(",", "")}');
                            late int agoPrice =
                                int.parse('${datas.dpr2.replaceAll(",", "")}');
                            if (datas.categoryName == "축산물") {
                              return SizedBox(
                                  height: 80,
                                  child: Card(
                                      shadowColor: Palette.shadowColor,
                                      elevation: 3,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 7),
                                      child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ComparePage(
                                                            title:
                                                                'ComparePage',
                                                            items: datas)));
                                          },
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.all(10),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(datas.itemName,
                                                          style: Styles
                                                              .itemNameText),
                                                      Text(datas.unit,
                                                          style:
                                                              Styles.unitText),
                                                    ],
                                                  ),
                                                ),
                                                Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      if (thedayPrice >
                                                          agoPrice)
                                                        Container(
                                                            margin:
                                                                EdgeInsets.all(
                                                                    10),
                                                            child: Row(
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .arrow_drop_up_outlined,
                                                                  size: 25,
                                                                  color: Palette
                                                                      .increaseColor,
                                                                ),
                                                                Text(
                                                                  datas.dpr1 +
                                                                      "원",
                                                                  style: Styles
                                                                      .dprUpText,
                                                                ),
                                                              ],
                                                            ))
                                                      else
                                                        Container(
                                                            margin:
                                                                EdgeInsets.all(
                                                                    10),
                                                            child: Row(
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .arrow_drop_down_outlined,
                                                                  size: 25,
                                                                  color: Palette
                                                                      .decreaseColor,
                                                                ),
                                                                Text(
                                                                  datas.dpr1 +
                                                                      "원",
                                                                  style: Styles
                                                                      .dprDownText,
                                                                ),
                                                              ],
                                                            ))
                                                    ])
                                              ]))));
                            } else {
                              return SizedBox.shrink();
                            }
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
              child: new FutureBuilder<PriceList>(
                  future: futureDaily,
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.hasData) {
                      var items = snapshot.data!.price;
                      return ListView.builder(
                        scrollDirection: Axis.vertical,
                        padding: EdgeInsets.zero,
                        itemCount: items == null ? 0 : items.length,
                        itemBuilder: (BuildContext context, int index) {
                          var datas = items![index];
                          late int thedayPrice =
                              int.parse('${datas.dpr1.replaceAll(",", "")}');
                          late int agoPrice =
                              int.parse('${datas.dpr2.replaceAll(",", "")}');
                          if (datas.categoryName == "수산물") {
                            return SizedBox(
                                height: 80,
                                child: Card(
                                    shadowColor: Palette.shadowColor,
                                    elevation: 3,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 7),
                                    child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ComparePage(
                                                          title: 'ComparePage',
                                                          items: datas)));
                                        },
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.all(10),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(datas.itemName,
                                                        style: Styles
                                                            .itemNameText),
                                                    Text(datas.unit,
                                                        style: Styles.unitText),
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    if (thedayPrice > agoPrice)
                                                      Container(
                                                          margin:
                                                              EdgeInsets.all(
                                                                  10),
                                                          child: Row(
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .arrow_drop_up_outlined,
                                                                size: 25,
                                                                color: Palette
                                                                    .increaseColor,
                                                              ),
                                                              Text(
                                                                datas.dpr1 +
                                                                    "원",
                                                                style: Styles
                                                                    .dprUpText,
                                                              ),
                                                            ],
                                                          ))
                                                    else
                                                      Container(
                                                          margin:
                                                              EdgeInsets.all(
                                                                  10),
                                                          child: Row(
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .arrow_drop_down_outlined,
                                                                size: 25,
                                                                color: Palette
                                                                    .decreaseColor,
                                                              ),
                                                              Text(
                                                                datas.dpr1 +
                                                                    "원",
                                                                style: Styles
                                                                    .dprDownText,
                                                              ),
                                                            ],
                                                          ))
                                                  ])
                                            ]))));
                          } else {
                            return SizedBox.shrink();
                          }
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return const CircularProgressIndicator();
                  }),
            )),
            Tab(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                child: new FutureBuilder<PriceList>(
                    future: futureDaily,
                    builder: (BuildContext context, snapshot) {
                      if (snapshot.hasData) {
                        var items = snapshot.data!.price;
                        // final items = snapshot.data!.price;
                        // items == null ? null : "000";
                        return ListView.builder(
                          scrollDirection: Axis.vertical,
                          padding: EdgeInsets.zero,
                          itemCount: items == null ? 0 : items.length,
                          itemBuilder: (BuildContext context, int index) {
                            var datas = items![index];
                            late int thedayPrice =
                                int.parse('${datas.dpr1.replaceAll(",", "")}');
                            late String agoDay = datas.dpr2 == "[]"
                                ? datas.dpr2 = '0'
                                : datas.dpr2;
                            late int agoPrice =
                                int.parse('${agoDay.replaceAll(",", "")}');

                            if (datas.categoryName == "과일류") {
                              return SizedBox(
                                  height: 80,
                                  child: Card(
                                      shadowColor: Palette.shadowColor,
                                      elevation: 3,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 7),
                                      child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ComparePage(
                                                            title:
                                                                'ComparePage',
                                                            items: datas)));
                                          },
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.all(10),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(datas.itemName,
                                                          style: Styles
                                                              .itemNameText),
                                                      Text(datas.unit,
                                                          style:
                                                              Styles.unitText),
                                                    ],
                                                  ),
                                                ),
                                                Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      if (thedayPrice >
                                                          agoPrice)
                                                        Container(
                                                            margin:
                                                                EdgeInsets.all(
                                                                    10),
                                                            child: Row(
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .arrow_drop_up_outlined,
                                                                  size: 25,
                                                                  color: Palette
                                                                      .increaseColor,
                                                                ),
                                                                Text(
                                                                  datas.dpr1 +
                                                                      "원",
                                                                  style: Styles
                                                                      .dprUpText,
                                                                ),
                                                              ],
                                                            ))
                                                      else
                                                        Container(
                                                            margin:
                                                                EdgeInsets.all(
                                                                    10),
                                                            child: Row(
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .arrow_drop_down_outlined,
                                                                  size: 25,
                                                                  color: Palette
                                                                      .decreaseColor,
                                                                ),
                                                                Text(
                                                                  datas.dpr1 +
                                                                      "원",
                                                                  style: Styles
                                                                      .dprDownText,
                                                                ),
                                                              ],
                                                            ))
                                                    ])
                                              ]))));
                            } else {
                              return SizedBox.shrink();
                            }
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
                child: new FutureBuilder<PriceList>(
                    future: futureDaily,
                    builder: (BuildContext context, snapshot) {
                      if (snapshot.hasData) {
                        var items = snapshot.data!.price;
                        return ListView.builder(
                          scrollDirection: Axis.vertical,
                          padding: EdgeInsets.zero,
                          itemCount: items == null ? 0 : items.length,
                          itemBuilder: (BuildContext context, int index) {
                            var datas = items![index];
                            late int thedayPrice =
                                int.parse('${datas.dpr1.replaceAll(",", "")}');
                            late int agoPrice =
                                int.parse('${datas.dpr2.replaceAll(",", "")}');
                            if (datas.categoryName == "채소류") {
                              return SizedBox(
                                  height: 80,
                                  child: Card(
                                      shadowColor: Palette.shadowColor,
                                      elevation: 3,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 7),
                                      child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ComparePage(
                                                            title:
                                                                'ComparePage',
                                                            items: datas)));
                                          },
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.all(10),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(datas.itemName,
                                                          style: Styles
                                                              .itemNameText),
                                                      Text(datas.unit,
                                                          style:
                                                              Styles.unitText),
                                                    ],
                                                  ),
                                                ),
                                                Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      if (thedayPrice >
                                                          agoPrice)
                                                        Container(
                                                            margin:
                                                                EdgeInsets.all(
                                                                    10),
                                                            child: Row(
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .arrow_drop_up_outlined,
                                                                  size: 25,
                                                                  color: Palette
                                                                      .increaseColor,
                                                                ),
                                                                Text(
                                                                  datas.dpr1 +
                                                                      "원",
                                                                  style: Styles
                                                                      .dprUpText,
                                                                ),
                                                              ],
                                                            ))
                                                      else
                                                        Container(
                                                            margin:
                                                                EdgeInsets.all(
                                                                    10),
                                                            child: Row(
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .arrow_drop_down_outlined,
                                                                  size: 25,
                                                                  color: Palette
                                                                      .decreaseColor,
                                                                ),
                                                                Text(
                                                                  datas.dpr1 +
                                                                      "원",
                                                                  style: Styles
                                                                      .dprDownText,
                                                                ),
                                                              ],
                                                            ))
                                                    ])
                                              ]))));
                            } else {
                              return SizedBox.shrink();
                            }
                          },
                        );
                      } else if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      }
                      return const CircularProgressIndicator();
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
