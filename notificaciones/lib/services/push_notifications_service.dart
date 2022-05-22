//SHA1: 4A:AB:94:AC:4B:9D:52:19:97:00:36:C8:3B:44:12:14:09:FF:C9:41

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {
  //instancia de firebasemessaging
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;

  //Escuchar notificaciones - onBackground, onMessage on OpenedApp
  static Future _backgroundHandler(RemoteMessage message) async {
    print('onBackground Handler ${message.messageId}');
  }

  static Future _onMessageHandler(RemoteMessage message) async {
    print('onMessage Handler ${message.messageId}');
  }

  static Future _onMessageOpenApp(RemoteMessage message) async {
    print('onMessageOpenApp Handler ${message.messageId}');
  }

  static Future initializeApp() async {
    //-push notifications-
    //generar token
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();
    print('token $token');

    //Handlers
    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);

    //Local notifications
  }
}
