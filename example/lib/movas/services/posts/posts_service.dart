import 'package:movas_example/movas/services/responses/feed_items.dart';
import 'package:rxdart/rxdart.dart';

abstract class PostsService {
  PostsService(this.feedItemsResponse$);

  final PublishSubject<FeedItemsResponse> feedItemsResponse$;

  Future<void> getPosts();
}
