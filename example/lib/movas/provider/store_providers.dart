import 'package:movas/provider/provider.dart';
import 'package:movas_example/movas/observables/feed_items_observable.dart';
import 'package:movas_example/movas/stores/feed_items_store.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> storeProviders = [
  StoreProvider<FeedItemsStore, FeedItemsO>(
    storeBuilder: (context) => FeedItemsStore(
      StaticProvider.of(context),
    ),
  ),
];
