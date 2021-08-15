import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../blocs/counter_bloc.dart';

///
/// CounterStreamPage
///
class CounterStreamPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counterBloc = Provider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('CounterStreamPage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder<int>(
              stream: counterBloc.counterStream,
              initialData: 0,
              builder: (context, snapshot) {
                return Text(
                  '${snapshot.data}',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => counterBloc.increment(),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
