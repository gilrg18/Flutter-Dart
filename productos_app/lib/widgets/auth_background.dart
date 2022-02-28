// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  const AuthBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red,
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          const _PurpleBox(),
          const _HeaderIcon(),
          child,
        ],
      ), //stack coloca widgets uno encima de otro
    );
  }
}

class _HeaderIcon extends StatelessWidget {
  const _HeaderIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      //Safe area por si el celular tiene una madre negra tapando la pantalla
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 50),
        child: const Icon(
          Icons.person_pin,
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}

class _PurpleBox extends StatelessWidget {
  const _PurpleBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * .4,
      decoration: _purpleBackground(),
      child: Stack(
        children: const [
          Positioned(child: _Bubble(), top: 70, left: 40),
          Positioned(child: _Bubble(), top: 110, right: 40),
          Positioned(child: _Bubble(), bottom: 20, left: 40),
          Positioned(child: _Bubble(), bottom: -40, right: 40),
        ],
      ),
    );
  }

  BoxDecoration _purpleBackground() => const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(63, 63, 156, 1),
            Color.fromRGBO(90, 80, 178, 1),
          ],
        ),
      );
}

class _Bubble extends StatelessWidget {
  const _Bubble({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: const Color.fromRGBO(255, 255, 255, .05)),
    );
  }
}
