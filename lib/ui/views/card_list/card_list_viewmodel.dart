import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stackedproject/app/app.locator.dart';
import 'package:stackedproject/model/on_time_card_model.dart';
import 'package:stackedproject/services/card_service.dart';
import 'package:stackedproject/services/signalr_service.dart';

import '../../common/app_colors.dart';

class CardListViewModel extends FutureViewModel {
  final SignalRService _signalRService = locator<SignalRService>();
  late final CardService _cardService;

  Stream<List<OnTimeCardModel>> get cards => _cardService.cardStream;

  CardListViewModel() {
    _cardService = CardService(_signalRService);
  }

  Future<void> refreshCards() async {
    await runBusyFuture(futureToRun());
  }

  Color getStatusColor(String? status) {
    switch (status?.toLowerCase()) {
      case 'active':
        return greenLight;
      case 'pending':
        return orangeLight;
      case 'applied':
        return yellowLight;
      case 'booked':
        return blueLight;
      default:
        return gray;
    }
  }

  Color getStatusTextColor(String? status) {
    switch (status?.toLowerCase()) {
      case 'active':
        return greenDark;
      case 'pending':
        return orangeDark;
      case 'applied':
        return yellowDark;
      case 'booked':
        return blueDark;
      default:
        return gray;
    }
  }

  @override
  Future<void> dispose() async {
    await _cardService.dispose();
    return super.dispose();
  }

  @override
  Future futureToRun() async {
    await _cardService.init();
    await _cardService.startConnection();
  }
}