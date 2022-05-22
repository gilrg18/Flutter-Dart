//SHA1: 4A:AB:94:AC:4B:9D:52:19:97:00:36:C8:3B:44:12:14:09:FF:C9:41

import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {
  //instancia de firebasemessaging
  //todo static porque no quiero crear una instancia de la clase
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;
  //es un string pero puede ser lo que quieras (mapas,lista, etc)
  // ignore: prefer_final_fields
  static StreamController<String> _messageStream = StreamController.broadcast();
  //con este get solo expongo el stream y la gente se puede suscribir a el o estar escuchandolo muy facilmente
  //nos suscribimos en el main.dart donde dice //Context
  static Stream<String> get messagesStream => _messageStream.stream;

  //Escuchar notificaciones - onBackground, onMessage on OpenedApp
  static Future _backgroundHandler(RemoteMessage message) async {
    print('onBackground Handler ${message.data}');
    //cuando recibo una notificacion, lo agrego al stream (por ahora solo es el titulo de la notificacion)
    _messageStream.add(message.notification?.title ?? 'No title');
  }

  static Future _onMessageHandler(RemoteMessage message) async {
    print('onMessage Handler ${message.data}');
    _messageStream.add(message.notification?.title ?? 'No title');
  }

  static Future _onMessageOpenApp(RemoteMessage message) async {
    print('onMessageOpenApp Handler ${message.data}');
    _messageStream.add(message.notification?.title ?? 'No title');
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

  static closeStreams() {
    _messageStream.close();
  }
}
