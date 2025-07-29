import 'dart:convert';

import 'package:rxdart/rxdart.dart';
import '../app/app.locator.dart';
import '../model/on_time_card_model.dart';
import 'api_service.dart';
import 'signal_r_service.dart';

class CardService {
  final _cardStreamController = BehaviorSubject<List<OnTimeCardModel>>();
  final _signalRService = locator<SignalRService>();
  final ApiService _apiService = locator<ApiService>();

  Stream<List<OnTimeCardModel>> get cardStream => _cardStreamController.stream;

  Future<void> init() async {
    await _signalRService.initConnection();

    _signalRService.connection.on("ReceiveTaskCards", (arguments) {
      if (arguments != null && arguments.isNotEmpty) {
        final rawList = arguments[0] as List<dynamic>;

        final cards = rawList.map((e) {
          final json = Map<String, dynamic>.from(e as Map);
          return OnTimeCardModel.fromJson(json);
        }).toList();

        _cardStreamController.add(cards);
      }
    });

    await fetchCards();
  }

  Future<void> fetchCards() async {
    try {
      final cards = await _apiService.getOnTimeCards();

      _cardStreamController.add(cards);
    } catch (e) {
      print("API'den veri çekme hatası: $e");
    }
  }

  Future<void> dispose() async {
    await _cardStreamController.close();
    await _signalRService.stop();
  }
}
