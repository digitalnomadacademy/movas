import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

///Use this provider to get current provided file, without listening for changes
///
/// Very handy to provide dependencies quickly for store, actions or smth
class StaticProvider {
  static T of<T>(BuildContext context) =>
      Provider.of<T>(context, listen: false);
}

/// [T] Is Store that you are providing, and [U] is observable
class StoreProvider<T extends BaseStore, U> extends MultiProvider {
  final Widget? child;
  final T Function(BuildContext) storeBuilder;

  StoreProvider({
    this.child,
    required this.storeBuilder,
  }) : super(
          child: child,
          providers: [
            Provider<T>(
              create: storeBuilder,
              lazy: false,
              dispose: (context, store) => store.dispose(),
            ),
            StreamProvider<U>(
              lazy: false,
              create: (context) =>
                  StaticProvider.of<T>(context).o$[U] as BehaviorSubject<U>,
              initialData: BehaviorSubject<U>().value,
            )
          ],
        );
}

/// [T] Is Store that you are providing, and [U] and [I] are observables
class StoreProvider2<T extends BaseStore, U, I> extends MultiProvider {
  final Widget? child;
  final T Function(BuildContext) storeBuilder;

  StoreProvider2({
    this.child,
    required this.storeBuilder,
  })  : assert(U != I),
        super(
          child: child,
          providers: [
            Provider<T>(
              lazy: false,
              create: storeBuilder,
              dispose: (context, store) => store.dispose(),
            ),
            StreamProvider<U>(
              create: (context) =>
                  StaticProvider.of<T>(context).o$[U] as BehaviorSubject<U>,
              lazy: false,
              initialData: BehaviorSubject<U>().value,
            ),
            StreamProvider<I>(
              create: (context) =>
                  StaticProvider.of<T>(context).o$[I] as BehaviorSubject<I>,
              lazy: false,
              initialData: BehaviorSubject<I>().value,
            ),
          ],
        );
}

abstract class BaseStore {
  Map<Type, BehaviorSubject> get o$;

  List<StreamSubscription> _listeners = [];

  /// Listen to stream, and automatically handle listeners once the store is
  /// disposed
  void listen<P>(Subject<P> stream, Function(P) callback) {
    _listeners.add(stream.listen(callback));
  }

  ///add stuff to stream. type inherence works
  Future<void> addAsync<T>(T event) => Future(() => o$[T]?.add(event));

  void add<T>(T event) => o$[T]?.add(event);

  void dispose() {
    o$.forEach((key, value) {
      value.close();
    });
    _listeners.forEach((element) {
      element.cancel();
    });
  }
}

abstract class Store<T> extends BaseStore {
  Map<Type, BehaviorSubject> _o$ = {
    T: BehaviorSubject<T>(sync: true),
  };

  @override
  Map<Type, BehaviorSubject> get o$ => _o$;
}

abstract class Store2<T, U> extends BaseStore {
  Map<Type, BehaviorSubject> _o$ = {
    T: BehaviorSubject<T>(sync: true),
    U: BehaviorSubject<U>(sync: true)
  };

  @override
  Map<Type, BehaviorSubject> get o$ => _o$;
}

abstract class Store3<T, U, A> extends BaseStore {
  Map<Type, BehaviorSubject> _o$ = {
    T: BehaviorSubject<T>(sync: true),
    U: BehaviorSubject<U>(sync: true),
    A: BehaviorSubject<A>(sync: true)
  };

  @override
  Map<Type, BehaviorSubject> get o$ => _o$;
}

abstract class Store4<T, U, A, C> extends BaseStore {
  Map<Type, BehaviorSubject> _o$ = {
    T: BehaviorSubject<T>(sync: true),
    U: BehaviorSubject<U>(sync: true),
    A: BehaviorSubject<A>(sync: true),
    C: BehaviorSubject<C>(sync: true)
  };

  @override
  Map<Type, BehaviorSubject> get o$ => _o$;
}

