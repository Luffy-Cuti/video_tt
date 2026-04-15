import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin _plugin =
  FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const ios = DarwinInitializationSettings();
    const settings = InitializationSettings(android: android, iOS: ios);
    await _plugin.initialize(settings);
  }

  Future<void> showUploadProgress(int progress) async {
    const details = NotificationDetails(
      android: AndroidNotificationDetails(
        'upload_channel',
        'Upload Progress',
        channelDescription: 'Hiển thị % upload video',
        importance: Importance.low,
        priority: Priority.low,
        showProgress: true,
        maxProgress: 100,
        onlyAlertOnce: true,
      ),
      iOS: DarwinNotificationDetails(),
    );

    await _plugin.show(
      111,
      'Đang upload video',
      'Tiến độ: $progress%',
      details,
    );
  }
}