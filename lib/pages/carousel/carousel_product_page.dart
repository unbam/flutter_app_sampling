import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../styles.dart';

///
/// CarouselProductPage
///
class CarouselProductPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => CarouselProductPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Styles.primary,
        ),
        elevation: 0.0,
        centerTitle: false,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Title
            Padding(
              padding: const EdgeInsets.only(left: 20.0, bottom: 20.0),
              child: Text(
                AppLocalizations.of(context)!.cart,
                style: TextStyle(
                  color: Styles.primary,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
