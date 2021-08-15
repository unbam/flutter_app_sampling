import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:heic_to_jpg/heic_to_jpg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:media_and_create_date_picker/media_and_create_date_picker.dart';
import 'package:path/path.dart' as path;

import '../../models/photo_item.dart';
import '../../providers/photo_notifier_provider.dart';
import '../../util/util.dart';
import '../styles.dart';

///
/// CarouselPhotoPage
///
class CarouselPhotoPage extends HookConsumerWidget {
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => CarouselPhotoPage(),
    );
  }

  static RectTween _createRectTween(Rect? begin, Rect? end) {
    return MaterialRectCenterArcTween(begin: begin, end: end);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final photoNotifier = ref.watch(photoNotifierProvider.notifier);
    final photoList = ref.watch(photoNotifierProvider) as List<PhotoItem>;

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Padding(
              padding: const EdgeInsets.only(left: 20.0, bottom: 20.0),
              child: Text(
                AppLocalizations.of(context)!.photo,
                style: TextStyle(
                  color: Styles.primary,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: CarouselSlider(
                options: CarouselOptions(aspectRatio: 2),
                items: photoList.isNotEmpty
                    ? photoList.map((photoItem) {
                        return GestureDetector(
                          onTap: () {
                            // Navigator.of(context).push(
                            //   PhotoPage.route(
                            //     photoInfo: {
                            //       'tag': 'logo',
                            //       'path': photoPath,
                            //     },
                            //   ),
                            // );
                          },
                          child: Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.all(5.0),
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  child: Center(
                                    child: Hero(
                                      createRectTween: _createRectTween,
                                      tag: path.basename(photoItem.path),
                                      child: Image.file(
                                        File(photoItem.path),
                                        fit: BoxFit.cover,
                                        width: 300,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 20.0, bottom: 8.0),
                                  child: Text(
                                    photoItem.createDateTime.toString(),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList()
                    : [
                        Container(
                          color: Colors.grey,
                          margin: EdgeInsets.all(5.0),
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            child: Center(
                              child: Text('Empty'),
                            ),
                          ),
                        )
                      ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await MediaAndCreateDatePicker.pickMedia;

          if (result.path.isEmpty) {
            return;
          } else if (result.mediaType == MediaType.video) {
            return;
          }

          final extension = path.extension(result.path);
          var filePath = '';
          if (RegExp('.(heic|HEIC)').hasMatch(extension)) {
            var convert = await HeicToJpg.convert(result.path);
            filePath = convert ?? '';
          } else {
            filePath = result.path;
          }

          Util.appDebugPrint(
            place: runtimeType.toString(),
            event: 'PickMedia onPressed',
            value: '$filePath',
          );

          photoNotifier.add(filePath, result.createDate!);
        },
        child: Icon(Icons.photo),
      ),
    );
  }
}

class PhotoPage extends StatelessWidget {
  // static Interval opacityCurve =
  //     const Interval(0.0, 0.75, curve: Curves.fastOutSlowIn);
  // static Route route({required photoInfo}) {
  //   // return MaterialPageRoute(
  //   //   fullscreenDialog: true,
  //   //   builder: (_) => PhotoPage(),
  //   //   settings: RouteSettings(arguments: photoInfo),
  //   // );
  //   return PageRouteBuilder<void>(pageBuilder: (
  //     BuildContext context,
  //     Animation<double> animation,
  //     Animation<double> secondaryAnimation,
  //   ) {
  //     return AnimatedBuilder(
  //         animation: animation,
  //         builder: (BuildContext context, Widget? child) {
  //           return Opacity(
  //             opacity: opacityCurve.transform(animation.value),
  //             child: PhotoPage(),
  //           );
  //         });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final photoInfo =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Hero(
          tag: 'logo',
          child: Image.file(File(photoInfo['path'])),
        ),
      ),
    );
    // child: Container(
    //   padding: const EdgeInsets.all(16.0),
    //   alignment: Alignment.topLeft,
    //   child: Hero(
    //     tag: photoInfo['tag'],
    //     child: Image.file(File(photoInfo['path'])),
    //   ),
    // ),
  }
}

class PhotoHero extends StatelessWidget {
  const PhotoHero({
    Key? key,
    required this.photo,
    required this.onTap,
    required this.width,
  }) : super(key: key);

  final String photo;
  final VoidCallback onTap;
  final double width;

  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: photo,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Image.asset(
              photo,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
