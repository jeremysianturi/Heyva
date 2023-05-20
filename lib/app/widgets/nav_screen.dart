import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:heyva/app/modules/home/views/home_view.dart';
import 'package:heyva/app/modules/insights/views/insights_view.dart';
import 'package:heyva/app/modules/learn/views/learn_view.dart';
import 'package:heyva/app/modules/recovery/views/recovery_view.dart';
import 'package:heyva/app/routes/app_pages.dart';
import 'package:heyva/constant/strings.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../../constant/colors.dart';

BuildContext? testContext;

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key, required this.menuScreenContext})
      : super(key: key);
  final BuildContext menuScreenContext;

  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  late PersistentTabController _controller;
  late bool _hideNavBar;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController();
    _hideNavBar = false;
  }

  List<Widget> _buildScreens() => [
        HomeView(
          menuScreenContext: widget.menuScreenContext,
          hideStatus: _hideNavBar,
          onScreenHideButtonPressed: () {
            setState(() {
              _hideNavBar = !_hideNavBar;
            });
          },
        ),
        RecoveryView(
          menuScreenContext: widget.menuScreenContext,
          hideStatus: _hideNavBar,
          onScreenHideButtonPressed: () {
            setState(() {
              _hideNavBar = !_hideNavBar;
            });
          },
        ),
        MainScreen(
          menuScreenContext: widget.menuScreenContext,
          hideStatus: _hideNavBar,
          onScreenHideButtonPressed: () {
            setState(() {
              _hideNavBar = !_hideNavBar;
            });
          },
        ),
        LearnView(
          menuScreenContext: widget.menuScreenContext,
          hideStatus: _hideNavBar,
          onScreenHideButtonPressed: () {
            setState(() {
              _hideNavBar = !_hideNavBar;
            });
          },
        ),
        InsightsView(
          menuScreenContext: widget.menuScreenContext,
          hideStatus: _hideNavBar,
          onScreenHideButtonPressed: () {
            setState(() {
              _hideNavBar = !_hideNavBar;
            });
          },
        ),
      ];

  List<PersistentBottomNavBarItem> _navBarsItems() => [
        PersistentBottomNavBarItem(
            icon: SvgPicture.asset(
              "assets/images/ic_home_fill.svg",
              width: 24,
              height: 24,
            ),
            inactiveIcon: SvgPicture.asset(
              "assets/images/ic_home.svg",
              width: 24,
              height: 24,
              color: ColorApp.blue_container.withOpacity(0.4),
            ),
            title: Strings.home,
            activeColorPrimary: ColorApp.blue_container,
            inactiveColorPrimary: Colors.grey,
            inactiveColorSecondary: Colors.purple),
        PersistentBottomNavBarItem(
          icon: SvgPicture.asset(
            "assets/images/ic_recovery_fill.svg",
            width: 24,
            height: 24,
          ),
          inactiveIcon: SvgPicture.asset(
            "assets/images/ic_recovery.svg",
            width: 24,
            height: 24,
            color: ColorApp.blue_container.withOpacity(0.4),
          ),
          title: Strings.recovery,
          activeColorPrimary: ColorApp.blue_container,
          inactiveColorPrimary: Colors.grey,
          // routeAndNavigatorSettings: RouteAndNavigatorSettings(
          //   initialRoute: "/",
          //   routes: {
          //     // "/first": (final context) => const MainScreen2(),
          //     // "/second": (final context) => const MainScreen3(),
          //   },
          // ),
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(
            Icons.add,
            color: ColorApp.text_input_bg,
          ),
          activeColorPrimary: ColorApp.btn_orange,
          inactiveColorPrimary: ColorApp.btn_orange,
          onPressed: (val) {
            Get.toNamed(Routes.MOOD_TRACKER);
          },
          routeAndNavigatorSettings: RouteAndNavigatorSettings(
            initialRoute: "/",
            routes: {
              // "/first": (final context) => const MainScreen2(),
              // "/second": (final context) => const MainScreen3(),
            },
          ),
        ),
        PersistentBottomNavBarItem(
          icon: SvgPicture.asset(
            "assets/images/ic_learn_fill.svg",
            width: 24,
            height: 24,
          ),
          inactiveIcon: SvgPicture.asset(
            "assets/images/ic_learn.svg",
            width: 24,
            height: 24,
            color: ColorApp.blue_container.withOpacity(0.4),
          ),
          title: Strings.learn,
          activeColorPrimary: ColorApp.blue_container,
          inactiveColorPrimary: Colors.grey,
          routeAndNavigatorSettings: RouteAndNavigatorSettings(
            initialRoute: "/",
            routes: {
              // "/first": (final context) => const MainScreen2(),
              // "/second": (final context) => const MainScreen3(),
            },
          ),
        ),
        PersistentBottomNavBarItem(
          icon: SvgPicture.asset(
            "assets/images/ic_insight_fill.svg",
            width: 24,
            height: 24,
          ),
          inactiveIcon: SvgPicture.asset(
            "assets/images/ic_insight.svg",
            width: 24,
            height: 24,
            color: ColorApp.blue_container.withOpacity(0.4),
          ),
          title: Strings.insights,
          activeColorPrimary: ColorApp.blue_container,
          inactiveColorPrimary: Colors.grey,
          routeAndNavigatorSettings: RouteAndNavigatorSettings(
            initialRoute: "/",
            routes: {
              // "/first": (final context) => const MainScreen2(),
              // "/second": (final context) => const MainScreen3(),
            },
          ),
        ),
      ];

  @override
  Widget build(final BuildContext context) => Scaffold(
        // drawer: Drawer(
        //   child: Center(
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: const <Widget>[
        //         Text("This is the Drawer"),
        //       ],
        //     ),
        //   ),
        // ),
        body: PersistentTabView(
          context,
          controller: _controller,
          screens: _buildScreens(),
          items: _navBarsItems(),
          resizeToAvoidBottomInset: true,
          navBarHeight: 80,
          bottomScreenMargin: 0,
          padding: NavBarPadding.only(bottom: 20),
          selectedTabScreenContext: (final context) {
            testContext = context;
          },
          confineInSafeArea: false,
          backgroundColor: ColorApp.bottom_nav_color,
          hideNavigationBar: _hideNavBar,
          decoration: const NavBarDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(14),
              topRight: Radius.circular(14),
            ),
          ),
          itemAnimationProperties: const ItemAnimationProperties(
            duration: Duration(milliseconds: 400),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            animateTabTransition: true,
          ),
          navBarStyle: NavBarStyle.style15,
        ),
      );
}

