import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:movas_example/movas/services/responses/feed_item.dart';

class FeedItemsResponse {
  FeedItemsResponse({
    this.items,
  });

  final List<FeedItem> items;

  factory FeedItemsResponse.fromList(data) => FeedItemsResponse(
      items: (data as List).map((item) => FeedItem.fromMap(item)).toList());

  FeedItemsResponse copyWith({
    List<FeedItem> items,
  }) {
    return FeedItemsResponse(
      items: items ?? this.items,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'items': items?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory FeedItemsResponse.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return FeedItemsResponse(
      items: List<FeedItem>.from(map['items']?.map((x) => FeedItem.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory FeedItemsResponse.fromJson(String source) =>
      FeedItemsResponse.fromMap(json.decode(source));

  @override
  String toString() => 'FeedItemsResponse(items: $items)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is FeedItemsResponse && listEquals(o.items, items);
  }

  @override
  int get hashCode => items.hashCode;
}
