import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

class PusherService {
  final PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initPusher() async {
    await _initLocalNotifications();
    try {
      await pusher.init(
        apiKey: '238db1cb77cebc09b53a',
        cluster: 'eu',
        onConnectionStateChange: (String previousState, String currentState) {
          print("Connection state changed: $previousState -> $currentState");
        },
        onError: (String message, int? code, dynamic e) {
          print("Error: $message, code: $code, exception: $e");
        },
      );

      await pusher.subscribe(
        channelName: 'fall-channel',
        onEvent: (dynamic event) {
          if (event is PusherEvent && event.eventName == 'fall-event') {
            print("Received event: ${event.data}");
            _showNotification(event.data);
          }
        },
      );

      await pusher.connect();
    } catch (e) {
      print("Pusher initialization error: $e");
    }
  }

  Future<void> _initLocalNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> _showNotification(String message) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      '1822917',
      'fall-channel',
      // 'your channel description',
      // playSound: true,
      importance: Importance.max,
      priority: Priority.high,
      showWhen: false,
    );
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );
    await flutterLocalNotificationsPlugin.show(
      0,
      'Fall Alert System',
      message,
      platformChannelSpecifics,
      payload: 'item x',
    );
  }

  void dispose() {
    pusher.disconnect();
  }
}
