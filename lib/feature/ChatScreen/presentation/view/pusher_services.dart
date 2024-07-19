// import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

// class PusherService {
//   late PusherChannelsFlutter pusher;
//   PusherChannel? channel;

//   PusherService() {
//     pusher = PusherChannelsFlutter.getInstance();

//     pusher.init(
//       apiKey: '238db1cb77cebc09b53a',
//       cluster: 'eu',
//       onConnectionStateChange: (String currentState, String previousState) {
//         print("Pusher connection Notificatio state: $currentState");
//       },
//       onError: (String message, int? code, dynamic exception) {
//         print("Pusher error: $message code: $code exception: $exception");
//       },
//     );

//     pusher.connect();
//   }

//   Future<void> subscribeToChannel(
//       String channelName, Function(dynamic) onEvent) async {
//     channel = await pusher.subscribe(
//       channelName: channelName,
//       onEvent: (event) {
//         if (event.eventName == 'chat-event') {
//           // onEvent(event.data);
//           print(event.data);
//         }
//       },
//     );
//     pusher.onEvent!((PusherEvent event) {
//       if (event.eventName == 'chat-event' && event.channelName == channelName) {
//         onEvent(event.data);
//       }
//     } as PusherEvent);
//   }

//   void disconnect() {
//     pusher.disconnect();
//   }
// }

import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

class PusherService {
  final PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();
  PusherChannel? channel;

  PusherService() {
    _initPusher();
  }

  Future<void> _initPusher() async {
    try {
      await pusher.init(
        apiKey: '238db1cb77cebc09b53a',
        cluster: 'eu',
        onConnectionStateChange: (String currentState, String previousState) {
          print("Pusher connection state: $previousState -> $currentState");
        },
        onError: (String message, int? code, dynamic exception) {
          print("Pusher error: $message, code: $code, exception: $exception");
        },
      );
      await pusher.connect();
    } catch (e) {
      print("Pusher initialization error: $e");
    }
  }

  Future<void> subscribeToChannel(
      String channelName, Function(dynamic) onEvent) async {
    try {
      channel = await pusher.subscribe(
        channelName: channelName,
        onEvent: (PusherEvent event) {
          if (event.eventName == 'chat-event') {
            print("Received event: ${event.data}");
            onEvent(event.data);
          }
        },
      );
    } catch (e) {
      print("Subscription error: $e");
    }
  }

  void disconnect() {
    pusher.disconnect();
  }
}
