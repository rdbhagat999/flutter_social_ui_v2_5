import 'package:flutter/material.dart';
import 'package:flutter_social_ui/data/data.dart';
import 'package:flutter_social_ui/widgets/custom_drawer.dart';
import 'package:flutter_social_ui/widgets/following_users.dart';
import 'package:flutter_social_ui/widgets/posts_carousel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
    _pageController = PageController(
      initialPage: 0,
      viewportFraction: 0.75,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        // brightness: Brightness.light,
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColor,
        ),
        title: Text(
          'Frenzzy'.toUpperCase(),
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            letterSpacing: 7.5,
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorWeight: 3.0,
          labelColor: Theme.of(context).primaryColor,
          labelStyle: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 3.5,
          ),
          unselectedLabelStyle: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.w600,
            fontSize: 16.0,
            letterSpacing: 3.5,
          ),
          tabs: const [
            Tab(
              text: 'Trending',
            ),
            Tab(
              text: 'Latest',
            ),
          ],
        ),
      ),
      drawer: const CustomDrawer(),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const FollowingUsers(),
          PostsCarousel(
              pageController: _pageController, title: 'Posts', posts: posts),
        ],
      ),
    );
  }
}
