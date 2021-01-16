import 'package:movas_example/data/dummy_feed_items.dart';
import 'package:movas_example/movas/services/posts/posts_service.dart';
import 'package:movas_example/movas/services/responses/feed_items.dart';
import 'package:rxdart/rxdart.dart';

class MockPostsService extends PostsService {
  MockPostsService(PublishSubject<FeedItemsResponse> feedItemsResponse$)
      : super(feedItemsResponse$);

  @override
  Future<void> getPosts() async {
    final feedItemsResponse = FeedItemsResponse.fromList(dummyFeedItems);
    return feedItemsResponse$.add(feedItemsResponse);
  }
}
