import 'dart:convert';

import 'package:movas_example/movas/services/responses/feed_item.dart';

class FeedItemO {
  FeedItemO({
    this.item,
  });
  final FeedItem item;

  factory FeedItemO.fromE(FeedItem feedItem) => FeedItemO(
          item: FeedItem(
        id: feedItem.id,
        userId: feedItem.userId,
        title: feedItem.title,
        body: feedItem.body,
      ));

  FeedItemO copyWith({
    FeedItem item,
  }) {
    return FeedItemO(
      item: item ?? this.item,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'item': item?.toMap(),
    };
  }

  factory FeedItemO.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return FeedItemO(
      item: FeedItem.fromMap(map['item']),
    );
  }

  String toJson() => json.encode(toMap());

  factory FeedItemO.fromJson(String source) =>
      FeedItemO.fromMap(json.decode(source));

  @override
  String toString() => 'FeedItemO(item: $item)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is FeedItemO && o.item == item;
  }

  @override
  int get hashCode => item.hashCode;
}
