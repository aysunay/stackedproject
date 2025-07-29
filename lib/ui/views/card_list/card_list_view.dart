import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stackedproject/ui/common/app_colors.dart';
import 'package:stackedproject/ui/common/widgets/custom_card.dart';
import 'package:stackedproject/ui/views/shared/shared_view.dart';
import 'package:stackedproject/utils/color_extensions.dart';

import '../../common/ui_helpers.dart';
import 'card_list_viewmodel.dart';

class CardListView extends SharedView<CardListViewModel> {
  const CardListView({super.key});

  @override
  CardListViewModel viewModelBuilder(BuildContext context) => CardListViewModel();

  @override
  String? get title => "Card List";

  @override
  List<Widget> buildActions(BuildContext context, CardListViewModel viewModel) {
    return [
      IconButton(onPressed: () => viewModel.refreshCards(), icon: const Icon(Icons.refresh)),
    ];
  }

  @override
  Widget buildBody(BuildContext context, CardListViewModel viewModel) {
    if (viewModel.isBusy || viewModel.data == null) {
      return const Center(child: CircularProgressIndicator());
    }

    if (viewModel.hasError) {
      return ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: const [
          SizedBox(height: 200),
          Center(child: Text("Bağlantı hatası. Tekrar deneyin")),
        ],
      );
    }

    if (viewModel.data == null || viewModel.data?.isEmpty == true) {
      return ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: const [
          SizedBox(height: 200),
          Center(child: Text("Kart bulunamadı")),
        ],
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      itemCount: viewModel.data!.length,
      itemBuilder: (context, index) {
        final card = viewModel.data![index];
        final fullCode = "${card.barcode ?? ''}*${card.id ?? ''}";
        final copyText = fullCode.replaceFirst(RegExp(r'^W'), '');

        return Column(
          children: [
            Stack(
              children: [
                CustomCard(
                  onTap: () {
                    // TODO: Card detay sayfasına geçiş
                  },
                  titleWidget: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            fullCode,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          horizontalSpaceSmall,
                          GestureDetector(
                            onTap: () {
                              Clipboard.setData(ClipboardData(text: copyText));
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Kopyalandı")),
                              );
                            },
                            child: const Icon(Icons.copy, size: 18),
                          ),
                        ],
                      ),
                      verticalSpaceTiny,
                      Text(
                        card.tailNo ?? '-',
                        style: const TextStyle(
                          color: kcgrayDark,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          letterSpacing: 1.1,
                        ),
                      ),
                    ],
                  ),
                  backgroundColor: kcwhite,
                  subtitleWidget: null,
                  descriptionWidget: Text(
                    card.description ?? '-',
                    style: const TextStyle(fontSize: 14),
                  ),
                  suffix: SizedBox(
                    width: 100,
                    height: 60,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Icon(Icons.people_alt, size: 25, color: kcgrayDark),
                          horizontalSpaceTiny,
                          Text(card.staffCount.toString()),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 16,
                  top: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 8),
                    decoration: BoxDecoration(
                      color: viewModel.getStatusColor(card.statusId).withValues(alpha: 0.4),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                        topLeft: Radius.elliptical(5, 8),
                        topRight: Radius.elliptical(5, 8),
                      ),
                      border: Border.all(
                        width: 1,
                        color: viewModel.getStatusColor(card.statusId).changeColorLightness(0.5),
                      ),
                    ),
                    child: Text(
                      viewModel.getCardStatus(card.statusId).name.toUpperCase(),
                      style: TextStyle(
                        color: viewModel.getStatusColor(card.statusId).changeColorLightness(0.35),
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        letterSpacing: 1.1,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        );
      },
    );
  }
}
