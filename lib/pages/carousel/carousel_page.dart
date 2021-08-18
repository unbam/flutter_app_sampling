import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../styles.dart';
import 'carousel_photo_page.dart';

///
/// CarouselPage
///
class CarouselPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: false,
        leadingWidth: 0,
        toolbarHeight: 80,
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 10.0),
          child: Text(
            AppLocalizations.of(context)!.carousel,
            style: TextStyle(
              color: Styles.primary,
              fontSize: 30,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 250,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(CarouselPhotoPage.route());
                    },
                    child: Text('Photo'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
