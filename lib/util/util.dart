import 'package:flutter/foundation.dart';

import 'constant.dart';

///
/// Util
///
class Util {
  ///
  /// appDebugPrint
  /// [place] 出力場所
  /// [event] イベント名
  /// [value] 出力値
  ///
  static void appDebugPrint({
    String place = '',
    String event = '',
    String value = '',
  }) {
    if (kDebugMode) {
      debugPrint(
          '[${DateTime.now()}][${Constant.appName}][$place][$event]: $value');
    }
  }
}
