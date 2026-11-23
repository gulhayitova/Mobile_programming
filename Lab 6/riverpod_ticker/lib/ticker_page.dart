import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'models/tick.dart';
import 'providers/ticker_providers.dart';
import 'widgets/tick_row.dart';

class TickerPage extends ConsumerWidget {
  const TickerPage({super.key});

  Widget _rows(List<Tick> ticks) => ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [for (final t in ticks) TickRow(t, key: ValueKey(t.symbol))],
      );

  Widget _refreshable(WidgetRef ref, Widget child) => RefreshIndicator(
        onRefresh: () async {
          try {
            // ignore: unused_result
            await ref.refresh(tickerProvider.future);
          } catch (_) {
          }
        },
        child: child,
      );
// g7h

/* er
ewr
*/

/// h8oiij
/// 
/// 
/// 
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ticks = ref.watch(tickerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Live ticker'),
        actions: [
          IconButton(
            tooltip: 'Fail after 5 ticks',
            icon: const Icon(Icons.bug_report),
            onPressed: () => ref.read(failAfterProvider.notifier).set(5),
          ),
          IconButton(
            tooltip: 'Never fail',
            icon: const Icon(Icons.restart_alt),
            onPressed: () => ref.read(failAfterProvider.notifier).set(null),
          ),
        ],
      ),
      // Arm order is a priority list: specific arms above general ones.
      body: switch (ticks) {
        // Error with stale data: show rows dimmed, banner on top.
        AsyncError(:final error, :final value?) => Column(
            children: [
              MaterialBanner(
                content: Text('Feed error: $error — showing last prices'),
                actions: [
                  TextButton(
                    onPressed: () => ref.invalidate(tickerProvider),
                    child: const Text('Retry'),
                  ),
                ],
              ),
              Expanded(child: Opacity(opacity: 0.5, child: _rows(value))),
            ],
          ),
        AsyncError(:final error) => Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Could not load ticker\n$error', textAlign: TextAlign.center),
                const SizedBox(height: 12),
                FilledButton(
                  onPressed: () => ref.invalidate(tickerProvider),
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
        // Refresh/reload in progress with old data: keep rows, thin progress bar.
        AsyncValue(:final value?, isLoading: true) => Column(
            children: [
              const LinearProgressIndicator(),
              Expanded(child: _rows(value)),
            ],
          ),
        // Content-based arms (exercise 3.4) must precede the general data arm.
        AsyncData(value: []) => const Center(child: Text('No symbols subscribed')),
        AsyncData(value: [final only]) => Center(child: TickRow(only)),
        AsyncData(:final value) => _refreshable(ref, _rows(value)),
        // Cold start only: nothing was ever shown.
        AsyncLoading() => const Center(child: CircularProgressIndicator()),
      },
    );
  }
}
