import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'carousel/carousel_photo_page.dart';
import 'counter/counter_stock_page.dart';
import 'setting/setting_page.dart';
import 'styles.dart';

///
/// タブページ
///
class TabPage extends HookConsumerWidget {
  ///
  /// タブページリスト
  ///
  static List<Widget> _pageList = [
    CounterStockPage(),
    CarouselPhotoPage(),
    SettingPage(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageIndex = useState<int>(0);

    return Scaffold(
      body: _pageList[pageIndex.value],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Styles.primary,
        currentIndex: pageIndex.value,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            label: AppLocalizations.of(context)!.counter,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_carousel_outlined),
            label: AppLocalizations.of(context)!.carousel,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: AppLocalizations.of(context)!.setting,
          ),
        ],
        onTap: (index) {
          if (pageIndex.value != index) {
            pageIndex.value = index;
          }
        },
      ),
    );
  }
}
