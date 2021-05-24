import 'dart:math';

extension ListExt<T> on List<T> {
  T get randomElement {
    try {
      return this.elementAt(Random().nextInt(this.length));
    } catch (e) {
      return null;
    }
  }

  T get firstOrNull {
    T first;
    try {
      first = this.first;
    } catch (e) {}

    return first;
  }

  List<T> multiply(int factor) {
    List<T> newList = [];
    for (int i = 0; i < factor; i++) {
      newList.addAll(this);
    }
    return newList;
  }
}
