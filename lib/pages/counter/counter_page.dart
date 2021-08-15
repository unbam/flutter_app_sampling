import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../blocs/counter_bloc.dart';
import '../../util/constant.dart';
import '../styles.dart';
import 'counter_stream_page.dart';

///
/// CounterPage
///
class CounterPage extends StatelessWidget {
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
            AppLocalizations.of(context)!.counter,
            style: TextStyle(
              color: Styles.primary,
              fontSize: 30,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(Constant.pageCounterDefaultPage);
                    },
                    child: Text(
                      'Default',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return Provider<CounterBloc>(
                              create: (_) => CounterBloc(),
                              dispose: (context, bloc) => bloc.dispose(),
                              child: CounterStreamPage(),
                            );
                          },
                        ),
                      );
                    },
                    child: Text(
                      'Stream',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(Constant.pageCounterRiverpodPage);
                    },
                    child: Text(
                      'Riverpod',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(Constant.pageCounterStockPage);
                    },
                    child: Text(
                      'Stock',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
