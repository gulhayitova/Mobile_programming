import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/tick.dart';
import '../services/tick_feed.dart';

/// Holds "fail after N ticks" (null = never fail). A Notifier is used instead
/// of StateProvider because StateProvider moved to `legacy.dart` in Riverpod 3.
class FailAfterNotifier extends Notifier<int?> {
  @override
  int? build() => null;

  void set(int? value) => state = value;
}

final failAfterProvider =
    NotifierProvider<FailAfterNotifier, int?>(FailAfterNotifier.new);

/// Overridable in tests and in the error demo.
final tickFeedProvider = Provider<TickFeed>((ref) {
  return TickFeed(failAfter: ref.watch(failAfterProvider));
});

final tickerProvider = StreamProvider.autoDispose<List<Tick>>(
  (ref) => ref.watch(tickFeedProvider).watch(),
  // Riverpod 3 retries failed providers automatically. This lab shows the
  // error state and a manual Retry button, so automatic retry is disabled.
  retry: (retryCount, error) => null,
);
