import 'package:dio/dio.dart';
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
      print("ReceiveTaskCards tetiklendi");

      if (arguments != null && arguments.isNotEmpty) {
        final firstArg = arguments[0];
        print("First arg type: ${firstArg.runtimeType}");

        if (firstArg is List) {
          try {
            final cards = <OnTimeCardModel>[];

            for (var e in firstArg) {
              try {
                final parsedMap = Map<String, dynamic>.from(e as Map);
                final model = OnTimeCardModel.fromJson(parsedMap);
                cards.add(model);
              } catch (err) {
                print("Parse hatası: $err - veri: $e");
              }
            }

            _cardStreamController.add(cards);
          } catch (e, s) {
            print("Kart listesi parse hatası: $e\n$s");
          }
        } else {
          print("First argument is not List");
        }
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
