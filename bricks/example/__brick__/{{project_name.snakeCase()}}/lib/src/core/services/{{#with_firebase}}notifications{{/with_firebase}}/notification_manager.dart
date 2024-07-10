import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_in_app_messaging/firebase_in_app_messaging.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:reinvest_mobile/core/services/local_db/shared_preferences_facade.dart';
import 'package:reinvest_mobile/core/services/notifications/notification_helper.dart';

final _localNotifications = FlutterLocalNotificationsPlugin();

const _androidChannel = AndroidNotificationChannel(
  'main',
  'Main',
  description: 'This channel is used for important notification',
  importance: Importance.high,
);

@pragma('vm:entry-point')
Future<void> handleBackgroundMessage(RemoteMessage message) async {
  log('${message.toMap()}');
}

class NotificationManager {
  NotificationManager._();

  static NotificationManager instance = NotificationManager._();
  final _firebaseMessaging = FirebaseMessaging.instance;
  final _inAppMessaging = FirebaseInAppMessaging.instance;

  Future<void> init() async {
    try {
      await _firebaseMessaging.requestPermission();
      final fcmToken = await _firebaseMessaging.getToken();
      if (Platform.isIOS) {
        await _firebaseMessaging.getAPNSToken();
      }
      print('fcm_token : $fcmToken');
      print('installation_id : ${fcmToken?.split(':').first}');
      SharedPrefFacade.instance.setFcmToken(token: fcmToken ?? '');

      if (Platform.isAndroid) {
        await _initLocalNotification();
      }
      await _configNotifications();

      await _inAppMessaging.setAutomaticDataCollectionEnabled(true);
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> _initLocalNotification() async {
    const ios = DarwinInitializationSettings();
    const android = AndroidInitializationSettings('@drawable/app_icon');
    const settings = InitializationSettings(android: android, iOS: ios);

    await _localNotifications.initialize(
      settings,
      onDidReceiveNotificationResponse: (details) {
        final message = RemoteMessage.fromMap(
          jsonDecode(details.payload ?? '') as Map<String, dynamic>,
        );

        NotificationHelper.instance.navigateToPage(message);
      },
    );

    final platform = _localNotifications.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();

    await platform?.createNotificationChannel(_androidChannel);
  }

  Future<void> _configNotifications() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);

    FirebaseMessaging.onMessage.listen((message) async {
      //// Show notification
      if (Platform.isAndroid) {
        /// Local Notification Image
        BigPictureStyleInformation? bigPictureStyleInformation;
        if (message.notification?.android?.imageUrl != null) {
          final http.Response response = await http
              .get(Uri.parse(message.notification?.android?.imageUrl ?? ''));
          log('statusCode ${response.statusCode}');
          bigPictureStyleInformation = BigPictureStyleInformation(
            ByteArrayAndroidBitmap.fromBase64String(
              base64Encode(response.bodyBytes),
            ),
            largeIcon: ByteArrayAndroidBitmap.fromBase64String(
              base64Encode(response.bodyBytes),
            ),
          );
        }

        await _localNotifications.show(
          message.hashCode,
          message.notification?.title,
          message.notification?.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              _androidChannel.id,
              _androidChannel.name,
              channelDescription: _androidChannel.description,
              icon: '@drawable/app_icon',
              importance: _androidChannel.importance,
              priority: Priority.max,
              styleInformation: bigPictureStyleInformation,
            ),
            iOS: const DarwinNotificationDetails(
              presentAlert: true,
              presentBadge: true,
              presentBanner: true,
              presentList: true,
              presentSound: true,
            ),
          ),
          payload: jsonEncode(message.toMap()),
        );
      }
    });

    // on Message Opened App
    FirebaseMessaging.onMessageOpenedApp
        .listen(NotificationHelper.instance.navigateToPage);
  }
}
