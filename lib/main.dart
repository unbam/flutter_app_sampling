import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'pages/my_app.dart';

///
/// エントリーポイント
///
void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}
