import 'package:facebook_clone/data/data.dart';
import 'package:facebook_clone/screens/home_screen.dart';
import 'package:facebook_clone/widgets/custom_app_bar.dart';
import 'package:facebook_clone/widgets/custom_tab_bar.dart';
import 'package:facebook_clone/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
 
 class NavScreen extends StatefulWidget {

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(), 
  ];
  final List<IconData> _icons = const [
    Icons.home,
    Icons.ondemand_video,
    FontAwesomeIcons.userCircle, // instead of MdiIcons.accountCircleOutline
    FontAwesomeIcons.users, // instead of MdiIcons.accountGroupOutline
    FontAwesomeIcons.bell, 
    Icons.menu,
  ];

  int _selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return DefaultTabController(
      length: _icons.length, 
      child: Scaffold(
        appBar: Responsive.isDesktop(context) ? PreferredSize(
          preferredSize: Size(screenSize.width, 100.0),
          child: CustomAppBar(
            currentUser: currentUser,
            icons: _icons,
            selectedIndex: _selectedIndex,
            onTap: (index) => setState(() => _selectedIndex = index),
          ),
        )
        : null,
        body: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
        bottomNavigationBar: !Responsive.isDesktop(context) ? Container(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: CustomTabBar(
  icons: _icons,
  selectedIndex: _selectedIndex,
  onTap: (index) => setState(() => _selectedIndex = index),
  isBottomIndicator: false, // or true if you want the indicator
),

        ) : const SizedBox.shrink(),
        )
      );
  }
}