import 'package:flutter/material.dart';

class DemoPage extends StatefulWidget {
  final Map<String, WidgetBuilder> testRoutes;
  final Map<String, WidgetBuilder> routes;
  final Widget? devDrawer;

  DemoPage({
    required this.testRoutes,
    required this.routes,
    this.devDrawer,
  });

  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage>
    with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'ROUTES'),
    Tab(text: 'DEMO'),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(vsync: this, length: myTabs.length, initialIndex: 0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: widget.devDrawer,
      appBar: AppBar(
        title: TabBar(
          controller: _tabController,
          tabs: myTabs,
        ),
      ),
      body: TabBarView(controller: _tabController, children: <Widget>[
        _RouteListView(
          routes: widget.routes,
        ),
        _RouteListView(
          routes: widget.testRoutes,
        ),
      ]),
    );
  }
}

class _RouteListView extends StatelessWidget {
  final Map<String, WidgetBuilder> routes;

  const _RouteListView({
    required this.routes,
  });

  @override
  Widget build(BuildContext context) => ListView(
        children: routes.keys
            .map((routeName) => Card(
                  child: ListTile(
                    title: Text(routeName),
                    onTap: () => Navigator.pushNamed(context, routeName),
                  ),
                ))
            .toList(),
      );
}
