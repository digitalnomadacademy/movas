import 'package:flutter/material.dart';
import 'package:movas/movas.dart';
import 'package:movas_example/movas/services/posts/posts_service.dart';

class BootstrapAction {
  final PostsService postsService;

  BootstrapAction(this.postsService);

  factory BootstrapAction.of(BuildContext context) =>
      BootstrapAction(StaticProvider.of(context));

  Future<void> initializeApp() async {
    await postsService.getPosts();
    return;
  }
}
