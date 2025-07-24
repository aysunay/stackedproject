import 'dart:async';
import 'package:signalr_netcore/signalr_client.dart';

class SignalRService {
  late HubConnection _connection;

  HubConnection get connection => _connection;

  Future<void> initConnection() async {
    _connection = HubConnectionBuilder()
        .withUrl(
      "https://localhost:7163/taskCardHub",
    )
        .withAutomaticReconnect()
        .build();


    _connection.onclose(({error}) {
      print('SignalR bağlantısı kapandı: $error');
    });

    try {
      await _connection.start();
      print("SignalR bağlantısı kuruldu");
      await invoke("RequestCards");
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
}
