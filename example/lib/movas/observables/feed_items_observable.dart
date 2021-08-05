import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:movas_example/movas/observables/feed_item_observable.dart';
import 'package:movas_example/movas/services/responses/feed_items.dart';

class FeedItemsO {
  FeedItemsO({
    this.items,
  });
  final List<FeedItemO> items;

  factory FeedItemsO.fromResponse(FeedItemsResponse response) {
    return FeedItemsO(
        items: response.items
            ?.map((feedItem) => FeedItemO.fromE(feedItem))
            ?.toList());
  }

  FeedItemsO copyWith({
    List<FeedItemO> items,
  }) {
    return FeedItemsO(
      items: items ?? this.items,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'items': items?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory FeedItemsO.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return FeedItemsO(
      items:
          List<FeedItemO>.from(map['items']?.map((x) => FeedItemO.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory FeedItemsO.fromJson(String source) =>
      FeedItemsO.fromMap(json.decode(source));

  @override
  String toString() => 'FeedItemsO(items: $items)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is FeedItemsO && listEquals(o.items, items);
  }

  @override
  int get hashCode => items.hashCode;
}
