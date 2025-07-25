import 'package:signalr_netcore/signalr_client.dart';
import 'dart:async';
import 'package:stackedproject/model/on_time_card_model.dart';

class SignalRService {
  late HubConnection _connection;
  final _cardsController = StreamController<List<OnTimeCardModel>>.broadcast();

  Stream<List<OnTimeCardModel>> get cardsStream => _cardsController.stream;

  HubConnection get connection => _connection;

  Future<void> initConnection() async {
    _connection = HubConnectionBuilder()
        .withUrl("https://localhost:7163/taskCardHub")
        .withAutomaticReconnect()
        .build();

    _connection.onclose(({error}) {
      print('SignalR bağlantısı kapandı: $error');
    });

    _connection.on("ReceiveTaskCards", (arguments) {
      print("ReceiveTaskCards tetiklendi");

      if (arguments != null && arguments.isNotEmpty) {
        try {
          final list = (arguments[0] as List).cast<Map<String, dynamic>>();
          final cards =
              list.map((json) => OnTimeCardModel.fromJson(json)).toList();
          _cardsController.add(cards);
        } catch (e) {
          print("JSON parse hatası: $e");
        }
      }
    });

    try {
      await _connection.start();
      print("SignalR bağlantısı başarıyla kuruldu.");

      await Future.delayed(const Duration(milliseconds: 300));

      if (_connection.state == HubConnectionState.Connected) {
        await invoke("RequestCards");
        print("RequestCards invoke edildi.");
      } else {
        print("SignalR hala bağlı değil.");
      }
    } catch (e) {
      print("SignalR bağlantısı kurulamadı: $e");
    }
  }

  Future<void> invoke(String method, {List<Object>? args}) async {
    if (_connection.state == HubConnectionState.Connected) {
      await _connection.invoke(method, args: args ?? []);
    } else {
      print("SignalR bağlı değil. $method çağrısı yapılamadı.");
    }
  }

  Future<void> stop() async {
    await _connection.stop();
  }

  void dispose() {
    _cardsController.close();
  }
}
