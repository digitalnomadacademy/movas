import 'package:movas/provider/provider.dart';
import 'package:movas_example/movas/services/posts/posts_service.dart';

class FeedItemsA {
  FeedItemsA(this.postsService);

  final PostsService postsService;

  Future<void> getPosts() {
    return postsService.getPosts();
  }

  factory FeedItemsA.of(context) => FeedItemsA(
        StaticProvider.of(context),
      );
}
