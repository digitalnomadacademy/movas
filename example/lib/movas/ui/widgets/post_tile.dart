import 'package:flutter/material.dart';
import 'package:movas_example/movas/observables/feed_item_observable.dart';

class PostTile extends StatelessWidget {
  const PostTile({
    Key key,
    @required this.feedItemO,
  }) : super(key: key);
  final FeedItemO feedItemO;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(feedItemO?.item?.userId?.toString() ?? ''),
      title: Text(feedItemO?.item?.title ?? ''),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(feedItemO?.item?.body ?? ''),
      ),
    );
  }
}
