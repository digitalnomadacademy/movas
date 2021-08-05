import 'package:movas/provider/provider.dart';
import 'package:movas_example/movas/observables/feed_items_observable.dart';
import 'package:movas_example/movas/services/responses/feed_items.dart';
import 'package:rxdart/rxdart.dart';

class FeedItemsStore extends Store<FeedItemsO> {
  final PublishSubject<FeedItemsResponse> feedItemsResponse$;

  FeedItemsStore(this.feedItemsResponse$) {
    listen(feedItemsResponse$, (feedItemsResponse) {
      add(FeedItemsO.fromResponse(feedItemsResponse));
    });
  }
}
