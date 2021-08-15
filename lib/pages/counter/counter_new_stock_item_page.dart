import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../providers/stock_notifier_provider.dart';
import '../../../util/util.dart';
import '../styles.dart';

///
/// CounterNewStockItemPage
///
class CounterNewStockItemPage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stockNotifier = ref.watch(stockNotifierProvider.notifier);
    final formKey = GlobalKey<FormState>();
    final itemNameController = useTextEditingController();
    final itemCountController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Styles.secondary,
        elevation: 0.0,
        leading: IconButton(
          color: Styles.primary,
          icon: Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: itemNameController,
                decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.itemName),
                validator: (value) {
                  if (value!.isEmpty) {
                    return AppLocalizations.of(context)!.pleaseEnter;
                  }

                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: itemCountController,
                decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.numberOfItem),
                validator: (value) {
                  if (value!.isEmpty) {
                    return AppLocalizations.of(context)!.pleaseEnter;
                  } else if (int.parse(value) < 0 || int.parse(value) > 100) {
                    return AppLocalizations.of(context)!.pleaseRange;
                  }

                  return null;
                },
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  if (!formKey.currentState!.validate()) {
                    return;
                  }

                  formKey.currentState!.save();

                  stockNotifier.add(itemNameController.text,
                      int.parse(itemCountController.text));

                  Util.appDebugPrint(
                    place: runtimeType.toString(),
                    event: 'Add onPressed',
                    value:
                        '${itemNameController.text}: ${itemCountController.text}',
                  );

                  Navigator.of(context).pop();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 50.0),
                  child: Text(AppLocalizations.of(context)!.add),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
