import 'package:rxdart/rxdart.dart';
import '../model/on_time_card_model.dart';
import 'signalr_service.dart';

class CardService {
  final SignalRService _signalRService;
  final _cardStreamController = BehaviorSubject<List<OnTimeCardModel>>();

  Stream<List<OnTimeCardModel>> get cardStream => _cardStreamController.stream;

  CardService(this._signalRService);

  Future<void> init() async {
    await _signalRService.initConnection();

    _signalRService.connection.on("ReceiveTaskCards", (arguments) {
      print("ReceiveTaskCards tetiklendi");

      if (arguments != null && arguments.isNotEmpty) {
        print("Data geldi: $arguments");

        try {
          final data = arguments[0] as List;
          final cards = data
              .map(
                  (e) => OnTimeCardModel.fromJson(Map<String, dynamic>.from(e)))
              .toList();

          _cardStreamController.add(cards);
        } catch (e) {
          print("Card parse hatası: $e");
        }
      }
    });

    _signalRService.invoke("RequestCards");
  }

  Future<void> startConnection() async {
    await _signalRService.invoke("RequestCards");
  }

  Future<void> dispose() async {
    await _cardStreamController.close();
    await _signalRService.stop();
  }
}
