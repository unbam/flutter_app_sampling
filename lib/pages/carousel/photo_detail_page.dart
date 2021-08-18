import 'dart:io';

import 'package:flutter/material.dart';

///
/// PhotoDetailPage
///
class PhotoDetailPage extends StatelessWidget {
  static Route route({required photoInfo}) {
    return MaterialPageRoute(
      fullscreenDialog: true,
      builder: (_) => PhotoDetailPage(),
      settings: RouteSettings(arguments: photoInfo),
    );
  }

  @override
  Widget build(BuildContext context) {
    final photoInfo =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        alignment: Alignment.center,
        child: Image.file(
          File(photoInfo['path']),
        ),
      ),
    );
  }
}
