import 'package:flutter/material.dart';
import 'package:movas_example/movas/actions/bootstrap_action.dart';
import 'package:movas_example/movas/actions/feed_items_action.dart';
import 'package:movas_example/movas/observables/feed_items_observable.dart';
import 'package:movas_example/movas/ui/widgets/custom_loading_indicator.dart';
import 'package:movas_example/movas/ui/widgets/post_tile.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Posts')),
      ),
      body: RefreshIndicator(
        onRefresh: () => FeedItemsA.of(context).getPosts(),
        child: Center(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Consumer<FeedItemsO>(
                builder: (context, feedItemsO, _) => Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: feedItemsO?.items == null
                        ? CustomLoadingIndicator()
                        : ListView.separated(
                            itemBuilder: (context, index) =>
                                PostTile(feedItemO: feedItemsO?.items[index]),
                            separatorBuilder: (context, index) => Divider(),
                            itemCount: feedItemsO.items.length,
                          ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _initializeApp() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BootstrapAction.of(context).initializeApp();
    });
  }
}
