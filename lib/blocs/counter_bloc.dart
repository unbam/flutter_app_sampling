import 'dart:async';

///
/// CounterBloc
///
class CounterBloc {
  CounterBloc() {}

  int _count = 0;
  StreamController<int> _controller = StreamController<int>();

  Stream<int> get counterStream => _controller.stream;

  ///
  /// インクリメント
  ///
  void increment() {
    _count++;
    _controller.sink.add(_count);
  }

  ///
  /// 破棄
  ///
  void dispose() {
    _controller.close();
  }
}
