import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stackedproject/app/app.locator.dart';
import 'package:stackedproject/model/on_time_card_model.dart';
import 'package:stackedproject/services/api_service.dart';
import 'package:stackedproject/services/card_service.dart';
import 'package:stackedproject/services/signal_r_service.dart';

import '../../../enums/card_statuses.dart';
import '../../common/app_colors.dart';

class CardListViewModel extends StreamViewModel<List<OnTimeCardModel>> {
  late final CardService _cardService;

  CardListViewModel() {
    _cardService = CardService();
    _initSignalR();
  }

  @override
  Stream<List<OnTimeCardModel>> get stream => _cardService.cardStream;

  Future<void> refreshCards() async {
    setBusy(true);
    await _cardService.fetchCards();
    setBusy(false);
  }

  Future<void> _initSignalR() async {
    await _cardService.init();
  }

  CardStatuses getCardStatus(int? statusId) => statusId != null ? CardStatuses.values.elementAt(statusId) : CardStatuses.pending;

  Color getStatusColor(int? statusId) {
    var status = getCardStatus(statusId);

    switch (status) {
      case CardStatuses.active:
        return kcgreen;
      case CardStatuses.pending:
        return kcorange;
      case CardStatuses.applied:
        return kcyellow;
      case CardStatuses.booked:
        return kcblueDark;
    }
  }

  @override
  void dispose() {
    _cardService.dispose();
    super.dispose();
  }
}