class MainScreen extends StatelessWidget {
  const MainScreen(
      {Key? key,
      required this.menuScreenContext,
      required this.onScreenHideButtonPressed,
      this.hideStatus = false})
      : super(key: key);
  final BuildContext menuScreenContext;
  final VoidCallback onScreenHideButtonPressed;
  final bool hideStatus;

  @override
  Widget build(final BuildContext context) => SingleChildScrollView(
        child: SizedBox(),

        // SizedBox(
        //   height: MediaQuery.of(context).size.height,
        //   width: MediaQuery.of(context).size.width,
        //   child: Scaffold(
        //     backgroundColor: Colors.indigo,
        //     body: Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: <Widget>[
        //         const Padding(
        //           padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        //           child: TextField(
        //             decoration: InputDecoration(hintText: "Test Text Field"),
        //           ),
        //         ),
        //         Center(
        //           child: ElevatedButton(
        //             onPressed: () {
        //               PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
        //                 context,
        //                 settings: const RouteSettings(name: "/home"),
        //                 screen: const MainScreen2(),
        //                 pageTransitionAnimation:
        //                     PageTransitionAnimation.scaleRotate,
        //               );
        //             },
        //             child: const Text(
        //               "Go to Second Screen ->",
        //               style: TextStyle(color: Colors.white),
        //             ),
        //           ),
        //         ),
        //         Center(
        //           child: ElevatedButton(
        //             onPressed: () {
        //               showModalBottomSheet(
        //                 context: context,
        //                 backgroundColor: Colors.white,
        //                 useRootNavigator: true,
        //                 builder: (final context) => Center(
        //                   child: ElevatedButton(
        //                     onPressed: () {
        //                       Navigator.pop(context);
        //                     },
        //                     child: const Text(
        //                       "Exit",
        //                       style: TextStyle(color: Colors.white),
        //                     ),
        //                   ),
        //                 ),
        //               );
        //             },
        //             child: const Text(
        //               "Push bottom sheet on TOP of Nav Bar",
        //               style: TextStyle(color: Colors.white),
        //             ),
        //           ),
        //         ),
        //         Center(
        //           child: ElevatedButton(
        //             onPressed: () {
        //               showModalBottomSheet(
        //                 context: context,
        //                 backgroundColor: Colors.white,
        //                 useRootNavigator: false,
        //                 builder: (final context) => Center(
        //                   child: ElevatedButton(
        //                     onPressed: () {
        //                       Navigator.pop(context);
        //                     },
        //                     child: const Text(
        //                       "Exit",
        //                       style: TextStyle(color: Colors.white),
        //                     ),
        //                   ),
        //                 ),
        //               );
        //             },
        //             child: const Text(
        //               "Push bottom sheet BEHIND the Nav Bar",
        //               style: TextStyle(color: Colors.white),
        //             ),
        //           ),
        //         ),
        //         Center(
        //           child: ElevatedButton(
        //             onPressed: () {
        //               // PersistentNavBarNavigator.pushDynamicScreen(context,
        //               //     screen: SampleModalScreen(), withNavBar: true);
        //             },
        //             child: const Text(
        //               "Push Dynamic/Modal Screen",
        //               style: TextStyle(color: Colors.white),
        //             ),
        //           ),
        //         ),
        //         Center(
        //           child: ElevatedButton(
        //             onPressed: onScreenHideButtonPressed,
        //             child: Text(
        //               hideStatus
        //                   ? "Unhide Navigation Bar"
        //                   : "Hide Navigation Bar",
        //               style: const TextStyle(color: Colors.white),
        //             ),
        //           ),
        //         ),
        //         Center(
        //           child: ElevatedButton(
        //             onPressed: () {
        //               Navigator.of(menuScreenContext).pop();
        //             },
        //             child: const Text(
        //               "<- Main Menu",
        //               style: TextStyle(color: Colors.white),
        //             ),
        //           ),
        //         ),
        //         const SizedBox(
        //           height: 60,
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
      );
}