class MyStoreProvider<T extends BaseStore, U> extends MultiProvider {
  final Widget? child;
  final T Function(BuildContext) storeBuilder;

  MyStoreProvider({
    this.child,
    required this.storeBuilder,
  }) : super(
          child: child,
          providers: [
            Provider<T>(
                lazy: false,
                create: storeBuilder,
                dispose: (context, store) => store.dispose()),
            StreamProvider<U>(
              lazy: false,
              create: (context) =>
                  StaticProvider.of<T>(context).o$[U] as BehaviorSubject<U>,
              initialData: BehaviorSubject<U>().value,
            )
          ],
        );
}

class MyStoreProvider2<T extends BaseStore, U, S> extends MultiProvider {
  final Widget? child;
  final T Function(BuildContext) storeBuilder;

  MyStoreProvider2({
    this.child,
    required this.storeBuilder,
  }) : super(
          child: child,
          providers: [
            Provider<T>(
                lazy: false,
                create: storeBuilder,
                dispose: (context, store) => store.dispose()),
            StreamProvider<U>(
              lazy: false,
              create: (context) =>
                  StaticProvider.of<T>(context).o$[U] as BehaviorSubject<U>,
              initialData: BehaviorSubject<U>().value,
            ),
            StreamProvider<S>(
              lazy: false,
              create: (context) =>
                  StaticProvider.of<T>(context).o$[S] as BehaviorSubject<S>,
              initialData: BehaviorSubject<S>().value,
            )
          ],
        );
}

class MyStoreProvider3<T extends BaseStore, U, S, A> extends MultiProvider {
  final Widget? child;
  final T Function(BuildContext) storeBuilder;

  MyStoreProvider3({
    this.child,
    required this.storeBuilder,
  }) : super(
          child: child,
          providers: [
            Provider<T>(
                lazy: false,
                create: storeBuilder,
                dispose: (context, store) => store.dispose()),
            StreamProvider<U>(
              lazy: false,
              create: (context) =>
                  StaticProvider.of<T>(context).o$[U] as BehaviorSubject<U>,
              initialData: BehaviorSubject<U>().value,
            ),
            StreamProvider<S>(
              lazy: false,
              create: (context) =>
                  StaticProvider.of<T>(context).o$[S] as BehaviorSubject<S>,
              initialData: BehaviorSubject<S>().value,
            ),
            StreamProvider<A>(
              lazy: false,
              create: (context) =>
                  StaticProvider.of<T>(context).o$[A] as BehaviorSubject<A>,
              initialData: BehaviorSubject<A>().value,
            )
          ],
        );
}

class MyStoreProvider4<T extends BaseStore, U, S, A, C> extends MultiProvider {
  final Widget? child;
  final T Function(BuildContext) storeBuilder;

  MyStoreProvider4({
    this.child,
    required this.storeBuilder,
  }) : super(
          child: child,
          providers: [
            Provider<T>(
                lazy: false,
                create: storeBuilder,
                dispose: (context, store) => store.dispose()),
            StreamProvider<U>(
              lazy: false,
              create: (context) =>
                  StaticProvider.of<T>(context).o$[U] as BehaviorSubject<U>,
              initialData: BehaviorSubject<U>().value,
            ),
            StreamProvider<S>(
              lazy: false,
              create: (context) =>
                  StaticProvider.of<T>(context).o$[S] as BehaviorSubject<S>,
              initialData: BehaviorSubject<S>().value,
            ),
            StreamProvider<A>(
              lazy: false,
              create: (context) =>
                  StaticProvider.of<T>(context).o$[A] as BehaviorSubject<A>,
              initialData: BehaviorSubject<A>().value,
            ),
            StreamProvider<C>(
              lazy: false,
              create: (context) =>
                  StaticProvider.of<T>(context).o$[C] as BehaviorSubject<C>,
              initialData: BehaviorSubject<C>().value,
            ),
          ],
        );
}
