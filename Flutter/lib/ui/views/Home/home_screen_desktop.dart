import 'package:Greeneva/ui/views/Info/help_page.dart';
import 'package:Greeneva/ui/widgets/target_home/target_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_scrollbar/flutter_web_scrollbar.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:Greeneva/extensions/hover_extension.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:Greeneva/Services/navigation_service.dart';
import 'package:Greeneva/constants/routename.dart';
import 'package:Greeneva/locator.dart';

import '../../../constants/routename.dart';

class HomeContentDesktop extends StatefulWidget {
  const HomeContentDesktop({Key key}) : super(key: key);

  @override
  _HomeContentDesktopState createState() => _HomeContentDesktopState();
}

class _HomeContentDesktopState extends State<HomeContentDesktop>
    with SingleTickerProviderStateMixin {
  ScrollController _controller;

  TabController tabController;

  @override
  void initState() {
    super.initState();
    setState(() {
      _controller = ScrollController();
    });
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  void scrollCallBack(DragUpdateDetails dragUpdate) {
    setState(() {
      // Note: 3.5 represents the theoretical height of all my scrollable content. This number will vary for you.
      _controller.position.moveTo(dragUpdate.globalPosition.dy * 3.5);
    });
  }

  TabBar _getTabBar() {
    return TabBar(
      indicatorSize: TabBarIndicatorSize.tab,
      isScrollable: true,
      unselectedLabelColor: Colors.green,
      unselectedLabelStyle: TextStyle(color: Colors.green),
      // labelPadding: EdgeInsets.symmetric(horizontal: 10.0),
      tabs: <Widget>[
        Container(
          height: 30,
          width: 70,
          child: Text(
            'Goals',
            style: TextStyle(color: Colors.black),
          ),
        ),
        Container(
          height: 30,
          width: 70,
          child: Text(
            'Data',
            style: TextStyle(color: Colors.black),
          ),
        ),
        Container(
          height: 30,
          // width: 70,
          child: Text(
            'Our Targets',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
      controller: tabController,
    );
  }

  TabBarView _getTabBarView(tabs) {
    return TabBarView(
      children: tabs,
      controller: tabController,
    );
  }

  @override
  Widget build(BuildContext context) {
    final NavigationService _navigationService = locator<NavigationService>();
    String mapdata = """
      <iframe src="https://ourworldindata.org/grapher/share-of-the-population-living-in-extreme-poverty?region=World" loading="lazy" style="width: 100%; height: 600px; border: 0px none;"></iframe>
      """;
    String treepn = """
      <iframe src="https://ourworldindata.org/grapher/proportion-of-forest-area-within-legally-established-protected-areas?time=2015" loading="lazy" style="width: 100%; height: 600px; border: 0px none;"></iframe>
      """;
    return SingleChildScrollView(
      controller: _controller,
      child: Container(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Container(
              child: Text('Quick Stats'),
              alignment: Alignment.topLeft,
            ),
            SizedBox(
              height: 30,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    child: Container(
                      child: Card(
                        color: Colors.white,
                        elevation: 2,
                        child: SizedBox(
                          width: 310,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 140,
                                child: WebsafeSvg.asset(
                                  'assets/HomePage_1.svg',
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15.0,
                                  vertical: 20,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Center(
                                      child: Text(
                                        'Communities',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14,
                                        ),
                                        softWrap: true,
                                      ),
                                    ),
                                    // Text(
                                    //   '',
                                    //   // '${model.targets["1.1.1"]["name"]}',
                                    //   style: TextStyle(fontSize: 10),
                                    // )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ).showCursorOnHover.moveUpOnHover,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 15,
                  ),
                  GestureDetector(
                      child: Container(
                        child: Card(
                          color: Colors.white,
                          elevation: 2,
                          child: SizedBox(
                            width: 310,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: 140,
                                  child: WebsafeSvg.asset(
                                    'assets/HomePage_2.svg',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0,
                                    vertical: 20,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Center(
                                        child: Text(
                                          'Sustanable Development Goals',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14,
                                          ),
                                          softWrap: true,
                                        ),
                                      ),
                                      // Text(
                                      //   '',
                                      //   // '${model.targets["1.1.1"]["name"]}',
                                      //   style: TextStyle(fontSize: 10),
                                      // )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ).showCursorOnHover.moveUpOnHover,
                      ),
                      onTap: () => _navigationService.navigateTo(Help)),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 15,
                  ),
                  Container(
                    child: Card(
                      color: Colors.white,
                      elevation: 2,
                      child: SizedBox(
                        width: 310,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 140,
                              child: WebsafeSvg.asset(
                                'assets/HomePage_3.svg',
                                fit: BoxFit.contain,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15.0,
                                vertical: 20,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Center(
                                    child: Text(
                                      'Get Educated',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                      ),
                                      softWrap: true,
                                    ),
                                  ),
                                  // Text(
                                  //   '',
                                  //   // '${model.targets["1.1.1"]["name"]}',
                                  //   style: TextStyle(fontSize: 10),
                                  // )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ).showCursorOnHover.moveUpOnHover,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              child: _getTabBar(),
              alignment: Alignment.topLeft,
            ),
            Container(
              // width: 10,
              height: MediaQuery.of(context).size.height * 3,
              child: _getTabBarView(
                <Widget>[
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              child: Text('Targets'),
                              alignment: Alignment.topLeft,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 5,
                            ),
                            Row(
                              children: [
                                Container(
                                    child: Text('View All'),
                                    alignment: Alignment.topRight),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 12,
                                )
                              ],
                            )
                          ],
                        ),
                        TargetHome()
                      ],
                    ),
                  ),
                  Container(
                    child: HtmlWidget(mapdata),
                  ),
                  Container(
                    child: HtmlWidget(treepn),
                  ),
                  // Icon(Icons.home),
                  // Icon(Icons.home),
                  // Icon(Icons.settings),
                ],
              ),
            ),
            FlutterWebScroller(
              //Pass a reference to the ScrollCallBack function into the scrollbar
              scrollCallBack,

              //Add optional values
              scrollBarBackgroundColor: Colors.white,
              scrollBarWidth: 20.0,
              dragHandleColor: Colors.red,
              dragHandleBorderRadius: 2.0,
              dragHandleHeight: 40.0,
              dragHandleWidth: 15.0,
            ),
          ],
        ),
      ),
    );
  }
}
