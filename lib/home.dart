import 'package:flutter/material.dart';
import 'assets/colors/palette.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: [
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
            Tab(text: "rice"),
            Tab(text: "vegitables"),
            Tab(text: "Fruits"),
          ],
        ),
      ),
    );
  }
}
