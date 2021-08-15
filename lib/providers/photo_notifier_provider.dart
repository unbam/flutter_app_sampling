import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/photo_item.dart';

///
/// photoNotifierProvider
///
final photoNotifierProvider = StateNotifierProvider(
  (ref) => PhotoStateNotifier(),
);

///
/// フォトの状態管理
///
class PhotoStateNotifier extends StateNotifier<List<PhotoItem>> {
  PhotoStateNotifier() : super([]) {}

  /// フォトリスト
  List<PhotoItem> get photoList => state;

  ///
  /// add
  /// [path] ファイルパス
  /// [createDateTime] 撮影日
  ///
  void add(String path, DateTime createDateTime) {
    final item = PhotoItem(path: path, createDateTime: createDateTime);
    state = [...state, item];
  }
}