class MainScreen2 extends StatelessWidget {
  const MainScreen2({Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) => Scaffold(
        backgroundColor: Colors.teal,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  pushNewScreen(context, screen: const MainScreen3());
                },
                child: const Text(
                  "Go to Third Screen",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Go Back to First Screen",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      );
}

class MainScreen3 extends StatelessWidget {
  const MainScreen3({Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) => Scaffold(
        backgroundColor: Colors.deepOrangeAccent,
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              "Go Back to Second Screen",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      );
}

// BottomNavigationBar(
//   items: [
//     BottomNavigationBarItem(
//         icon: Image.asset("assets/images/ic_home.png"),
//         activeIcon: Image.asset("assets/images/ic_home.png"),
//         label: Strings.home),
//     BottomNavigationBarItem(
//         icon: Image.asset("assets/images/ic_recovery.png"),
//         activeIcon: Image.asset("assets/images/ic_recovery.png"),
//         label: Strings.recovery),
//     BottomNavigationBarItem(
//         icon: Image.asset("assets/images/ic_learn.png"),
//         activeIcon: Image.asset("assets/images/ic_learn.png"),
//         label: Strings.learn),
//     BottomNavigationBarItem(
//         icon: Image.asset("assets/images/ic_insights.png"),
//         activeIcon: Image.asset("assets/images/ic_insights.png"),
//         label: Strings.insights),
//   ],
// ),
