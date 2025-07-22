import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'shared_viewmodel.dart';

class SharedView<T extends ChangeNotifier> extends StackedView<T> {


  const SharedView({Key? key,

  })    : super(key: key);


  @override
  Widget builder(BuildContext context, T viewModel, Widget? child) {
    // TODO: implement builder
    throw UnimplementedError();
  }

  @override
  T viewModelBuilder(BuildContext context) {
    // TODO: implement viewModelBuilder
    throw UnimplementedError();
  }
}
// bottom navigation bar, 5 tane home koy şimdilik oraya, tasarımı replike et
// sayfaların her zaman kayabilir olması için SingleChildScrollView
// pull to refresh (opsiyonel, açılıp kapatılabilir olacak)