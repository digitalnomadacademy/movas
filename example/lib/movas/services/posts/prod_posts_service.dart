import 'package:movas_example/movas/services/app_http_service.dart';
import 'package:movas_example/movas/services/posts/posts_service.dart';
import 'package:movas_example/movas/services/responses/feed_items.dart';
import 'package:rxdart/rxdart.dart';

class ProdPostsService extends PostsService {
  ProdPostsService(
      this.appHttpService, PublishSubject<FeedItemsResponse> feedItemsResponse$)
      : super(feedItemsResponse$);
  final AppHttpService appHttpService;

  @override
  Future<void> getPosts() async {
    final response = await appHttpService.getPosts();
    final feedItemsResponse = FeedItemsResponse.fromList(response.data);
    feedItemsResponse$.add(feedItemsResponse);
  }
}
