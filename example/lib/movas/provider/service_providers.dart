import 'package:movas/provider/provider.dart';
import 'package:movas_example/movas/services/app_http_service.dart';
import 'package:movas_example/movas/services/posts/posts_service.dart';
import 'package:movas_example/movas/services/posts/prod_posts_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> serviceProviders = [
  Provider<AppHttpService>(
    create: (context) => AppHttpService(),
  ),

  // To switch the service, we only need to provide mock service instead of prod service
  Provider<PostsService>(
    create: (context) => ProdPostsService(
      StaticProvider.of(context),
      StaticProvider.of(context),
    ),
  ),
  // Provider<PostsService>(
  //   create: (context) => MockPostsService(
  //     StaticProvider.of(context),
  //   ),
  // ),
];
