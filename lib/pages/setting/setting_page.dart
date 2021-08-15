import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info/package_info.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../util/constant.dart';
import '../components/group_list.dart';
import '../styles.dart';

///
/// SettingPage
///
class SettingPage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: false,
        // toolbarHeight: 80,
        // title: Padding(
        //   padding: const EdgeInsets.only(left: 8.0, top: 10.0),
        //   child: Text(
        //     AppLocalizations.of(context)!.setting,
        //     style: TextStyle(
        //       color: Styles.primary,
        //       fontSize: 30,
        //     ),
        //   ),
        // ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Title
            Padding(
              padding: const EdgeInsets.only(left: 20.0, bottom: 20.0),
              child: Text(
                AppLocalizations.of(context)!.setting,
                style: TextStyle(
                  color: Styles.primary,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 50.0),
                  child: FutureBuilder<PackageInfo>(
                    future: PackageInfo.fromPlatform(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Container();
                      }

                      final packageInfo = snapshot.data!;

                      return Column(
                        children: [
                          GroupList(
                            title: AppLocalizations.of(context)!.other,
                            list: [
                              GroupListColumn(
                                title: AppLocalizations.of(context)!.help,
                                iconData: Icons.help,
                                valueIconData: Icons.exit_to_app,
                                onTap: () async {
                                  await launch(
                                    'https://github.com/unbam',
                                    forceWebView: false,
                                  );
                                },
                              ),
                              GroupListColumn(
                                title: AppLocalizations.of(context)!.license,
                                hasNext: true,
                                iconData: Icons.sticky_note_2_outlined,
                                onTap: () {
                                  showLicensePage(
                                    context: context,
                                    applicationName: Constant.appName,
                                    applicationVersion: packageInfo.version,
                                  );
                                },
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Text(
                                  'Version',
                                  style: TextStyle(color: Styles.primary),
                                ),
                              ),
                              Center(
                                child: Text(
                                  packageInfo.version,
                                  style: TextStyle(color: Styles.primary),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
