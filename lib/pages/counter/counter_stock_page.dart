import 'package:flutter/material.dart';
import 'package:flutter_app_sampling/util/constant.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../providers/stock_notifier_provider.dart';
import '../../util/util.dart';
import '../styles.dart';

///
/// CounterStockPage
///
class CounterStockPage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stockNotifier = ref.watch(stockNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Styles.primary,
        ),
        elevation: 0.0,
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context)
                  .pushNamed(Constant.pageCounterNewStockItemPage);
            },
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Padding(
              padding: const EdgeInsets.only(left: 20.0, bottom: 20.0),
              child: Text(
                AppLocalizations.of(context)!.stock,
                style: TextStyle(
                  color: Styles.primary,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // StockList
            Expanded(
              child: SingleChildScrollView(
                child: FutureBuilder<void>(
                  future: stockNotifier.createStock(),
                  builder: (context, snapshot) {
                    return Consumer(builder:
                        (BuildContext context, WidgetRef ref, Widget? child) {
                      final length = ref.watch(stockNotifierProvider).length;
                      return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return _stockItem(index);
                        },
                        itemCount: length,
                      );
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///
  /// ストックアイテム
  /// [index] アイテムインデックス
  ///
  Widget _stockItem(int index) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        // StockStateNotifierで状態変更を通知
        final stockNotifier = ref.watch(stockNotifierProvider.notifier);

        // StateNotifierProviderを監視し、状態をwatch
        final stockItem = ref.watch(stockNotifierProvider)[index];

        return Container(
          height: 95,
          margin: const EdgeInsets.only(
              left: 10.0, top: 0, right: 10.0, bottom: 3.0),
          child: Card(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(25.0),
              ),
            ),
            elevation: 2.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Decrement
                  _countButton(
                    iconData: Icons.remove,
                    function: () {
                      stockNotifier.decrement(stockItem.id);
                      Util.appDebugPrint(
                        place: runtimeType.toString(),
                        event: 'Decrement onPressed',
                        value:
                            '${stockItem.name}: ${stockNotifier.stock[index].count}',
                      );
                    },
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          // ItemName
                          Text(
                            stockNotifier.stock[index].name,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 15.0),
                          ),
                          // Count
                          Text(
                            '${stockNotifier.stock[index].count}',
                            style: const TextStyle(
                              fontSize: 30.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Increment
                  _countButton(
                    iconData: Icons.add,
                    function: () {
                      stockNotifier.increment(stockItem.id);
                      Util.appDebugPrint(
                        place: runtimeType.toString(),
                        event: 'Increment onPressed',
                        value:
                            '${stockItem.name}: ${stockNotifier.stock[index].count}',
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  ///
  /// カウントボタン
  /// [iconData] IconData
  /// [function] 実行処理
  ///
  ElevatedButton _countButton({
    required IconData iconData,
    Function? function,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Styles.primary,
        shape: CircleBorder(),
      ),
      onPressed: function != null ? () => function() : null,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Icon(iconData),
      ),
    );
  }
}
