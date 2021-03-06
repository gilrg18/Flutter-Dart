import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:notificaciones/screens/home_screen.dart';
import 'package:notificaciones/screens/message_screen.dart';
import 'package:notificaciones/services/push_notifications_service.dart';

void main() async {
  //para inicializar un contexto antes de las push notifications,
  //si no inicializamos se ondea el pushnotifications y no jala porque no tiene contexto
  WidgetsFlutterBinding.ensureInitialized();

  await PushNotificationService.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();

    //para cuando la app este completamente cerrada
    PushNotificationService.messaging
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
        print('MyApp: ${message.data}');

        navigatorKey.currentState
            ?.pushNamed('message', arguments: message.data);
        final snackBar = SnackBar(content: Text(message.data['product']));
        messengerKey.currentState?.showSnackBar(snackBar);
      }
    });

    //Context
    PushNotificationService.messagesStream.listen((message) {
      print('MyApp Gil: $message');

      //Navigator.pushNamed(context, 'message');
      //para ir a la pantalla de mensajes cuando llega la notificacion
      navigatorKey.currentState?.pushNamed('message', arguments: message);
      //snackbar es un mensaje abajo de la pantalla
      //Para mostrar todos los datos en el snackbar, (no es necesario, con el nombre del producto esta bien)
      // for (var v in message.values) {
      //   final snackBar = SnackBar(content: Text(v));
      //   messengerKey.currentState?.showSnackBar(snackBar);
      // }
      final snackBar = SnackBar(content: Text(message["product"]));
      messengerKey.currentState?.showSnackBar(snackBar);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      navigatorKey: navigatorKey, //Navegar
      scaffoldMessengerKey: messengerKey, //Mostrar snacks
      routes: {
        //en el _ estaria el buildcontext pero no se necesita entonces asi se ve mas sencillo el codigo
        'home': (_) => const HomeScreen(),
        'message': (_) => const MessageScreen(),
      },
    );
  }
}
