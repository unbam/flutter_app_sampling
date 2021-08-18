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
import 'photo_detail_page.dart';

///
/// CarouselPhotoPage
///
class CarouselPhotoPage extends HookConsumerWidget {
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => CarouselPhotoPage(),
    );
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
                            Navigator.of(context).push(
                              PhotoDetailPage.route(
                                photoInfo: {
                                  'path': photoItem.path,
                                },
                              ),
                            );
                          },
                          child: Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.all(5.0),
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  child: Center(
                                    child: Image.file(
                                      File(photoItem.path),
                                      fit: BoxFit.cover,
                                      width: 300,
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
