import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  const AuthBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red,
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: const [
          _PurpleBox(),
        ],
      ), //stack coloca widgets uno encima de otro
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
          Positioned(child: _Bubble(), top: 90, left: 60),
          Positioned(child: _Bubble(), top: 90, left: 240),
          Positioned(child: _Bubble(), top: 90, right: 20),
          Positioned(child: _Bubble(), bottom: 40, left: 20),
          Positioned(child: _Bubble(), bottom: 40, left: 200),
          Positioned(child: _Bubble(), bottom: 40, right: 60),
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
