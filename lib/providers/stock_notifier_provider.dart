import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/stock_item.dart';

///
/// stockNotifierProvider
///
final stockNotifierProvider = StateNotifierProvider(
  (ref) => StockStateNotifier(),
);

///
/// ストックの状態管理
///
class StockStateNotifier extends StateNotifier<List<StockItem>> {
  StockStateNotifier() : super([]) {}

  /// ストック
  List<StockItem> get stock => state;

  ///
  /// ストックの作成
  ///
  Future<void> createStock() async {
    // assetsからjson読み込み
    final loadData = await rootBundle.loadString('assets/json/stock.json');
    final stockItems = jsonDecode(loadData);

    final resultList = <StockItem>[];
    for (final item in stockItems) {
      resultList.add(StockItem.fromJson(item));
    }

    state = resultList;
  }

  ///
  /// add
  /// [name] アイテム名
  /// [count] 個数
  ///
  void add(String name, int count) {
    StockItem item = StockItem(id: state.last.id + 1, name: name, count: count);
    state = [...state, item];
  }

  ///
  /// increment
  /// [id] 対象アイテムのID
  ///
  void increment(int id) {
    state = state
        .map((e) {
          if (e.id == id) {
            return e.copyWith(count: e.count + 1);
          }

          return e;
        })
        .cast<StockItem>()
        .toList();
  }

  ///
  /// decrement
  /// [id] 対象アイテムのID
  ///
  void decrement(int id) {
    state = state
        .map((e) {
          if (e.id == id) {
            return e.copyWith(count: e.count - 1);
          }

          return e;
        })
        .cast<StockItem>()
        .toList();
  }
}
