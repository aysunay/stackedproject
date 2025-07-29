import 'package:signalr_netcore/signalr_client.dart';
import 'dart:async';
import 'package:stackedproject/model/on_time_card_model.dart';

class SignalRService {
  late HubConnection _connection;
  final _cardsController = StreamController<List<OnTimeCardModel>>.broadcast();

  Stream<List<OnTimeCardModel>> get cardsStream => _cardsController.stream;

  HubConnection get connection => _connection;

  Future<void> initConnection() async {
    _connection = HubConnectionBuilder().withUrl("https://localhost:7163/taskCardHub").withAutomaticReconnect().build();

    _connection.onclose(({error}) {
      print('SignalR bağlantısı kapandı: $error');
    });

    _connection.on("ReceiveTaskCards", (arguments) {
      print("ReceiveTaskCards tetiklendi");

      if (arguments != null && arguments.isNotEmpty) {
        try {
          final List cardsJson = arguments[0] as List;
          print('arguments tipi: ${arguments.runtimeType}');
          print('arguments[0] içeriği: ${arguments[0]}');
          print('arguments[0] tipi: ${arguments[0].runtimeType}');

          final cards = cardsJson.map((e) => OnTimeCardModel.fromJson(Map<String, dynamic>.from(e as Map<dynamic, dynamic>))).toList();

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

//
// import 'dart:async';
// import 'package:signalr_netcore/signalr_client.dart';
// import 'package:stackedproject/model/technician_model.dart';
//
// class SignalRService {
//   Function(Technician)? onTechnicianAdded;
//   Function(String technicianId)? onTechnicianRemoved;
//
//   HubConnectionState _connectionState = HubConnectionState.Disconnected;
//   HubConnectionState get connectionState => _connectionState;
//   bool get isConnected => _connectionState == HubConnectionState.Connected;
//
//   String get connectionStatusLabel {
//     switch (_connectionState) {
//       case HubConnectionState.Connected:
//         return "Connected";
//       case HubConnectionState.Connecting:
//         return "Connecting...";
//       case HubConnectionState.Reconnecting:
//         return "Reconnecting...";
//       case HubConnectionState.Disconnected:
//       default:
//         return "Disconnected";
//     }
//   }
//
//   Future<void> connect() async {
//     if (_hubConnection.state == HubConnectionState.connected) return;
//
//     _hubConnection.onclose((error) async {
//       _connectionState = HubConnectionState.disconnected;
//       print("SignalR disconnected. Reconnecting in 5s...");
//       await Future.delayed(const Duration(seconds: 5));
//       await connect();
//     });
//
//     _hubConnection.on('TechnicianAdded', (args) {
//       if (args != null && args.isNotEmpty) {
//         final tech = Technician.fromJson(args[0] as Map<String, dynamic>);
//         onTechnicianAdded?.call(tech);
//       }
//     });
//
//     _hubConnection.on('TechnicianRemoved', (args) {
//       if (args != null && args.isNotEmpty) {
//         final techId = args[0] as String;
//         onTechnicianRemoved?.call(techId);
//       }
//     });
//
//     try {
//       await _hubConnection.start();
//       _connectionState = HubConnectionState.connected;
//       print("SignalR connected.");
//     } catch (e) {
//       _connectionState = HubConnectionState.disconnected;
//       print("SignalR connection failed: $e");
//     }
//   }
//
//   Future<void> disconnect() async {
//     try {
//       await _hubConnection.stop();
//       _connectionState = HubConnectionState.disconnected;
//       print("SignalR disconnected manually.");
//     } catch (e) {
//       print("Error during disconnect: $e");
//     }
//   }
// }
