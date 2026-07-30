import 'dart:async';

import 'package:socket_io_client/socket_io_client.dart' as IO;

class WorkerLocation {
  final double long;
  final double lat;
  WorkerLocation({required this.lat, required this.long});

  factory WorkerLocation.fromJson(Map<String, dynamic> json) {
    return WorkerLocation(lat: json['lat'], long: json['long']);
  }
}

class LocationService {
  IO.Socket? _socket;

  Timer? _timer;

  final _controller = StreamController<WorkerLocation>.broadcast();

  Stream<WorkerLocation> get locationStream => _controller.stream;

  connect(String id) {
    _socket = IO.io(
        'http://localhost:3000',
        IO.OptionBuilder()
            .setTransports(['websocket']) // for Flutter or Dart VM
            .disableAutoConnect() // disable auto-connection
            .enableReconnection()
            .setReconnectionAttempts(10000)
            .setReconnectionDelay(5000)
            .build());
    _socket!.onConnect((data) {
      print("socket connect $data");
      _timer?.cancel();
      _timer = Timer.periodic(Duration(seconds: 5), (_) {
        _socket!.emit("get_worker_location", {"id": id});
      });
    });

    _socket!.on("location_update", (data) {
      final location = WorkerLocation.fromJson(Map<String, dynamic>.from(data));

      _controller.add(location);
    });

    _socket!.onDisconnect((_) {
      print("disconnect");
      _timer?.cancel();
    });
    _socket!.onReconnect((_) {
      print("reconnect");
    });
    _socket!.connect();
  }

  void dispose() {
    _socket?.disconnect();
    _socket?.dispose();
    _timer?.cancel();
    _controller.close();
  }
}

final service = LocationService();
funCall() {
  service.connect("userid");
  service.locationStream.listen((onData) {
    print("data ${onData.long} and ${onData.lat}");
  });
}
