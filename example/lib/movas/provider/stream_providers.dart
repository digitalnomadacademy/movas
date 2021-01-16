import 'package:movas_example/movas/services/responses/feed_items.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:rxdart/rxdart.dart';

List<SingleChildWidget> streamProviders = [
  Provider<PublishSubject<FeedItemsResponse>>(
    lazy: false,
    dispose: (_, stream) => stream.close(),
    create: (context) => PublishSubject(sync: true),
  ),
];
